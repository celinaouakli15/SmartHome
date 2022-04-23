import firebase_admin

from firebase_admin import credentials

from firebase_admin import db
from time import sleep

import RPi.GPIO as GPIO #Importe la bibliothèque pour contrôler les GPIOs

GPIO.setmode(GPIO.BOARD) #Définit le mode de numérotation (Board)
GPIO.setwarnings(False) #On désactive les messages d'alerte

LED = 7 #Définit le numéro du port GPIO qui alimente la led
GPIO.setup(LED, GPIO.OUT) #Active le contrôle du GPIO

state = GPIO.input(LED) #Lit l'état actuel du GPIO, vrai si allumé, faux si éteint


cred = credentials.Certificate('/home/celinaouakli/SmartHouse/cred.json')

# Initialize the app with a service account, granting admin privileges

firebase_admin.initialize_app(cred, {

    'databaseURL': 'https://smarthouse-d41a0-default-rtdb.firebaseio.com/'

})



def getMessage():
    ref = db.reference('led1')
    return ref.get()
    



print ('Ok !')

while True:
    ref = getMessage()
    print(ref)
    if (state and ref=="off"):
        GPIO.output(LED, GPIO.LOW) #On l’éteint
    if (not state and ref=="on"):
        GPIO.output(LED, GPIO.HIGH) #On l'allume
    else :
        GPIO.output(LED, GPIO.LOW) #On l’éteint
    sleep(5)
