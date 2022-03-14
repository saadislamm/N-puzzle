% Shifts the empty space towards left

function grid = left( grid )

empty=find(grid==0);
grid(empty)=grid(empty-length(grid));
grid(empty-length(grid))=0;

end