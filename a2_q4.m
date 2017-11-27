I = imread('tire.tif');
O = imsharpen(I, 'Radius', 5, 'Amount', 3);
B = I;
[x,y] = size(I);
a = zeros(1,256);

[xo,yo] = size(O);
ao = zeros(1,256);

for i=1:x
    for j=1:y
        a(I(i,j)+1) = a(I(i,j)+1) + 1;
    end
end

c = a;
d = [c(1)/(x*y)];
for i=2:256
   c(i) = c(i) + c(i-1);
   d = [d c(i)];
end

for i=1:256
    d(i) = d(i)/(x*y);
end

for i=1:xo
    for j=1:yo
        ao(O(i,j)+1) = ao(O(i,j)+1) + 1;
    end
end

co = ao;
do = [co(1)/(xo*yo)];
for i=2:256
   co(i) = co(i) + co(i-1);
   do = [do co(i)];
end

for i=1:256
    do(i) = do(i)/(xo*yo);
end

for i=1:256
    m=1000;
    p = 1;
    for j=1:256
        if abs(do(j) - d(i)) < m 
            m = abs(do(j) - d(i));
            p = j;
        end
    end
    for z1=1:x
        for z2=1:y
            if B(z1,z2)==i-1
                B(z1,z2)=p-1;
            end
        end
    end
end

subplot(2,3,1), imshow(I), title('Input');
subplot(2,3,2), imshow(O), title('Output');
subplot(2,3,3), imshow(B), title('HS');
subplot(2,3,4), imhist(I);
subplot(2,3,5), imhist(O);
subplot(2,3,6), imhist(B);