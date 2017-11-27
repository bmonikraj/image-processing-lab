IRGB = imread('onion.png');
IN = imnoise(IRGB,'salt & pepper',0.01);
HSV = rgb2hsv(IN);
P = HSV(:,:,3);

H = 1/25*[1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];

J = imfilter(P, H);
HSV(:,:,3) = J;

IR = IN(:,:,1);
IG = IN(:,:,2);
IB = IN(:,:,3);

JR = imfilter(IR, H);
JG = imfilter(IG, H);
JB = imfilter(IB, H);

IHH = IN;

IHH(:,:,1) = JR;
IHH(:,:,2) = JG;
IHH(:,:,3) = JB;

subplot(1,3,1), imshow(IN);
subplot(1,3,2), imshow(hsv2rgb(HSV));
subplot(1,3,3), imshow(IHH);
