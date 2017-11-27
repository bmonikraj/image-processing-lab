IRGB = imread('onion.png');
IR = IRGB(:,:,1);
IG = IRGB(:,:,2);
IB = IRGB(:,:,3);

HSV = rgb2hsv(IRGB);
P = HSV(:,:,3);


row = size(P,1);
col= size(P,2);
EI=zeros(row,col);
CTR=zeros(256,1);
for i=1:row
    for j=1:col
        CTR(uint8(P(i,j)*256)+1)=CTR(uint8(P(i,j)*256)+1)+1;
    end
end
sum1 = sum(CTR);
disp(sum1);
for i=2:256
    CTR(i) =(CTR(i-1)+CTR(i));
end
CTR=CTR/(row*col);
CTR=CTR*255;
for i=1:row
    for j=1:col
        EI(i,j) = CTR(uint8(P(i,j)*256)+1);
    end
end


J = EI/256;
HSV(:,:,3) = J;
IC = hsv2rgb(HSV);




subplot(2,1,1), imshow(IRGB);
subplot(2,1,2), imshow(IC);
