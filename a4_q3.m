f = imread('cameraman.tif');
%f = imresize(f,[64 64]);

f = double(f);

[x,y] = size(f);

F = zeros(x,y);

A = zeros(x,y);
for a=0:x-1
    for b=0:y-1
        A(a+1,b+1) = exp(double((-1i*2*pi*a*b)/x));
    end
end

B = double(transpose(conj(A)));
F = A*f*B;

% figure;
% imshow(F);
% figure;
% imshow(fft2(f));

subplot(1,2,1), imshow(F);
subplot(1,2,2), imshow(fft2(f));

% for u=1:x
%     for v=1:y
%         s = 0;
%         for m=1:x
%             for n=1:y
%                 s = s + f(m,n)*exp(-1*j*2*3.14*((m*u/x)+(n*v/y)));
%             end
%         end
%         F(u,v) = s/x;
%     end
% end