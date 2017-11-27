f1 = imread('cameraman.tif');
f2 = imread('eight.tif');
f1 = imresize(f1,[64 64]);
f2 = imresize(f2,[64 64]);
f1 = double(f1);
f2 = double(f2);

a = 2;
b = 3;

f = a*f1 + b*f2;
A = zeros(64,64);
for a=0:63
    for b=0:63
        A(a+1,b+1) = exp(double((-1*2*pi*a*b)*j/64));
    end
end
B = double(transpose(conj(A)));
FL = A*f*B;

F1 = A*f1*B;
F2 = A*f2*B;
FR = a*F1 + b*F2;

subplot(1,2,1), imshow(FL);
subplot(1,2,2), imshow(FR);