function  main( )
%MAIN 此处显示有关此函数的摘要
% 读取数据, sparse指向矩阵的索引必须为正数,为了不出现编号0,S中编号向后推了一位 1004*1005
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
rdfp=fopen('random.txt','w');
dcfp=fopen('degree_centrality.txt','w');
ccfp=fopen('closeness_centrality.txt','w');
grfp=fopen('greedy.txt','w');   
seeds=greedy(G,20);
for k=1:20
    testseeds=seeds(1:k);
    num = ICM( G,testseeds,100 );
    for i=1:length(testseeds)
        fprintf(grfp,'%d',testseeds(i)-1);
        if i==length(testseeds)
            fprintf(grfp,';%d\n',num);
        else
            fprintf(grfp,',');
        end
    end
end
%%
seeds=degree_centrality(G,20);
for k=1:20
    testseeds=seeds(1:k);
    num = ICM( G,testseeds,100 );
    for i=1:length(testseeds)
        fprintf(dcfp,'%d',testseeds(i)-1);
        if i==length(testseeds)
               fprintf(dcfp,';%d\n',num);
        else
               fprintf(dcfp,',');
        end
    end
end

%%
 seeds=closeness_centrality(G,20);
 for k=1:20
    testseeds=seeds(1:k);
    num = ICM( G,testseeds,100 );
    for i=1:length(testseeds)
        fprintf(ccfp,'%d',testseeds(i)-1);
        if i==length(testseeds)
               fprintf(ccfp,';%d\n',num);
        else
               fprintf(ccfp,',');
        end
    end
 end
%%
for k=1:20
    seeds=random(G,k);
    num = ICM( G,seeds,100 );
    for i=1:length(seeds)
        fprintf(rdfp,'%d',seeds(i)-1);
        if i==length(seeds)
               fprintf(rdfp,';%d\n',num);
        else
               fprintf(rdfp,',');
        end
    end 
end
fclose('all');
end
%无向图做法
%A=a+a';
%G=graph(A);


