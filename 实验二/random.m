function seeds = random(G,k )
%RANDOM Random selection 
%   �˴���ʾ��ϸ˵��
seeds = randi([1 numnodes(G)],k,1);
end