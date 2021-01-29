from flask_restful import Resource
from flask import request
from sqlalchemy import engine
from model import db, Accepted_Order, User, Requset_Order

class Payment(Resource):
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(user_id=json_data['user_id']).first()
        if not user:
            return {'message': 'Username does not exist'}, 400

        user.userBalance =user.userBalance + json_data['balance']
        db.session.commit()

        

        return {"status": 'success'}, 201