function[OutImg] = applyFltr(InpImg,filter,dir,rev)
    [m,n] = size(InpImg);
    OutImg = zeros(m,n);
    
    if(dir==1)
        for i = 1:n
            OutImg(:,i) = conv(InpImg(:,i),filter','same');
        end
        if(rev==0)
            OutImg = OutImg(:,1:2:end);
        end
    else
        for i = 1:m
            OutImg(i,:) = conv(InpImg(i,:),filter,'same');
        end
        if(rev==0)
            OutImg = OutImg(1:2:end,:);
        end
    end
    
end