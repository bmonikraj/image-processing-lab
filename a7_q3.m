clear all;
im=im2double(imread('cameraman.tif'));
imshow(im);
imd=fft2(im);
[m,n]=size(im);
k=0.0001;
h=zeros(size(im));
for u=1:m
    for v=1:n
        h(u,v)=exp(-k*power((u*u+v*v),(5/6)));
    end
end
blur=imd.*h;
final=ifft2(blur);
figure;
imshow(final);
nim=imnoise(final,'gaussian',0,0.001);
figure;
imshow(nim);
g=fft2(nim);
for u=1:m
    for v=1:n
        x(u,v)=(power(abs(h(u,v)),2)/(power(abs(h(u,v)),2)+k))*g(u,v)/h(u,v);
    end
end
figure;
imshow(ifft2(x));
