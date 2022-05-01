import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from google.cloud import firestore
#from datetime import datetime, timedelta
from firebase_admin import db


cred = credentials.Certificate('/home/celinaouakli/SmartHouse/cred.json')

firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://smarthouse-d41a0-default-rtdb.firebaseio.com/'
})



def getData():
    led1 = db.reference("led1")
    led2 = db.reference("led2")
    data = dict()

    data['led1'] = led1.get()
    data['led2'] = led2.get()
    return data

