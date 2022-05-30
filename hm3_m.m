I = imread("8.tif");
subplot(2,3,1),imshow(I),title("first picture")
med = medfilt2(I);
subplot(2,3,2),imshow(med),title("noisless picture")


PQ=paddedsize(size(med));
H1=notch('btw',PQ(1),PQ(2),12,50,15);
H2=notch('btw',PQ(1),PQ(2),12,945,730);

subplot(2,3,3),imshow(fftshift(H1.*H2));

ForTrans=fft2(double(med),PQ(1),PQ(2));


FS_car = ForTrans.*H1.*H2;

F_car=real(ifft2(FS_car)); 


F_car=F_car(1:size(med,1), 1:size(med,2));

subplot(2,3,4), imshow(F_car,[]),title('blurred image')
sh_im=imsharpen(F_car);
subplot(2,3,5),imshow(sh_im,[]),title('sharped image')

Fc=fftshift(ForTrans);
Fcf=fftshift(FS_car);

S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S2,[])
