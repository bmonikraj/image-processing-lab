I = imread('tire.tif');
O = I
[x,y] = size(I);
a = zeros(1,256);

for i=1:x
    for j=1:y
        a(I(i,j)+1) = a(I(i,j)+1) + 1;
    end
end

c = a;
d = [c(1)];
for i=2:256
   c(i) = c(i) + c(i-1);
   d = [d double(c(i)/(x*y))];
end

s = [];
m = 0;
for i=1:256
    if m<=a(i)
        m = a(i);
    end
end

t = []
for i=1:256
   s = [s (d(i)*255)];
   t = [t i];
end

for i=1:x
    for j=1:y
        O(i,j) = s(O(i,j)+1);
    end
end

subplot(2,2,1), imshow(I)
subplot(2,2,2), imshow(O)
subplot(2,2,3), imhist(I)
subplot(2,2,4), imhist(O)