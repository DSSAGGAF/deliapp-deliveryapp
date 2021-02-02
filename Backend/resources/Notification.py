from flask_restful import Resource
from flask import request,make_response
from model import db, User, Accepted_Order, Notification
import random
import string
import json


class NotificationAPI(Resource):
    def post(self):
        json_data = request.get_json(force=True)
        header = request.headers["Authorization"]
        
        if not json_data:
            
            return {'message': 'No input data provided'}, 400
        if not header:
            return {"Messege" : "No api key!"}, 401
        else:
            user = User.query.filter_by(api_key=header).first()
        if not user:
            return {'message': 'User ID not available'}, 402

        accepted_order = Accepted_Order.query.filter_by(
            order_id=json_data['order_id']).first()

        if not accepted_order:
            return {'message': 'order ID not available'}, 403

        notification = Notification(
            user_id=json_data['user_id'],
            order_id=json_data['order_id'],
            notification_content=json_data['notification_content'],
            driver_mode = user.driver_mode
        )
        db.session.add(notification)
        db.session.commit()

        result = Notification.serialize(notification)

        return {"status": 'success', 'data': result}, 201

    def get(self):
        header = request.headers["Authorization"]
        if not header:
            return {"Messege" : "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
        if not user:
            return {'message': 'User ID not available'}, 400  

        notification = Notification.query.filter_by(user_id=user.user_id,driver_mode = user.driver_mode).all()
        notification_list = []
        for i in range(0, len(notification)):
            notification_list.append(notification[len(notification)-i-1].serialize())

        todo = {'data': notification_list}
        r = make_response((json.dumps(todo),
                       201,
                       {'Content-Type': 'application/json',
                        'Connection': 'keep-alive'}))
                        
        return r  
        return {'data':notification_list}, 201
        