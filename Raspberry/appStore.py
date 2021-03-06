from FirestoreManager import getData
from time import sleep
import RPi.GPIO as GPIO #Importe la bibliothèque pour contrôler les GPIOs
from temperature import tempHumi


GPIO.cleanup()
GPIO.setmode(GPIO.BCM) #Définit le mode de numérotation (Board) /// GPIO.BOARD
GPIO.setwarnings(False) #On désactive les messages d'alerte


connectedObjects = {'led1' : 4 , 'led2' : 18} # pour savoir quel port => se référer à la doc du GPIO

def activateGPO(LED): # prend en paramètre le numero du port et l'active
    GPIO.setup(LED, GPIO.OUT)

def stateLED(LED): # prend en param le num du port et renvoi true s'il est allumé false sinon
    return GPIO.input(LED)

def led(led,status): # prend en param le num du port et le status et agit 
    if not stateLED(led) and status:
        GPIO.output(led, GPIO.HIGH)
    if stateLED(led) and not status:
        GPIO.output(led, GPIO.LOW)


def main ():
    print("Server listening")
    for i in connectedObjects: # boucle pour activer tous les ports qui sont dans connectedObjects
        activateGPO(connectedObjects[i])

    while True:
        tempHumi()
        data = getData()
        print(data)
        for obj in data :
            if obj in connectedObjects:
                led(connectedObjects[obj],data[obj]['status'])
        sleep(5)
          

if __name__ == '__main__':
    main()