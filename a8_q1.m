img = imread('tire.tif');
    
h_low = [0.707 0.707];
h_high = [0.707 -0.707];
    
img1 = applyFltr(img,h_high,1,0);
img2 = applyFltr(img,h_low,1,0);
WD = applyFltr(img1,h_high,0,0);
WV = applyFltr(img1,h_low,0,0);
    
WH = applyFltr(img2,h_high,0,0);
WA = applyFltr(img2,h_low,0,0);    
    
    
figure;
imshow(img);



res = [WA WH;WV WD];
figure;
imshow(uint8(res));



img11 = applyFltr(WA,h_high,1,0);
img21 = applyFltr(WA,h_low,1,0);
WD1 = applyFltr(img11,h_high,0,0);
WV1 = applyFltr(img11,h_low,0,0);
    
WH1 = applyFltr(img21,h_high,0,0);
WA1 = applyFltr(img21,h_low,0,0);    
    
res1 = [WA1 WH1;WV1 WD1];
figure;
imshow(uint8(res1));

%Reconstruction

RECIMAGE1 = inverseDwt(WA1, WH1, WV1, WD1, h_low, h_high);
RECIMAGE = inverseDwt(WA1, WH, WV, WD, h_low, h_high);



figure;
imshow(uint8(RECIMAGE));




