# WALFISCH-IKEGAMI-model
Exercise on Wireless Links in Wireless Communications course - Departement of Informatics and Telecommunications, National & Kapodistrian Uneversity of Athens. 

Walfisch Ikegami model is an empirical and statistical model used for calculating a signal's propagation loss in the open space. To do that it takes into account different parameters, such as:
- the distance between the transmitter and the receiver 
- the size of the roads
- the space between the buildings

A very important parameter at the aforementioned calculation is the existance or not, of direct visibility between the transmitter and the receiver - line of sight (LON) 

<img width="684" alt="Screenshot 2022-08-08 at 11 41 26 AM" src="https://user-images.githubusercontent.com/110672874/183377166-1080319d-8abc-40f8-a41b-d9558cfea52b.png">

# Implementation

- walfkeg.m file includes the MATLAB code for the calculation of the mathematical formula based on the input arguments of the different parameters
- WALFISCH_IKEGAMI_model.m file includes the MATLAB code that calculates the propagation loss for different scenarios - tests various parameters' values: distance, frequency, base station height, mobile station height and angle of incidence

The report of the exercise, where the output of the code is fully explained, is also uploaded on the repository in Greek.
