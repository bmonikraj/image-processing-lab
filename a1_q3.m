I = imread('IP lab docs/bit_plane.bmp');
G = rgb2gray(I);
[x,y] = size(G);
subplot(1,9,1), imshow(G);
for i=0:1
%     A = bi2de(de2bi(G,8) & de2bi(2^i,8));
%     A = reshape(A,x,y);
A = G;
    for j = 1:x
        for k = 1:y
            a = [];
            b = [];
            n1 = G(j,k);
            n2 = 2^i;
            for q=1:8
                a = [mod(n1,2) a];
            end
            for q=1:8
                b = [mod(n2,2) b];
            end
            c= [];
            for q=1:8
                c = [and(a(q),b(q)) c];
            end
            f = 0;
            for q=1:8
                f = f + 2^c(q);
            end
            A(j,k) = f;
        end
    end
subplot(1,9,i+2), imshow(A)
end