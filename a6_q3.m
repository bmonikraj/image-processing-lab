clearvars;
im = imread('eight.tif');
im = double(im);
subplot(2,2,1);imshow(im,[]);
im = imnoise(im);
subplot(2,2,2);imshow(im,[]);

[l,m]= size(im);
% disp(l);
% disp(m);

img = zeros(l+2,m+2);
%replicating boundary
img(1,2:m+1)=im(1,:);
img(l+2,2:m+1)=im(l,:);
img(2:l+1,1)=im(:,1);
img(2:l+1,m+2)=im(:,m);

img(2:l+1,2:m+1)=im;
% imshow(img,[]);
prob = [0.1, 0.05,0.25,0.1,0.1,0.2,0.05,0.15,0];
% median smoothing
for i = 2:l+1
   for j = 2:m+1
       A = zeros(2,9);
       A(1,:) = [img(i-1,j-1), img(i-1,j), img(i-1,j+1),img(i,j-1),img(i,j),img(i,j+1),img(i+1,j-1),img(i+1,j),img(i+1,j+1)];
       A(2,:) = prob;
       A = sortrows(A',1);
       [l,m] = size(A);
       iter = 1;
       cum_prob = 0;
       while(iter<=l)
            cum_prob =cum_prob + A(iter,2);
%             disp(cum_prob);
            if(cum_prob>0.45)
                im(i,j) = A(iter,1);
                break;
            end
            iter = iter +1;
       end            
   end
end
subplot(2,4,8);imshow(im,[]);
mse_max=0;
for i = 2:l+1
   for j = 2:m+1
       mse_max = mse_max+ (im(i,j)-img(i,j))^2;
       %disp((im(i,j)-img(i,j))^2);
   end
end
mse_max = mse_max/(l*m);
number = (255^2)/mse_max;
disp(10*log10(double(number)));
