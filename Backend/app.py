from flask import Blueprint
from flask_restful import Api
from resources.Hello import Hello
from resources.Register import Register
from resources.Login import Login


api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Hello, '/Hello')

api.add_resource(Register, '/register')

api.add_resource(Login, '/login')

