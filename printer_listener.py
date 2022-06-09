#!/usr/bin/env python3
import serial
import requests

def start(device, port, timeout):
    if __name__ == '__main__':
        print('Starting up')
        serialConnection = SerialConnection(device, port, timeout)
        serialConnection.reset()
        print('Hey Listen!')
        listen(serialConnection)


def listen(serialConnection):
    counter = 1
    while True:
        if serialConnection.isInWaiting() :
            interfaceID = serialConnection.connection.readline().decode('utf-8').rstrip()
            interfaces = interfaceID.split(',')[:-1]

            for interface in interfaces:
                tellerstand = requests.patch(f'http://192.168.1.213:8005/api/Printer/{interface}')
                print(f'{counter}. Written new tellerstand to interface: {interface}')
                counter = counter + 1


class SerialConnection():
    def __init__(self, device, port, timeout) -> None:
        self.connection = serial.Serial(device, port, timeout=timeout)

    def reset(self):
        self.connection.reset_input_buffer()

    def isInWaiting(self):
        return self.connection.in_waiting > 0