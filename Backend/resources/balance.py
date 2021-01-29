from flask_restful import Resource
from flask import request
from sqlalchemy import engine
from model import db, Accepted_Order, User, Requset_Order

class Balance(Resource):
    def get(self):
        header = request.headers["Authorization"]
        if not header:
            return {"Messege" : "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
        if not user:
            return {'message': 'User ID not available'}, 400
        orders = Accepted_Order.query.filter_by(driver_id=user.user_id,complete=True).all()
        balance = 0
        for order in orders:
            balance = balance + order.price
        balance = round((balance * 0.1*-1)+user.userBalance)
        return {"balance":balance },201
        