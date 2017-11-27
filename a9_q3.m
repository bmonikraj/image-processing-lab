q_mtx = [16 11 10 16 24 40 51 61;
        12 12 14 19 26 58 60 55;
        14 13 16 24 40 57 69 56;
        14 17 22 29 51 87 80 62;
        18 22 37 56 68 109 103 77;
        24 35 55 64 81 104 113 92;
        49 64 78 87 103 121 120 101;
        72 92 95 98 112 100 103 99];
    
I = imread('cameraman.tif');

[x,y] = size(I);

DCT = zeros(x,y);

for i=1:8:x-7
    for j=1:8:y-7
        w = I(i:i+7, j:j+7);
        g = dct2(w);
        DCT(i:i+7, j:j+7) = g;
    end
end

for i=1:8:x-7
    for j=1:8:y-7
        w = DCT(i:i+7, j:j+7);
        g = w./q_mtx;
        DCT(i:i+7, j:j+7) = g;
    end
end

for i=1:8:x-7
    for j=1:8:y-7
        w = DCT(i:i+7, j:j+7);
        k = 0.25*(8*8);
        h = zeros(8,8);
        for d=2:16
            for a=1:8
                for b=1:8
                    if (k>0 && a+b==d)
                        h(a,b) = w(a,b);
                        k = k -1;
                    end
                end
            end
        end
        DCT(i:i+7, j:j+7) = h;
    end
end

for i=1:8:x-7
    for j=1:8:y-7
        w = DCT(i:i+7, j:j+7);
        g = w.*q_mtx;
        DCT(i:i+7, j:j+7) = g;
    end
end

R = DCT;

for i=1:8:x-7
    for j=1:8:y-7
        w = DCT(i:i+7, j:j+7);
        g = idct2(w);
        R(i:i+7, j:j+7) = g;
    end
end

imshow(R,[]);