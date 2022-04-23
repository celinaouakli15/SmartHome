import firebase_admin

from firebase_admin import credentials

from firebase_admin import db
from time import sleep

cred = credentials.Certificate('/home/celinaouakli/SmartHouse/cred.json')

# Initialize the app with a service account, granting admin privileges

firebase_admin.initialize_app(cred, {

    'databaseURL': 'https://smarthouse-d41a0-default-rtdb.firebaseio.com/'

})



def getMessage():
    ref = db.reference('message')
    print(ref.get())
    



print ('Ok !')

while True:
    getMessage()
    sleep(5)
    
