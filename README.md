# periodic_noise
removal salt and pepper noise and periodic noise
.Firstly, we writed imread and made MATLAB saw the picture.The picture has got 
salt and pepper noise,So we applied median filter and destroyed this noise.We wrote 
imshow command and we showed in output window title as ‘noisless picture’.After that 
applied paddedsize function.This function helped us multiplication two the picture’s size.
Fft command provided to taking Foruier Spectrum and converting to Frequency Domain.For 
displaying this image,shifted and got abstract value.Purpose of this process getting rid of 
complex numbers.After that,we applied Log instruction for not see black completely.
We used Notch Filter.Let’s see Notch function.
Type can be ideal,butterworth(btw),gaussian
M,N are column and row
D0 is Radius because it is circular for butterworth
W is width of circle
N is if butterworth ,degree of filter 
İf n increasing ,sharpness is increasing
X and y are center of notch filter
After that ,We implemented H.H is our filter in Frequency Domain. 
H1 and H2 applied notch filter according to manuel values.
H1=notch('btw',PQ(1),PQ(2),12,50,15);
H2=notch('btw',PQ(1),PQ(2),12,945,730);
12 is thickness of points.
(50,15),(945,730) these are our coordinates.For finding them,delete fftshift command in
Foruier Spectrum and displayed.We wrote down the coordinate of the glows in corners.
After H1 and H2 applied array multiply
