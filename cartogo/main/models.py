# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from django.contrib.auth.models import AbstractUser

class Address(models.Model):
  address_id = models.AutoField(primary_key=True)
  state = models.CharField(max_length=30)
  country = models.CharField(max_length=30)
  street = models.CharField(max_length=30)
  pin = models.IntegerField()
  contact_no = models.IntegerField()

  class Meta:
    db_table = 'Address'

class Document(models.Model):
  DOC_TYPE = (
               ('DL',  'Driving Licence'),
               ('PAN', 'PAN CARD'),
               ('VI',  'VOTER ID'),
               ('TAN',  'TAN')
             )
  doc_id = models.AutoField(primary_key=True)
  doc_type = models.CharField(max_length=1, choices=DOC_TYPE)
  doc_url = models.SlugField()

  class Meta:
    db_table = 'Document'


class Company(models.Model):
  company_id = models.AutoField(primary_key=True)
  name = models.CharField(max_length=30)
  address = models.ForeignKey(Address)
  doc_id = models.ForeignKey(Document)

  class Meta:
    db_table = 'Company'


class Users(AbstractUser):
  address = models.ForeignKey(Address)
  doc = models.ForeignKey(Document)

  class Meta:
    db_table = 'Users'


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

  def __str__(self):
    return str(self.car_id)

  class Meta:
    db_table = 'Car'


class BookingHistory(models.Model):
  BOOKING_STATUS = (
                    ('P', 'Pending'), # Once payment done it will change to 'B'.
                    ('B', 'Booked'),
                    ('C', 'Cancelled')
                   )
  booking_id = models.AutoField(primary_key=True)
  car = models.ForeignKey(Car)
  start_datetime = models.DateTimeField()
  end_datetime = models.DateTimeField()
  user = models.ForeignKey(Users)
  status = models.CharField(max_length=1, choices=BOOKING_STATUS)

  class Meta:
    db_table = 'BookingHistory'


class TransactinHistory(models.Model):
  TRANSACTION_STATUS = (
                        ('S', 'Sucess'),
                        ('F', 'Fail'),
                        ('P', 'Pending'),
                       )
  transaction_id =  models.AutoField(primary_key=True)
  booking = models.ForeignKey(BookingHistory)
  payment = models.DecimalField(max_digits=3, decimal_places=1)
  status = models.CharField(max_length=1, choices=TRANSACTION_STATUS)
  datetime = models.DateTimeField()

  class Meta:
    db_table = 'TransactinHistory'

