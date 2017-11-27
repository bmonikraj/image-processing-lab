I = imread('eight.tif');
N = imnoise(I, 'salt & pepper', 0.2);
[x,y] = size(I);
subplot(5,3,1), imshow(I), title('Original Image');
subplot(5,3,2), imshow(N), title('Noise Image');
%Mean Filter
m3w = [1 1 1; 1 1 1; 1 1 1];
m5w = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];
m7w = [1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1]

M1 = N;
for i=2:1:x-1
    for j=2:1:y-1
        tem = N(i-1:i+1, j-1:j+1);
        tem = double(tem).*double(m3w);
        s = double(sum(sum(tem)));
        s = s/9;
        M1(i,j) = int16(s);          
    end
end

M2 = N;
for i=3:1:x-2
    for j=3:1:y-2
        tem = N(i-2:i+2, j-2:j+2);
        tem = double(tem).*double(m5w);
        s = double(sum(sum(tem)));
        s = s/25;
        M2(i,j) = int16(s);          
    end
end

M3 = N;
for i=4:1:x-3
    for j=4:1:y-3
        tem = N(i-3:i+3, j-3:j+3);
        tem = double(tem).*double(m7w);
        s = double(sum(sum(tem)));
        s = s/49;
        M3(i,j) = int16(s);          
    end
end

subplot(5,3,4), imshow(M1), title('Mean 3X3');
subplot(5,3,5), imshow(M2), title('Mean 5X5');
subplot(5,3,6), imshow(M3), title('Mean 7X7');

%Median Filtering
Me1 = N;
for i=2:1:x-1
    for j=2:1:y-1
        tem = N(i-1:i+1, j-1:j+1);
        d = sort(tem);
        Me1(i,j) = int16(d(5));          
    end
end

Me2 = N;
for i=3:1:x-2
    for j=3:1:y-2
        tem = N(i-2:i+2, j-2:j+2);
        d = sort(tem);
        Me2(i,j) = int16(d(13));          
    end
end

Me3 = N;
for i=4:1:x-3
    for j=4:1:y-3
        tem = N(i-3:i+3, j-3:j+3);
        d = sort(tem);
        Me3(i,j) = int16(d(25));          
    end
end

subplot(5,3,7), imshow(Me1), title('Median 3X3');
subplot(5,3,8), imshow(Me2), title('Median 5X5');
subplot(5,3,9), imshow(Me3), title('Median 7X7');

%Min Filtering
Mi1 = N;
for i=2:1:x-1
    for j=2:1:y-1
        tem = N(i-1:i+1, j-1:j+1);
        d = sort(tem);
        Mi1(i,j) = int16(d(1));          
    end
end

Mi2 = N;
for i=3:1:x-2
    for j=3:1:y-2
        tem = N(i-2:i+2, j-2:j+2);
        d = sort(tem);
        Mi2(i,j) = int16(d(1));          
    end
end

Mi3 = N;
for i=4:1:x-3
    for j=4:1:y-3
        tem = N(i-3:i+3, j-3:j+3);
        d = sort(tem);
        Mi3(i,j) = int16(d(1));          
    end
end

subplot(5,3,10), imshow(Mi1), title('Min 3X3');
subplot(5,3,11), imshow(Mi2), title('Min 5X5');
subplot(5,3,12), imshow(Mi3), title('Min 7X7');

%Max Filter
Ma1 = N;
for i=2:1:x-1
    for j=2:1:y-1
        tem = N(i-1:i+1, j-1:j+1);
        d = sort(tem);
        Ma1(i,j) = int16(d(9));          
    end
end

Ma2 = N;
for i=3:1:x-2
    for j=3:1:y-2
        tem = N(i-2:i+2, j-2:j+2);
        d = sort(tem);
        Ma2(i,j) = int16(d(25));          
    end
end

Ma3 = N;
for i=4:1:x-3
    for j=4:1:y-3
        tem = N(i-3:i+3, j-3:j+3);
        d = sort(tem);
        Ma3(i,j) = int16(d(49));          
    end
end

subplot(5,3,13), imshow(Ma1), title('Max 3X3');
subplot(5,3,14), imshow(Ma2), title('Max 5X5');
subplot(5,3,15), imshow(Ma3), title('Max 7X7');