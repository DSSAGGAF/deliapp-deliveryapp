from flask_restful import Resource
from flask import request
from model import db, Accepted_Order, User


class MyOrderUser(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(user_id=json_data['user_id']).first()
        if not user:
            return {'message': 'User ID not available'}, 400


        orders = Accepted_Order.query.filter_by(user_id=json_data['user_id'] ).all()
        order_list = []

        for i in range(0, len(orders)):
            user = User.query.filter_by(user_id = orders[i].driver_id)
            order_list.append(orders[i].serialize2(user[0].username))

        return {'data':order_list}, 201   
