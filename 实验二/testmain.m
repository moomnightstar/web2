function  testmain(  )
%TESTMAIN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

S=load('graph.mat');
%��Ϊ����
a=S.S;
[r,c]=size(a);
if r>c
    a(:,c+1:r)=0;
elseif r<c
    a(r+1:c,:)=0;
end
%��������ͼ
G=digraph(a);

    seeds=greedy(G,20);
    disp(seeds);
    num = ICM( G,seeds,100 );
    disp(num);

end

