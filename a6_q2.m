% I = imread('tire.tif');
% O = I;
% % x,y = size(I);
% Wx = 0;
% Wy = 0;
% Ww = 2;
% Wh = 2;
% Smax = 8;
% for i=1:x-8
%     for j=1:y-8
%         lwx = Wx;
%         lwy = Wy;
%         lww = Ww;
%         lwh = Wh;
%         VALUE = 0;
%         while 1
%             r = [];
%             for a=lwx+i:lwx+i+lww
%                 for b=lwy+j:lwy+j+lwh
%                     r = [r I(a,b)];
%                 end
%             end
%             Zmin = min(r);
%             Zmax = max(r);
%             Zmedian = median(r);
%             Zxy = I(lwx+i+lww/2, lwy+j+lwh/2);
%             A1 = Zmedian - Zmin;
%             A2 = Zmedian - Zmax;
%             if A1>0 && A2<0
%                 B1 = Zxy-Zmin;
%                 B2 = Zxy-Zmax;
%                 if B1>0 && B2<0
%                     VALUE = Zxy;
%                     break;
%                 else
%                     VALUE = Zmedian;
%                     break;
%                 end
%             else
%                 lww = lww + 2;
%                 lwh = lwh + 2;
%                 if lww>Smax
%                     VALUE = Zxy;
%                     break;
%                 end
%             end
%         end
%         O(i+lww/2, j+lwh/2)=VALUE;
%     end
% end
% subplot(2,1,1), imshow(I);
% subplot(2,1,2), imshow(O);






I=imread('cameraman.tif');
J = imnoise(I,'salt & pepper',0.02);
J=int16(J);
smax=15;
padd_image=padarray(J,[smax,smax],0,'both');
padd_image2=padd_image;
figure;
imshow(uint8(padd_image));
[l,b]=size(padd_image);
s=3;
for x=smax:l-smax
    for y=smax:b-smax
        z_xy=padd_image(x,y);
        while 1
            w=int16(s/2);
            s_arr=[];
            for i=x-w:x+w
                for j=y-w:y+w
                    s_arr=[s_arr,padd_image(i,j)];
                end
            end
            z_med=median(s_arr);
            z_min=min(s_arr);
            z_max=max(s_arr);
            a1=z_med-z_min;
            a2=z_med-z_max;
            if a1>0 && a2<0
                b1=z_xy-z_min;
                b2=z_xy-z_max;
                if b1>0 && b2<0
                    a=102;
                    break;
                end
                z_xy=z_med;
                break;
            else
                s=s+2;
                if s>smax
                    s=smax;
                    break;
                end
            end
        end
        padd_image2(x,y)=z_xy;
    end
end

figure;
imshow(uint8(padd_image2));
                    
                
            
        