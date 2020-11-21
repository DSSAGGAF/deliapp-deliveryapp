from flask import Blueprint
from flask_restful import Api
from resources.Hello import Hello
from resources.Register import Register
from resources.Login import Login
from resources.Requseted_Order import Requseted_Order
from resources.Completed_Order import Completed_Order
# from resources.UserProfile import UserProfile




api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Hello, '/Hello')

api.add_resource(Register, '/register')

api.add_resource(Login, '/login')

api.add_resource(Requseted_Order, '/requset_order')

api.add_resource(Completed_Order, '/completed_order')

# api.add_resource(UserProfile, '/userProfile')


