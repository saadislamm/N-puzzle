clear all;clc;
tic;

%---------------------------SELECT ANY EXAMPLE-----------------------
%start=[2 8 3; 1 6 4; 7 0 5];
%goal=[1 2 3; 8 0 4; 7 6 5];

%start=[1 2 3; 6 4 0; 8 7 5];           % Example from Paper
%goal=[1 2 3; 8 0 4; 7 6 5];            % Example from Paper

%start=[2 8 1; 6 5 7; 3 0 4];           % Example from Solver
%start=[0 4 8; 5 6 2; 3 7 1];           % Solver
%start=[8 4 3; 6 1 0; 2 7 5];           % Solver
%start=[6 7 1; 2 0 4; 8 5 3];           % Solver
%start=[3 7 6; 1 4 2; 5 8 0];           % Solver
%start=[8 6 0; 3 1 4; 5 2 7];           % Solver
%start=[1 2 8; 7 0 3; 6 5 4];           % Solver
%start=[2 4 0; 6 5 1; 7 8 3];           % Solver
%start=[4 3 2; 7 5 0; 8 1 6];           % Solver
%start=[1 5 4; 6 3 7; 8 0 2];           % Solver
%start=[6 4 0; 8 7 3; 2 1 5];           % Solver
start=[0 1 4; 6 2 3; 7 5 8];            % Solver - 14 moves
goal=[1 2 3; 4 5 6; 7 8 0];             % Solver
%start=[5 3 2 1; 9 6 15 4; 7 8 11 13; 10 12 14 0];
%goal=[0 1 2 3; 4 5 6 7; 8 9 10 11; 12 13 14 15];
%-------------------------------------------------------------------

%--------------------INITIALIZAING VARIABLES------------------------
k=length(start);
open=start;
oparent=zeros(k);
openg=0;
closedg=[];
openf=openg+h2(start,goal);
closed=[];
i=0;
path=zeros(k);
%-------------------------------------------------------------------
    
while ~isempty(open),   % Algorithm continues until all open states are explored

    %--------------------INITIALIZAING VARIABLES--------------------
    fch=[];gch=[];
    X=open(:,1:k);
    open(:,1:k)=[];
    P=oparent(:,1:k);
    oparent(:,1:k)=[];
    G=openg(1)+1;
    openg(1)=[];
    openf(1)=[];
    %---------------------------------------------------------------
    
    
    %-------------------AFTER FINDING THE GOAL----------------------
    if isequal(X,goal)
        %fprintf('%d states explored\n',i);
        fprintf('%d moves required\n',moves);
        for m=moves:-1:1
            path(:,m*k-(k-1):m*k)=father(X,closed,closedg,k,m);
            X=path(:,m*k-(k-1):m*k);
        end
        path(:,moves*k+k-2:moves*k+k)=goal;
        for p=1:moves+1
            path(:,p*k-(k-1):p*k)
        end
        break;
    %---------------------------------------------------------------
        
        
    %GENERATING CHILDREN, CALCULATING HEURISTICS, REORDERING STATES- 
    else
        chx=children(X,P);
        xparent=[];
        for j=1:length(chx)/k;
            gch(j)=G;
            fch(j)=gch(j)+h2(chx(:,k*j-(k-1):k*j),goal);
            xparent=[X xparent];
        end
        open=[chx open];
        oparent=[xparent oparent];
        openf=[fch openf];
        openg=[gch openg];
        i=i+1;
        moves=gch(1);
    end
    closed=[closed X];
    closedg=[closedg gch(1)];
    [open, oparent, openf, openg]=reorder(open,oparent,openf,openg);
    %---------------------------------------------------------------

end

toc;