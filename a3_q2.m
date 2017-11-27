%Input Image
% I = imread('eight.tif');
I = [1 2; 3 4];
[x,y] = size(I);
%Filter Definition
H = [5 6; 7 8];
[hx,hy] = size(H);

A = zeros(y*y,y*y);

%Formation of H0, H1, ..., Hn
for i=1:x
    rows = y;
    cols = y;
    h = zeros(rows,cols);
    for j=1:cols
        for k=1:y
            mx = mod(int32(k+j-1),int32(y));
            if mx==0
                mx=1;
            end
            h(mx,j) = I(i,k);
        end
    end
    for a=1:y
        for b=1:y
            A((i-1)*(rows)+a,b) = h(a,b);
        end
    end
end

%Rotation all over the A matrix
for i=2:y
%     blockx = y+hy-1;
%     blocky = hy;
    for j=1:y*y
        for k=1:y
            mx = mod(int64((i-1)*(y)+j),int64(y*y));
            my = (i-1)*y+k;
            if mx==0
                mx = 1;
            end
            A(mx,my) = A(j,k);
        end
    end
end

H = reshape(H,hy+hx,1);
O = A*H;
O = reshape(O,sqrt(hy+hx),sqrt(hy+hx));