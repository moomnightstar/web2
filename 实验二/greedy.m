function seeds = greedy( G,k )
%GREEDY 此处显示有关此函数的摘要
%   此处显示详细说明
s = [];
L = 1:numnodes(G);
max=0;
u=0;
state=zeros(numnodes(G),1);
tmp=state;
for i=1:k
    for j=1:length(L)
        [num,next_state]=nodesgain(G,s,state,L(j));
        if num>max
            max=num;
            u=L(j);
            tmp=next_state;
        end
    end
    if u~=0
        s=[s,u];
        state=tmp;
        L=setdiff(L,u);
        u=0;
    end     
end
seeds=s';
end

function [num,next_state]=nodesgain(G,s,state,u)
state(u)=1;
s=[s,u];
v=[u];
for j=1:length(v)
    sucIDs = successors(G,v(j));
    sucIDs=setdiff(sucIDs,s);
    
    for i=1:length(sucIDs)
        tmp=state(v(j))* G.Edges.Weight(findedge(G,u,sucIDs(i)));
        if tmp>state(sucIDs(i))
            state(sucIDs(i))=tmp;
        end
    end
    sucIDs=setdiff(sucIDs,v);
    v=[v,sucIDs'];
end
next_state=state;
num=sum(next_state);
end