# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import datetime

from django.shortcuts import render
from django.views.generic import View, TemplateView
from django.http import HttpResponse


class Index(TemplateView):
  template_name = "index.html"


class CarSearchView(View):
   template_name = "index.html"

   def get(self, request, *args, **kwargs):
     return render(request, self.template_name)
  
   def post(self, request, *args, **kwargs):
     """ 
      st_dt = "2017-05-21 18:56:24"
      ed_dt = "2017-05-23 18:56:24"

      k = Car.objects.get(bokinghistory__booking_id = 1);
      k = Car.objects.exclude(bokinghistory__start_datetime__range = ["2017-05-21 18:56:24", "2017-05-23 18:56:24"]);

     """
     start_datetime = request.POST.get("start_datetime")
     end_datetime = request.POST.get("end_datetime")
     print start_datetime, "==========", end_datetime
     if start_datetime and end_datetime:
       st_dt = datetime.datetime.strptime(k,"%m/%d/%Y %I:%M %p").strftime("%Y-%m-%d %H:%M:%S")
       ed_dt = st_dt = datetime.datetime.strptime(k,"%m/%d/%Y %I:%M %p").strftime("%Y-%m-%d %H:%M:%S")
     else:
         return HttpResponse("Both Start and End date required and start Date < end Date")

     #Car.objects.all().exclude(Q(BokingHistory.start_datetime_range = [st_dt, ed_dt]) |
     #                            Q(BokingHistory.end_datetime_range = [st_dt, ed_dt]))
      
            

