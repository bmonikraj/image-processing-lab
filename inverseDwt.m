
function[img] = inverseDwt(A,H,V,D,low_fil,high_fil)

    A = upsample(A',2)';
    H = upsample(H',2)';
    V = upsample(V',2)';
    D = upsample(D',2)';
    
    A = applyFltr(A,low_fil,0,1);
    H = applyFltr(H,high_fil,0,1);
    V = applyFltr(V,low_fil,0,1);
    D = applyFltr(D,high_fil,0,1);
    
    img1 = (A+H);
    img2 = (V+D);
    
   
    
    img1 = upsample(img1,2);
    img2 = upsample(img2,2);
    
    img1 = applyFltr(img1,low_fil,1,1);
    img2 = applyFltr(img2,high_fil,1,1);

    img = (img1+img2);
end





