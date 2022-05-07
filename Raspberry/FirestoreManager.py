import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
#from google.cloud import firestore


cred = credentials.Certificate('/home/celinaouakli/SmartHouse/cred.json') # cred c'est un certificat qu'on récupère depuis les param de firebase pour nous connecté

firebase_admin.initialize_app(cred, {
     'databaseURL': 'https://smarthouse-d41a0-default-rtdb.firebaseio.com/' # url de notre firestore
})

db = firestore.client()  # notre db 


def getData(): # fonction qui récupère les données depuis la db
    data = dict() 
    ledCollection = db.collection('Led') # get la collection Led 
    leds = ledCollection.stream() # transformer en un objet itérable 
    for led in leds:
        data[led.id] = led.to_dict() #on parcourt et on stock dans le dict data
    return data

def setData(info): # pour envoyer les données à la db
    doc_ref = db.collection('temps').document('temp')  # recupérer la ref de la collection temps 
    doc_ref.set(info) # send les infos à la table temp

