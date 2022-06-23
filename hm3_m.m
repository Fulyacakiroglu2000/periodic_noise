I = imread("8.tif");
subplot(2,5,1),imshow(I),title("first picture")
med = medfilt2(I);
subplot(2,5,2),imshow(med),title("noisless picture")


PQ=paddedsize(size(med));
H1=notch('btw',PQ(1),PQ(2),12,50,15);
H2=notch('btw',PQ(1),PQ(2),12,945,730);

subplot(2,5,3),imshow(fftshift(H1.*H2));

ForTrans=fft2(double(med),PQ(1),PQ(2));

FS_car = ForTrans.*H1.*H2;

F_car=real(ifft2(FS_car)); 


F_car=F_car(1:size(med,1), 1:size(med,2));

subplot(2,5,4), imshow(F_car,[]),title('butterworth blurred image')



%---------------------------------------

H3=notch('ideal',PQ(1),PQ(2),12,50,15);
H4=notch('ideal',PQ(1),PQ(2),12,945,730);

subplot(2,5,5),imshow(fftshift(H3.*H4));

ForTrans=fft2(double(med),PQ(1),PQ(2));

FS_car2 = ForTrans.*H3.*H4;

F_car2=real(ifft2(FS_car2)); 


F_car2=F_car2(1:size(med,1), 1:size(med,2));

subplot(2,5,6), imshow(F_car2,[]),title('ideal blurred image')

%-----------------------------------------
H5=notch('gaussian',PQ(1),PQ(2),12,50,15);
H6=notch('gaussian',PQ(1),PQ(2),12,945,730);

subplot(2,5,7),imshow(fftshift(H5.*H6));

ForTrans=fft2(double(med),PQ(1),PQ(2));

FS_car3 = ForTrans.*H5.*H6;

F_car3=real(ifft2(FS_car3)); 


F_car3=F_car3(1:size(med,1), 1:size(med,2));

subplot(2,5,8), imshow(F_car3,[]),title('gaussian blurred image')
%-----------------------------------------

sh_im=imsharpen(F_car);
subplot(2,5,9),imshow(sh_im,[]),title('sharped image')

Fc=fftshift(ForTrans);
Fcf=fftshift(FS_car);

S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S2,[])
