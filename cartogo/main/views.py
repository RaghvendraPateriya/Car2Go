# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import datetime

from django.db.models import Q
from django.contrib.auth import authenticate
from django.shortcuts import render
from django.views.generic import View, TemplateView
from django.http import HttpResponse

from .models import BookingHistory, Car, Users

class Index(TemplateView):
  template_name = "index.html"

class LoginView(View):
   def get(self, request, *args, **kwargs):
     return render(request, "login_registration.html")
     
   def post(self, request, *args, **kwargs):
     user_name = request.POST.get('username')
     passd = request.POST.get('password')
     if user_name and passd:
       print "USER = > %s || password = > %s " %(user_name, passd)
       user = authenticate(username=user_name, password=passd)
       if user is not None:
         return  HttpResponse("<h1>successfully logged in</h1>")
       else:
         return render(request, "login_registration.html",
                       {'status' : "Wrong Credential, Please Enter Again"})

class RegistrationView(View):
   def get(self, request, *args, **kwargs):
      return  HttpResponse("This method not allowed")

   def post(self, request, *args, **kwargs):
      username = request.POST.get("username")
      email = request.POST.get("email")
      password = request.POST.get("password")
      first_name = request.POST.get("first_name")
      last_name = request.POST.get("last_name")
      if username and email and password and first_name and last_name:
        try:
          user_obj = Users(username=username, email=email, first_name=first_name,
                           last_name=last_name, address_id=100, doc_id=1)
          user_obj.set_password(password)
          #user_obj.save()
          return HttpResponse("""<h3 style="color: green;">
                              You Have been successfully register..
                              <a href="index"> click here </a>"""   )
        except Exception, e:
          print "=== ERROR ==== ", str(e)
          return render(request, "login_registration.html",
                       {'status' : "someting went wrong while creating User.."})
           
      else:
         return render(request, "login_registration.html",
                       {'status' : "Registraion Faild Please check the input again"})
      

class CarSearchView(View):
   template_name = "index.html"

   def get(self, request, *args, **kwargs):
     return render(request, self.template_name)
  
   def post(self, request, *args, **kwargs):
     start_datetime = request.POST.get("start_datetime")
     end_datetime = request.POST.get("end_datetime")
     print "== start_datetime ===>", start_datetime
     if start_datetime and end_datetime:
       st_dt = datetime.datetime.strptime(start_datetime,"%m/%d/%Y %I:%M %p").strftime("%Y-%m-%d %H:%M:%S")
       ed_dt = st_dt = datetime.datetime.strptime(end_datetime,"%m/%d/%Y %I:%M %p").strftime("%Y-%m-%d %H:%M:%S")
     else:
       return HttpResponse("Both Start and End date required and start Date < end Date")
     #TODO - need to add status and testing
     cars = Car.objects.exclude(
                Q(bookinghistory__start_datetime__range = [st_dt, ed_dt]) | 
                Q(bookinghistory__end_datetime__range = [st_dt, ed_dt]));
     return render(request, "car_list.html", {"cars" : cars})
