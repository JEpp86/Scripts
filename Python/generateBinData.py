import sys
import serial
import binascii
import time


if (len(sys.argv) < 5):
	print("generateBinDate.py <port> <baud> <period> <length>")
	exit()
elif (len(sys.argv) > 5):
	print("generateBinDate.py <port> <baud> <period> <length>")
	exit()
else:
	#print(sys.argv[1])
	port = sys.argv[1]
	baud = sys.argv[2]
	period = sys.argv[3]
	length = sys.argv[4]

ser = serial.Serial()
ser.baudrate = baud
ser.port = port
ser.open()
if ser.is_open == 0:
	print("Failed to open serial port")
	exit()

dat = bytearray()
for i in range (int(length)):
	num = (i%(0xFF))
	dat.append(num)

while True:
	ser.write(dat)
	print("Data Sent")
	time.sleep(int(period))