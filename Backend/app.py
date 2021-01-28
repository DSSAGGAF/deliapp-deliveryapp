from flask import Blueprint
from flask_restful import Api
from resources.Hello import Hello
from resources.Register import Register
from resources.Login import Login
from resources.Requseted_Order import Requseted_Order
from resources.Accpet_Order import Accpet_Order
from resources.changeMode import ChangeMode
from resources.UserProfile import UserProfile
from resources.OtherUserName import OtherUserName
from resources.MyOrderUser import MyOrderUser
from resources.MyOrderDriver import MyOrderDriver
from resources.Notification import NotificationAPI
from resources.NotificationSeen import NotificationSeen
from resources.Complete_Order import Complete_Order
from resources.balance import Balance
from resources.payment import Payment

# from resources.UserProfile import UserProfile




api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Hello, '/Hello')

api.add_resource(Register, '/register')

api.add_resource(Login, '/login')

api.add_resource(Requseted_Order, '/requset_order')

api.add_resource(Accpet_Order, '/accpet_order')

api.add_resource(ChangeMode, '/changeMode')

api.add_resource(UserProfile, '/userProfile')

api.add_resource(OtherUserName, '/OtherUserName')

api.add_resource(MyOrderUser, '/myOrderUser')

api.add_resource(MyOrderDriver, '/myOrderDriver')

api.add_resource(NotificationAPI, '/notification')

api.add_resource(NotificationSeen, '/NotificationSeen')

api.add_resource(Complete_Order, '/Complete_Order')

api.add_resource(Balance, '/Balance')

api.add_resource(Payment, '/Payment')





