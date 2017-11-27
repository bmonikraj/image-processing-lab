%Input Image
%I = imread('eight.tif');
I = [1 2; 3 4];
[x,y] = size(I);
%Filter Definition
H = [5 6; 7 8];
[hx,hy] = size(H);

A = zeros((y+hy-1)*(x+hx-1),hy*hy);

%Formation of H0, H1, ..., Hn
for i=1:x
    rows = y+hy-1;
    cols = hy;
    h = zeros(rows,cols);
    for j=1:cols
        for k=1:y
            h(j+k-1,j) = I(i,k);
        end
    end
    for a=1:y+hy-1
        for b=1:hy
            A((i-1)*(rows)+a,b) = h(a,b);
        end
    end
end

%Rotation all over the A matrix
for i=2:hy
    blockx = y+hy-1;
    blocky = hy;
    for j=1:(x+hx-1)*(y+hy-1)
        for k=1:hy
            mx = mod(int64((i-1)*(y+hy-1)+j),int64((y+hy-1)*(x+hx-1)));
            my = (i-1)*hy+k;
            if mx==0
                mx = 1;
            end
            A(mx,my) = A(j,k);
        end
    end
end

H = reshape(H,hy+hx,1);
O = A*H;
O = reshape(O,x+hx-1,y+hy-1);
imshow(O,[])