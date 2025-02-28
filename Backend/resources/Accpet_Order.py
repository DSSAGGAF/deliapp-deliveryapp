from flask_restful import Resource
from flask import request
from model import db, Accepted_Order, User, Requset_Order



class Accpet_Order(Resource):
    def post(self):
        json_data = request.get_json(force=True)
        header = request.headers["Authorization"]
        
        if not json_data:
            return {'message': 'No input data provided'}, 400
        if not header:
            return {"Messege" : "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
        if not user:
            return {'message': 'User ID not available'}, 400

        requset_order = Requset_Order.query.filter_by(order_id=json_data['order_id']).first()
        if not requset_order:
            return {'message': 'order ID not available'}, 400
                
        accepted_order = Accepted_Order(
            user_id=requset_order.user_id,
            driver_id=json_data['driver_id'],
            order_id=json_data['order_id'],
            request_title=requset_order.request_title,
            request_desc=requset_order.request_desc,
            request_from=requset_order.request_from,
            request_to=requset_order.request_to,
            price=requset_order.price,
        )
        db.session.add(accepted_order)
        requset_order = Requset_Order.query.filter_by(order_id=json_data['order_id']).delete()
        
        db.session.commit()

        result = Accepted_Order.serialize(accepted_order)

        return {"status": 'success', 'data': result}, 201
    def get(self):
        header = request.headers["Authorization"]

        if not header:
            return {"Messege" : "No api key!"}, 401
        user = User.query.filter_by(api_key=header).first()
        if not user:
            return {'message': 'User ID not available'}, 401    
        argus = request.args
        if not argus:
            return {'message': 'No input data provided'}, 401

        accepted_Order = Accepted_Order.query.filter_by(order_id=argus['order_id']).first()
        if not accepted_Order:
            return {'message': 'order ID not available'}, 400

        result = Accepted_Order.serialize(accepted_Order)

        return {"status": 'success', 'data': result}, 201

