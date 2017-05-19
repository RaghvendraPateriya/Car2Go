# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from django.db import models
from django.contrib.auth.models import AbstractUser

class Address(models.Model):
  address_id = models.AutoField(primary_key=True)
  state12 = models.CharField(max_length=30)
  country123 = models.CharField(max_length=30)
  street = models.CharField(max_length=30)
  pin = models.IntegerField()
  contact_no123 = models.IntegerField()

class Document123(models.Model):
  DOC_TYPE = (
               ('DL', 'Driving Licence'),
               ('PAN', 'PAN CARD'),
               ('VI', 'VOTER ID'),
             )
  doc_id = models.AutoField(primary_key=True)
  doc_type = models.CharField(max_length=1, choices=DOC_TYPE)
  doc_url = models.SlugField()


class Company(models.Model):
  company_id = models.AutoField(primary_key=True)
  name = models.CharField(max_length=30)
  address = models.ForeignKey(Address)
  doc_id = models.ForeignKey(Document123)


class Users(AbstractUser):
  address = models.ForeignKey(Address)
  doc = models.ForeignKey(Document123)


class Car(models.Model):
  FULE_TYPE = (
               ('D', 'DISEL'),
               ('P', 'PETROL'),
               ('CNG', 'CNG'),
              )
  car_id = models.AutoField(primary_key=True)
  car_name = models.CharField(max_length=30)
  seater = models.IntegerField()
  fule_type = models.CharField(max_length=1, choices=FULE_TYPE)
  company = models.ForeignKey(Company)


class BokingHistory(models.Model):
  booking_id = models.AutoField(primary_key=True)
  car = models.ForeignKey(Car)
  start_datetime = models.DateTimeField()
  end_datetime = models.DateTimeField()
  user = models.ForeignKey(Users)

class TransactinHistory(models.Model):
  TRANSACTION_STATUS = (
                        ('S', 'Sucess'),
                        ('F', 'Fail'),
                        ('P', 'Pending'),
                       )
  transaction_id =  models.AutoField(primary_key=True)
  booking = models.ForeignKey(BokingHistory)
  payment = models.DecimalField(max_digits=3, decimal_places=1)
  status = models.CharField(max_length=1, choices=TRANSACTION_STATUS)
  datetime = models.DateTimeField()

