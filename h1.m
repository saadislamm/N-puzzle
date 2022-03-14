% # of misplaced tiles

function h1 = h1( grid,goal )

h1=length(find(grid-goal));

if(find(grid==0)~=find(goal==0))
    h1=h1-1;
end

end