% Generates children excluding the parent

function chx = children( X,P )
    
    k=length(X);
    [row,col] = find(X==0);
    R1=[];R2=[];R3=[];R4=[];

    if(col~=1)
        R1=left(X);
        if isequal(R1,P)
            R1=[];
        end
    end
    
    if(row~=1)
        R2=up(X);
        if isequal(R2,P)
            R2=[];
        end
    end
    
    if(col~=k)
        R3=right(X);
        if isequal(R3,P)
            R3=[];
        end
    end
    
    if(row~=k)
        R4=down(X);
        if isequal(R4,P)
            R4=[];
        end
    end
    
    chx=[R1 R2 R3 R4];

end

