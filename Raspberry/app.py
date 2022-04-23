from pickle import TRUE
from FirebaseManager import getData
from time import sleep
import RPi.GPIO as GPIO #Importe la bibliothèque pour contrôler les GPIOs

GPIO.setmode(GPIO.BOARD) #Définit le mode de numérotation (Board)
GPIO.setwarnings(False) #On désactive les messages d'alerte



leds = {'led1' : 7 , 'led2' : 12}

data = getData()


def activateGPO(LED):
    GPIO.setup(LED, GPIO.OUT)

def stateLED(LED):
    return GPIO.input(LED)

def onGPIO(LED):
    GPIO.output(LED, GPIO.HIGH)

def offGPIO(LED):
    GPIO.output(LED, GPIO.LOW)

def led(obj,led,data):
    if not stateLED(led) and data.get(obj) == "on":
        print("il est on", obj, led)
        GPIO.output(led, GPIO.HIGH)
    if stateLED(led) and data.get(obj) == "off":
        print("il est off", obj, led)
        offGPIO(led)

        


def main ():
    print("Server listening")
    for i in leds:
        activateGPO(leds[i])

    while True:
        data = getData()
        print(data)
        for obj in data :
            led(obj, leds[obj],data)
          


       


        
        




if __name__ == '__main__':
    main()
    