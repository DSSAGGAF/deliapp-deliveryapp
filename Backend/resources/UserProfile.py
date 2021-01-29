from flask_restful import Resource
from flask import request
from model import  db,User
import random
import string

class UserProfile(Resource):
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
        user.firstname = json_data["firstname"]
        user.lastname = json_data["lastname"]
        user.password = json_data["password"]
        user.emailadress = json_data["emailadress"]
        db.session.commit()
        result = User.serialize(user)

        return {"status": 'success', 'data': result}, 201
        
        
