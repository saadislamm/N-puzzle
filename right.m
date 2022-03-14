% Shifts the empty space towards right

function grid = right( grid )

empty=find(grid==0);
grid(empty)=grid(empty+length(grid));
grid(empty+length(grid))=0;

end