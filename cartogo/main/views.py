# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import datetime

from django.db.models import Q
from django.shortcuts import render
from django.views.generic import View, TemplateView
from django.http import HttpResponse

from .models import Car, BookingHistory

class Index(TemplateView):
  template_name = "index.html"


class CarSearchView(View):
   template_name = "index.html"

   def get(self, request, *args, **kwargs):
     return render(request, self.template_name)
  
   def post(self, request, *args, **kwargs):
     start_datetime = request.POST.get("start_datetime")
     end_datetime = request.POST.get("end_datetime")
     if start_datetime and end_datetime:
       st_dt = datetime.datetime.strptime(start_datetime,"%m/%d/%Y %I:%M %p").strftime("%Y-%m-%d %H:%M:%S")
       ed_dt = st_dt = datetime.datetime.strptime(end_datetime,"%m/%d/%Y %I:%M %p").strftime("%Y-%m-%d %H:%M:%S")
     else:
       return HttpResponse("Both Start and End date required and start Date < end Date")
     
     cars = Car.objects.exclude(
                Q(bookinghistory__start_datetime__range = [st_dt, ed_dt]) | 
                Q(bookinghistory__end_datetime__range = [st_dt, ed_dt]));
     return render(request, "car_list.html", {"cars" : cars})
      
            

