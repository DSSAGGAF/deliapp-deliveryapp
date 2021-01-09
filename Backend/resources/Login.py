from flask_restful import Resource
from flask import request
from model import db, User
import random
import string


class Login(Resource):

    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        
        user = User.query.filter_by(username=json_data['username']).first()
        if not user:
            return {'message': 'Username does not exist'}, 400

        if user.password != json_data['password']:
            return {'message': 'Password incorrect'}, 400

        # return User.serialize(user)
        result = User.serialize(user);      
        return {"status": 'success', 'data': result}, 201

