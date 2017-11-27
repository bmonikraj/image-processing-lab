I1 = imread('pout.tif');
I2 = imread('tire.tif');

%Negative of both the images
I1_Negative = 255 - I1;
I2_Negative = 255 - I2;

%Logarithm of both the images
I1_Log = 0.1*log(1+double(I1));
I2_Log = 0.1*log(1+double(I2));

%Power Law transformation of the images
I1_Power = 0.1*(double(I1).^(0.5));
I2_Power = 0.1*(double(I2).^(0.5));

%Plotting Of Images
subplot(4,2,1), imshow(I1), title('Pout.tif');
subplot(4,2,2), imshow(I2), title('Tire.tif');
subplot(4,2,3), imshow(I1_Negative), title('Pout -> Negative');
subplot(4,2,4), imshow(I2_Negative), title('Tire -> Negative');
subplot(4,2,5), imshow(I1_Log), title('Pout -> Log');
subplot(4,2,6), imshow(I2_Log), title('Tire -> Log');
subplot(4,2,7), imshow(I1_Power), title('Pout -> Power');
subplot(4,2,8), imshow(I2_Power), title('Tire -> Power');