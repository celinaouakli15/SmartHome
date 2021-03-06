from FirebaseManager import getData
from time import sleep
import RPi.GPIO as GPIO #Importe la bibliothèque pour contrôler les GPIOs

GPIO.setmode(GPIO.BOARD) #Définit le mode de numérotation (Board)
GPIO.setwarnings(False) #On désactive les messages d'alerte



connectedObjects = {'led1' : 7 , 'led2' : 12}




def activateGPO(LED): # prend en paramètre le numero du port et l'active
    GPIO.setup(LED, GPIO.OUT)

def stateLED(LED): # prend en param le num du port et renvoi true s'il est allumé false sinon
    return GPIO.input(LED)

def led(obj,led,data):
    if not stateLED(led) and data.get(obj) == "on":
        GPIO.output(led, GPIO.HIGH)
    if stateLED(led) and data.get(obj) == "off":
        GPIO.output(led, GPIO.LOW)

        


def main ():
    print("Server listening")
    for i in connectedObjects:
        activateGPO(connectedObjects[i])

    while True:
        data = getData()
        print(data)
        for obj in data :
            led(obj, connectedObjects[obj],data)
          


       


        
        




if __name__ == '__main__':
    main()
    