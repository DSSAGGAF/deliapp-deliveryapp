from flask_restful import Resource
from flask import request
from sqlalchemy import engine
from model import db, Accepted_Order, User, Requset_Order
import random
import string


class Complete_Order(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        accepted_order = Accepted_Order.query.filter_by(order_id=json_data['order_id']).first()
        if not Accepted_Order:
            return {'message': 'order ID not available'}, 400
                

        accepted_order.complete= True
        
        db.session.commit()

        result = Accepted_Order.serialize(accepted_order)

        return {"status": 'success', 'data': result}, 201
