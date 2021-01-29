from flask_restful import Resource
from flask import request
from flask import Flask, Response, jsonify, make_response
from model import db, Accepted_Order, User
import json



class MyOrderUser(Resource):
    def get(self):
        header = request.headers["Authorization"]
        if not header:
            return {"Messege" : "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
        if not user:
            return {'message': 'User ID not available'}, 400

        orders = Accepted_Order.query.filter_by(user_id=user.user_id).all()
        order_list = []

        for i in range(0, len(orders)):
            user = User.query.filter_by(user_id=orders[i].driver_id)
            order_list.append(orders[i].serialize2(user[0].username))

        todo = {'data': order_list}
        r = make_response((json.dumps(todo),
                       201,
                       {'Content-Type': 'application/json',
                        'Connection': 'keep-alive'}))
                        
        return r  

    # return response
