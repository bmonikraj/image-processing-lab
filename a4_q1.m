A8 = zeros(8,8);
A16 = zeros(16,16);

for a=0:7
    for b=0:7
        A8(a+1,b+1) = exp(double((-1*2*3.14*a*b)*j/8));
    end
end

for a=0:15
    for b=0:15
        A16(a+1,b+1) = exp(double((-1*2*3.14*a*b)*j/16));
    end
end

A8C = conj(A8);
A16C = conj(A16);
A8CT = A8C';
A16CT = A16C';

figure;
pc=1;
for a=0:7
    for b=0:7
        d = real(A8CT(:,a+1))*real(A8CT(:,b+1)');
        subplot(8,8,pc), imshow(d);
        pc=pc+1;
    end
end

figure;
pc=1;
for a=0:15
    for b=0:15
        d = real(A16CT(:,a+1))*real(A16CT(:,b+1)');
        subplot(16,16,pc), imshow(d);
        pc=pc+1;
    end
end

figure;
pc=1;
for a=0:7
    for b=0:7
        d = imag(A8CT(:,a+1))*imag(A8CT(:,b+1)');
        subplot(8,8,pc), imshow(d);
        pc=pc+1;
    end
end

figure;
pc=1;
for a=0:15
    for b=0:15
        d = imag(A16CT(:,a+1))*imag(A16CT(:,b+1)');
        subplot(16,16,pc), imshow(d);
        pc=pc+1;
    end
end