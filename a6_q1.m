X = [];
for i=-100:101
    X = [X i];
end

GN = [];
RN = [];
ErN = [];
ExN = [];
UN = [];

for i=-100:101
    v = (1/(2*pi*2.67))*exp((-1*(i-50)*(i-50))/(2*2.67*2.67));
    GN = [GN v];
end

for i=-100:101
    v = (2/2.67)*(i-40)*exp((-1*(i-40)*(i-40))/(2.67));
    if(i<40)
        v = 0;
    end
    RN = [RN v];
end

for i=-100:101
    v = (3.7^4*i^(4-1))*(1/(factorial(4-1)))*(i-3.7)*exp(-1*3.7*i);
    if(i<0)
        v = 0;
    end
    ErN = [ErN v];
end

for i=-100:101
    v = 4.8*exp(-1*4.8*i);
    ExN = [ExN v];
end

for i=-100:101
    v=0;
    if i<45 && i>-34
        v=1/(45-(-34));
    end
    UN = [UN v];
end

IN = [];
for i=-100:101
    v=0;
    if i==45 || i==34
        v=i;
    end
    IN = [IN v];
end
subplot(6,1,1), plot(X,GN);
subplot(6,1,2), plot(X,RN);
subplot(6,1,3), plot(X,ErN);
subplot(6,1,4), plot(X,ExN);
subplot(6,1,5), plot(X,UN);
subplot(6,1,6), plot(X,IN);