import sys
import matplotlib.pyplot as plt 
import cv2 as cv
import numpy as np

if (len(sys.argv) < 2):
	print("FindCircles.py <input image>")
elif (len(sys.argv) > 2):
	print("FindCircles.py <input image>")
else:
	print(sys.argv[1])
	img_file = sys.argv[1]
	
img = cv.imread(img_file)
g_img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
#circles = cv.HoughCircles(g_img, cv.HOUGH_GRADIENT, 1,2)
circles = cv.HoughCircles(g_img,cv.HOUGH_GRADIENT,1,2, param1=100,param2=20,minRadius=0,maxRadius=10)

circles = np.uint16(np.around(circles))
for i in circles[0,:]:
    # draw the outer circle
    cv.circle(img,(i[0],i[1]),i[2],(0,255,0),2)
    # draw the center of the circle
    cv.circle(img,(i[0],i[1]),2,(0,0,255),3)

cv.imshow('detected circles',img)
cv.waitKey(0)
cv.destroyAllWindows()

