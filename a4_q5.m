f1 = imread('cameraman.tif');
f2 = imread('moon.tif');
f1 = imresize(f1,[128 128]);
f2 = imresize(f2,[128 128]);
ff1 = f1;
ff2 = f2;
f1 = double(f1);
f2 = double(f2);

A = zeros(128,128);
for a=0:127
    for b=0:127
        k = -2i*pi*a*b;
        k = k/128;
        A(a+1,b+1) = exp(k);
    end
end
B = double(transpose(A));
F1 = A*f1*B;
F2 = A*f2*B;

P1 = atan(imag(F1)/real(F1));
P2 = atan(imag(F2)/real(F2));
AB1 = abs(F1);
AB2 = abs(F2);
R1 = AB1.*exp(1i*P2);
R2 = AB2.*exp(1i*P1);
RI1 = ifft2(R1);
RI2 = ifft2(R2);
subplot(2,2,1), imshow(ff1);
subplot(2,2,2), imshow(ff2);
subplot(2,2,3), imshow(RI1,[]);
subplot(2,2,4), imshow(RI2,[]);