import time
import board
import adafruit_dht
import RPi.GPIO as GPIO #Importe la bibliothèque pour contrôler les GPIOs
from FirestoreManager import setData

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.cleanup()



# Initial the dht device, with data pin connected to:
dhtDevice = adafruit_dht.DHT11(board.D23)


# vous pouvez passer DHT22 use_pulseio=False si vous ne souhaitez pas utiliser pulseio.
# Cela peut être nécessaire sur un ordinateur monocarte Linux comme le Raspberry Pi,
# mais cela ne fonctionnera pas dans CircuitPython.
# dhtDevice = adafruit_dht.DHT22(board.D18, use_pulseio=False)




def tempHumi():
    try:

        # Print the values to the serial port
        temperature_c = dhtDevice.temperature
        temperature_f = temperature_c * (9 / 5) + 32
        humidity = dhtDevice.humidity
        celsius= "{:.1f} C".format(temperature_c)
        fahrenheit = "{:.1f} F".format(temperature_f)
        humidity = "{}% ".format(humidity)
        info = {'temperature_c' : celsius , 'temperature_f': fahrenheit, 'humidity':humidity}
        print(info)
        setData(info)  # envoyer à la db les infos
        print(
            "Temp: {:.1f} F / {:.1f} C    Humidity: {}% ".format(
                temperature_f, temperature_c, humidity
            )
        )

    except RuntimeError as error:
        # Errors happen fairly often, DHT's are hard to read, just keep going
        print(error.args[0])
        time.sleep(2.0)
        #continue
    except Exception as error:
        dhtDevice.exit()
        raise error
    