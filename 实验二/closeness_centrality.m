function seeds = closeness_centrality( G,k )
%CLOSENESS_CENTRALITY �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
ucc = centrality(G,'outcloseness');
[B,I] = sort(ucc,'descend');
seeds=I(1:k);

end

