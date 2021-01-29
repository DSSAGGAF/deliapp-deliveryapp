from flask_restful import Resource
from flask import request
from sqlalchemy import engine
from model import db, Accepted_Order, User, Requset_Order

class Payment(Resource):
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

        user.userBalance =user.userBalance + json_data['balance']
        db.session.commit()

        

        return {"status": 'success'}, 201