A8 = zeros(8,8);
A16 = zeros(16,16);

for a=0:7
    for b=0:7
        k=sqrt(1/8);
        if b>0
            k = sqrt(2/8);
        end
        A8(a+1,b+1) = k*cos(double((3.14*b*(2*a+1))/(2*8)));
    end
end

for a=0:15
    for b=0:15
        k=sqrt(1/16);
        if b>0
            k = sqrt(2/16);
        end
        A16(a+1,b+1) = k*cos(double((3.14*b*(2*a+1))/(2*16)));
    end
end

A8C = conj(A8);
A16C = conj(A16);
A8CT = transpose(A8C);
A16CT = transpose(A16C);

figure;
pc=1;
for a=0:7
    for b=0:7
        d = real(A8CT(:,a+1))*real(A8CT(:,b+1)');
        subplot(8,8,pc), imshow(d);
        pc=pc+1;
    end
end
% 
% figure;
% pc=1;
% for a=0:15
%     for b=0:15
%         d = real(A16CT(:,a+1))*real(A16CT(:,b+1)');
%         subplot(16,16,pc), imshow(d);
%         pc=pc+1;
%     end
% end
