from flask import Flask
from flask.globals import request
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'user'

    user_id = db.Column(db.Integer(), primary_key=True)
    username = db.Column(db.String(), unique=True)
    firstname = db.Column(db.String())
    lastname = db.Column(db.String())
    password = db.Column(db.String())
    emailadress = db.Column(db.String())
    gender = db.Column(db.String())
    driver_mode = db.Column(db.Boolean, default=False)
    userBalance = db.Column(db.Float(), default=0.0)

    def __init__(self, firstname, lastname, emailadress, password, username, gender):
        self.firstname = firstname
        self.lastname = lastname
        self.emailadress = emailadress
        self.password = password
        self.username = username
        self.gender = gender

    def __repr__(self):
        return '<user_id {}>'.format(self.user_id), '<driver_mode {}>'.format(self.driver_mode)

    def serialize(self):
        return {
            'user_id': self.user_id,
            'username': self.username,
            'firstname': self.firstname,
            'lastname': self.lastname,
            'password': self.password,
            'emailadress': self.emailadress,
            'gender': self.gender,
            'driver_mode': self.driver_mode,
        }
    def userName(self):
        return{
            'username':self.username
        }


class Requset_Order(db.Model):
    __tablename__ = 'requset_order'

    order_id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('user.user_id'))
    request_title = db.Column(db.String())
    request_desc = db.Column(db.String())
    request_from = db.Column(db.String())
    request_to = db.Column(db.String())
    price = db.Column(db.Integer())

    def __init__(self, user_id, request_title, request_desc, request_from, request_to, price):
        self.user_id = user_id
        self.request_title = request_title
        self.request_desc = request_desc
        self.request_from = request_from
        self.request_to = request_to
        self.price = price

    def __repr__(self):
        return '<order_id {}>'.format(self.order_id)

    def serialize(self):
        return {
            'order_id': self.order_id,
            'user_id': self.user_id,
            'request_title': self.request_title,
            'request_desc': self.request_desc,
            'request_from': self.request_from,
            'request_to': self.request_to,
            'price': self.price,
        }
    def serialize2(self,userName):
        return {
            'order_id': self.order_id,
            'user_id': self.user_id,
            'request_title': self.request_title,
            'request_desc': self.request_desc,
            'request_from': self.request_from,
            'request_to': self.request_to,
            'price': self.price,
            'username': userName,
        }        


class Accepted_Order(db.Model):
    __tablename__ = 'accepted_order'

    order_id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('user.user_id'))
    request_title = db.Column(db.String())
    request_desc = db.Column(db.String())
    request_from = db.Column(db.String())
    request_to = db.Column(db.String())
    price = db.Column(db.Integer())
    driver_id = db.Column(db.Integer(), db.ForeignKey('user.user_id'))
    complete = db.Column(db.Boolean, default=False)

    def __init__(self, user_id, driver_id, order_id, request_title, request_desc, request_from, request_to, price):
        self.user_id = user_id
        self.driver_id = driver_id
        self.order_id = order_id
        self.request_title = request_title
        self.request_desc = request_desc
        self.request_from = request_from
        self.request_to = request_to
        self.price = price

    def __repr__(self):
        return '<order_id {}>'.format(self.order_id)

    def serialize(self):
        return {
            'order_id': self.order_id,
            'user_id': self.user_id,
            'request_title': self.request_title,
            'request_desc': self.request_desc,
            'request_from': self.request_from,
            'request_to': self.request_to,
            'price': self.price,
            'driver_id': self.driver_id,
            'complete': self.complete,
        }

    def serialize2(self,userName):
        return {
            'order_id': self.order_id,
            'user_id': self.user_id,
            'request_title': self.request_title,
            'request_desc': self.request_desc,
            'request_from': self.request_from,
            'request_to': self.request_to,
            'price': self.price,
            'username': userName,
            'complete': self.complete,

        }


class Notification(db.Model):
    __tablename__ = 'notification'

    notification_id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('user.user_id'))
    order_id = db.Column(db.Integer(), db.ForeignKey('accepted_order.order_id'))
    notification_content = db.Column(db.String())
    status = db.Column(db.Boolean, default=False)
    driver_mode = db.Column(db.Boolean)



    def __init__(self, user_id, order_id, notification_content,driver_mode):
        self.user_id = user_id
        self.order_id = order_id
        self.notification_content = notification_content
        self.driver_mode= driver_mode

    def __repr__(self):
        return '<notification_id {}>'.format(self.notification_id), '<status {}>'.format(self.status)

    def serialize(self):
        return {
            'notification_id': self.notification_id,
            'user_id': self.user_id,
            'order_id': self.order_id,
            'notification_content': self.notification_content,
            'status': self.status,
            'driver_mode': self.driver_mode,
        }