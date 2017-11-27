I = imread('cameraman.tif');
[x,y] = size(I);
H = zeros(x,y);
A = zeros(x,y);
G1 = zeros(x,y);
G2 = zeros(x,y);
R1 = zeros(x,y);
R2 = zeros(x,y);
%Creation of Blur Function - Motion Blur
for a=1:x
    for b=1:y
        H(a,b) = (1/(pi*(0.001*a+0.1*b)))*sin(pi*(0.001*a+0.1*b))*exp(-1*j*pi*(0.001*a+0.1*b));
    end
end

%Creation atmospheric blur
for a=1:x
    for b=1:y
        A(a,b) = exp(-0.005*((a*a+b*b)^(5/6)));
    end
end

Iuv = fft2(I);

%Multiplication point wise
for a=1:x
    for b=1:y
        G1(a,b) = Iuv(a,b)*H(a,b);
    end
end

for a=1:x
    for b=1:y
        G2(a,b) = Iuv(a,b)*A(a,b);
    end
end

%G1 = Motion Blurred Input G2 = Atmospheric Blurred Input
g1 = ifft2(G1);
g2 = ifft2(G2);
subplot(2,2,1), imshow(g1,[]);
subplot(2,2,2), imshow(g2,[]);
for a=1:x
    for b=1:y
        g1(a,b) = sqrt(real(g1(a,b))*real(g1(a,b))+imag(g1(a,b))*imag(g1(a,b)));
        g2(a,b) = sqrt(real(g2(a,b))*real(g2(a,b))+imag(g2(a,b))*imag(g2(a,b)));
    end
end
for a=1:x
    for b=1:y
        R1(a,b) = G1(a,b)/H(a,b);
    end
end

for a=1:x
    for b=1:y
        R2(a,b) = G2(a,b)/A(a,b);
    end
end
r1 = ifft2(R1);
r2 = ifft2(R2);
for a=1:x
    for b=1:y
        r1(a,b) = sqrt(real(r1(a,b))*real(r1(a,b))+imag(r1(a,b))*imag(r1(a,b)));
        r2(a,b) = sqrt(real(r2(a,b))*real(r2(a,b))+imag(r2(a,b))*imag(r2(a,b)));
    end
end
subplot(2,2,3), imshow(r1,[]);
subplot(2,2,4), imshow(r2,[]);