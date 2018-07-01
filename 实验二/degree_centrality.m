function seeds = degree_centrality( G,k)
%DEGREE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

deg_ranks = centrality(G,'outdegree','Importance',G.Edges.Weight);
[B,I] = sort(deg_ranks,'descend');
seeds=I(1:k);

end

