from flask_restful import Resource
from flask import request
from model import db, User
import random
import string

class ChqngeMode(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(user_id=json_data['user_id']).first()
        if not user:
            return {'message': 'User ID not available'}, 400
        user.driver_mode =  json_data['driver_mode']
        db.session.commit()
        result = User.serialize(user)

        return {"status": 'success', 'data': result}, 201

