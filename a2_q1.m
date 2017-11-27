I = imread('eight.tif');
B = I;
w = [1 1 1; 1 1 1; 1 1 1];
ww = [1 2 1; 2 4 2; 1 2 1];
[x,y] = size(B);
O = B;
D = B;
G = zeros(x,y);

%Boundary smoothening
%Corner Values Smoothening
O(1,1) = int16((w(2,2)*B(1,1) + w(2,3)*B(1,2) + w(3,2)*B(2,1) + w(3,3)*B(2,2))/9);
O(1,y) = int16((w(2,2)*B(1,y) + w(2,1)*B(1,y-1) + w(3,2)*B(2,y) + w(3,1)*B(2,y-1))/9);
O(x,1) = int16((w(2,2)*B(x,1) + w(1,2)*B(x-1,1) + w(1,3)*B(x-1,2) + w(2,3)*B(x,2))/9);
O(x,y) = int16((w(2,2)*B(x,y) + w(2,1)*B(x,y-1) + w(1,1)*B(x-1,y-1) + w(1,2)*B(x-1,y))/9);

%Non boundary smoothening
for i=2:1:x-1
    for j=2:1:y-1
        tem = B(i-1:i+1, j-1:j+1);
        tem = double(tem).*double(w);
        s = double(sum(sum(tem)));
        s = s/9;
        O(i,j) = int16(s);          
    end
end

for i=2:1:x-1
    for j=2:1:y-1
        tem = B(i-1:i+1, j-1:j+1);
        tem = double(tem).*double(ww);
        s = double(sum(sum(tem)));
        s = s/16;
        D(i,j) = int16(s);          
    end
end

subplot(1,3,1), imshow(B), title('Original Image');
subplot(1,3,2), imshow(O), title('Averaging');
subplot(1,3,3), imshow(D), title('Weighted Averaging');