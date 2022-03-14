% Shifts the empty space upwards

function grid = up( grid )

empty=find(grid==0);
grid(empty)=grid(empty-1);
grid(empty-1)=0;

end