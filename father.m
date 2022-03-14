% After reaching the goal, tracing back to start to find the path

function father = father( X,closed,closedg,k,moves )

index=find(closedg==moves);

for i=1:length(index)
    F=closed(:,index(i)*k-(k-1):index(i)*k);
    if h2(X,F)==1
    father=F;
    end
end

end

