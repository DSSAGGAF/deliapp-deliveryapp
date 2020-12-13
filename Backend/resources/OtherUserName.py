from flask_restful import Resource
from flask import request
from model import Requset_Order, db, User
import random
import string


class OtherUserName(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400
        order = Requset_Order.query.filter_by(
            order_id=json_data['order_id']).first()
        if not order:
            return {'message': 'order ID not available'}, 400

        user = User.query.filter_by(user_id=order.user_id).first()
        if not user:
            return {'message': 'User ID not available'}, 400

        return {"status": 'success', 'data': user.username}, 201
