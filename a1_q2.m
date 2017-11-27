I = imread('tire.tif');
O = double(I);
a = [0,100,150,255];
s = [0,50,200,255];
c = [0.1, 0.2 , 0.3];

[x,y] = size(O);

for i=1:x
    for j=1:y
        if O(i,j)<100
            O(i,j) = 0.5*O(i,j);
        end
        if O(i,j)>=100 && O(i,j)<150
            O(i,j) = 3*(O(i,j)-100)+50;
        end
        if O(i,j)>=150
            O(i,j) = 0.52*(O(i,j)-150) + 200;
        end
    end
end

subplot(1,2,1), imshow(I), title('Original Image');
subplot(1,2,2), imshow(O,[]), title('Contrast Stretched Image');