function seeds = random(G,k )
%RANDOM Random selection 
%   此处显示详细说明
seeds = randi([1 numnodes(G)],k,1);
end