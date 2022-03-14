% Shifts the empty space downwards

function grid = down( grid )

empty=find(grid==0);
grid(empty)=grid(empty+1);
grid(empty+1)=0;

end