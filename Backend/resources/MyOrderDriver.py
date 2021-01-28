from flask_restful import Resource
from flask import request,make_response
from model import db, Accepted_Order, User
import json


class MyOrderDriver(Resource):
    def get(self):
        argus = request.args

        if not argus:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(user_id=argus['user_id']).first()
        if not user:
            return {'message': 'User ID not available'}, 400

        orders = Accepted_Order.query.filter_by(driver_id=argus['user_id'] , complete=True ).all()
        order_list = []

        for i in range(0, len(orders)):
            user = User.query.filter_by(user_id = orders[i].user_id)
            order_list.append(orders[i].serialize2(user[0].username))

        todo = {'data': order_list}
        r = make_response((json.dumps(todo),
                       201,
                       {'Content-Type': 'application/json',
                        'Connection': 'keep-alive'}))
                        
        return r      

        return {'data':order_list}, 201   
