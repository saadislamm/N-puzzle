% Manhattan Distance: sum of distances of each tile to goal

function h2 = h2( grid,goal )

h2=goal-grid;
h2(find(grid==0))=0;
[row,col] = find(h2);
mis=length(row);
row2=zeros(mis,1);
col2=zeros(mis,1);

for i=1:length(row)
[row2(i),col2(i)]=find(goal==grid(row(i),col(i)));
end

h2=sum(abs(row2-row)+abs(col2-col));

end