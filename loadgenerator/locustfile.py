#!/usr/bin/python

import random
from locust import HttpUser, TaskSet, between

products = [
    '100',
    '200',
    '300',
    '400',
    '500',
    '600',
    '700']

def index(l):
    l.client.get("/")

def browseCatalog(l):
    l.client.get("/item/" + random.choice(products))

def viewCart(l):
    l.client.get("/checkout")

def addToCart(l):
    product = random.choice(products)
    l.client.get("/cart/" + product)

def checkout(l):
    addToCart(l)
    l.client.post("/order", {
        'email': 'someone@example.com',
        'street_address': '1600 Amphitheatre Parkway',
        'zip_code': '94043',
        'city': 'Mountain View',
        'state': 'CA',
        'country': 'United States',
        'credit_card_number': '4432-8015-6152-0454',
        'credit_card_expiration_month': '1',
        'credit_card_expiration_year': '2039',
        'credit_card_cvv': '672',
    })

class UserBehavior(TaskSet):

    def on_start(self):
        index(self)

    tasks = {index: 1,
        browseCatalog: 10,
        addToCart: 2,
        viewCart: 3,
        addToCart: 3,
        checkout: 1}

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(1, 10)
