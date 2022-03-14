% Reorders the states and its attributes by heuristic(md) merit (best leftmost)

function [open, oparent, fch, gch]= reorder( open,oparent,fch,gch )

[c, d]=size(open);
open=reshape(open,c*c,d/c)';
oparent=reshape(oparent,c*c,d/c)';
[~, b]=sort(fch);
open=open(b,:);
oparent=oparent(b,:);
open=reshape(open',c,d);
oparent=reshape(oparent',c,d);
fch=fch(b);
gch=gch(b);

end

