from flask import Flask,request
from flask_socketio import SocketIO, send , emit 
import json
from model import  db,User,Accepted_Order

def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_object(config_filename)
    
    from app import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')

    from model import db
    db.init_app(app)


    # app.register_blueprint(url_prefix='/chat')

    return app
users = {}
app = create_app("config")
socketio = SocketIO(app , cors_allowed_origins='*',logger=True, engineio_logger=True)

@socketio.on('priv_msg')
def handle_priv_msg(json_data):
    payload = json.loads(json_data)
    recipient_session_id = users[payload['username']]
    message = payload['message']
    emit('new_private_message', message, room=recipient_session_id)
    print('received event: ')

@socketio.on('username')
def handle_username(username):
    users[username] = request.sid
    print('user added: ' )

@socketio.on('otehrUsernameDriver')
def handle_otherUsername(data):
    accepted_order = Accepted_Order.query.filter_by(order_id=data).first()
    user = User.query.filter_by(user_id=accepted_order.user_id).first()
    result = User.serialize(user)
    emit("otherUserData",{"status": 'success', 'data': result})
    print("info has been snt")
@socketio.on('otehrUsernameCustomer')
def handle_otherUsername(data):
    accepted_order = Accepted_Order.query.filter_by(order_id=data).first()
    user = User.query.filter_by(user_id=accepted_order.driver_id).first()
    result = User.serialize(user)
    emit("otherUserData",{"status": 'success', 'data': result})
    print("info has been snt")
    
@socketio.on('connect')
def handle_connect():
    print('user connect: ' )
@socketio.on('disconnect')
def disconnect():
    print('Client disconnected')
if __name__ == "__main__":
    # app.debug = True
    # socketio = SocketIO(app , cors_allowed_origins='*')
    # app.run(host='0.0.0.0', port = 5000)
    socketio.run(app,debug=True,host='0.0.0.0', port = 5000)