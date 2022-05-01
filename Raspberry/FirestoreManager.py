import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
#from google.cloud import firestore


cred = credentials.Certificate('/home/celinaouakli/SmartHouse/cred.json')

firebase_admin.initialize_app(cred, {
     'databaseURL': 'https://smarthouse-d41a0-default-rtdb.firebaseio.com/'
})

db = firestore.client()


def getData():
    data = dict()
    ledCollection = db.collection('Led')
    leds = ledCollection.stream()
    for led in leds:
        data[led.id] = led.to_dict()
    
    return data

def setData(info):
    doc_ref = db.collection('temps').document('temp')
    doc_ref.set(info)

