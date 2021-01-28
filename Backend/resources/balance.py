from flask_restful import Resource
from flask import request
from sqlalchemy import engine
from model import db, Accepted_Order, User, Requset_Order

class Balance(Resource):
    def get(self):
        argus = request.args
        if not argus:
            return {'message': 'No input data provided'}, 400
        user =  User.query.filter_by(user_id=argus['user_id']).first()
        if not user:
            return {'message': 'Username does not exist'}, 400   
        orders = Accepted_Order.query.filter_by(driver_id=argus['user_id'],complete=True).all()
        balance = 0
        for order in orders:
            balance = balance + order.price
        balance = (balance * 0.1*-1)+user.userBalance
        return {"balance":balance },201
        