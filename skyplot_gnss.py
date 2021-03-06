#Name: skyplot_gnss.py
#Description: A simple script to create a skyplot view for GNSS satellites.
#Author: R.S. Pissardini <rodrigo AT usp DOT br>

import numpy as np
import matplotlib.pyplot as plt
import math  

sv   = [1,2,3,4,5]
elev = [10,30,40,28,55]
azim = [100,200,211,345,321]

def skyplot (prn,e,az):

	ax = plt.subplot(111, projection='polar')
	ax.set_theta_zero_location("N")
	ax.set_theta_direction(-1)
	ax.set_ylim(0,90)
	ax.set_yticks(np.arange(0,91,30))
	ax.set_yticklabels(ax.get_yticks()[::-1])

	for sv, elev, azim in zip(prn, e, az):
	    ax.plot(math.radians(azim), 90-elev,color='green', marker='o', markersize=20)
	    ax.text(math.radians(azim), 90-elev, sv, ha='center', va='center',color='white')

	plt.show()

skyplot(sv,elev,azim)
