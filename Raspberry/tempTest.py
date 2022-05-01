import sys
import adafruit_dht
import time

while True:

    humidity, temperature = adafruit_dht.read_retry(11, 27)

    print ('Temp: {0:0.1f} C  Humidity: {1:0.1f} %'.format(temperature, humidity))
    time.sleep(1)
