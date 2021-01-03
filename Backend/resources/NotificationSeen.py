from flask_restful import Resource
from flask import request
from model import db, User , Notification
class NotificationSeen(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        notification = Notification.query.filter_by(notification_id=json_data['notification_id']).first()
        if not Notification:
            return {'message': 'Notification id not available'}, 400

        notification.status =  True
        db.session.commit()
        result = Notification.serialize(notification)

        return {"status": 'success', 'data': result}, 201


