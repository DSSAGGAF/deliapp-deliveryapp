from flask_restful import Resource
from flask import request
from model import db, User, Accepted_Order, Notification
import random
import string


class NotificationAPI(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(user_id=json_data['user_id']).first()
        if not user:
            return {'message': 'Username does not exist'}, 400

        accepted_order = Accepted_Order.query.filter_by(
            order_id=json_data['order_id']).first()

        if not accepted_order:
            return {'message': 'order ID not available'}, 400

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
