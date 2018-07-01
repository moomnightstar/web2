function  testmain(  )
%TESTMAIN 此处显示有关此函数的摘要
%   此处显示详细说明

S=load('graph.mat');
%补为方阵
a=S.S;
[r,c]=size(a);
if r>c
    a(:,c+1:r)=0;
elseif r<c
    a(r+1:c,:)=0;
end
%生成有向图
G=digraph(a);

    seeds=greedy(G,20);
    disp(seeds);
    num = ICM( G,seeds,100 );
    disp(num);

end

