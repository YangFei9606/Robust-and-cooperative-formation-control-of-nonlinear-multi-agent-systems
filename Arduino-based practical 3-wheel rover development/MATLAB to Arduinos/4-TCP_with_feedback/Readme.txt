Based on the previous foundation, a 'feedback' from Arduino to MATLAB is also built up for future practice.
24/09/2021
Now, this part is not completed because of the lack of knowledge.
I tried to let Arduino to send out strings to the MATLAB but there seems to be some issue with it.
The communication process can not be finished on time under such circumstance and the error/warning reported from MATLAB is that an insufficient amount of data is received
Hence, I think we still need to use byte-based communication if we want to send back floats to the MATLAB.
The previous work from Ahn Tran is not good enough because it only sends out integers (takes two bytes).
And a float number would require 4 bytes (16 bits). 
The code that transfer floats to bytes and backward has not been found yet.
We might need to work on this if we want to obtain some variables from Arduino within the calculation process.
Currently, the function can only send back a flag to the MATLAB (perhaps this can be used as the event-triggered flag in the future).
But now, since the host PC should have the reference and the actual state of each agent, a structure without complex feedback is good for now.

28/09/2021
The byte communication is fixed. 
While testing the communication with a frequency of 10Hz (100ms/loop), the data receiving and data sending process of Arduino is recorded to have a time consumption of 10ms in average.

09/12/2021
The TCP communication and the simulated real-time loop is built up.
However, it seems like we need to have a multi-board structure for the rover, leaving one Arduino to deal with the speed control of motors solely. Or otherwise the turning speed of the motor is negatively effected.
