from flask_restful import Resource
from flask import request
from model import db, Requset_Order, User
import random
import string


class Requseted_Order(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(user_id=json_data['user_id']).first()
        if not user:
            return {'message': 'User ID not available'}, 400

        requset_order = Requset_Order(
            user_id=json_data['user_id'],
            request_title=json_data['request_title'],
            request_desc=json_data['request_desc'],
            request_from=json_data['request_from'],
            request_to=json_data['request_to'],
            price=json_data['price'],
        )
        db.session.add(requset_order)
        db.session.commit()

        result = Requset_Order.serialize(requset_order)

        return {"status": 'success', 'data': result}, 201

    def get(self):
        orders = Requset_Order.query.all()
        order_list = []
        for i in range(0, len(orders)):
            user = User.query.filter_by(user_id = orders[i].user_id)
            order_list.append(orders[i].serialize2(user[0].username))

        return {'data':order_list}, 201
