function main()
%MAIN 此处显示有关此函数的摘要
%   此处显示详细说明
%%
%database1:Books about US Politics
A=load('polbooks.mat','A');
k=load('polbooks.mat','k');

nafp=fopen('polbooks_NMI_ACC.txt','w');

clustering = alinkjaccard( A.A,k.k );
fp=fopen('polbooks_alinkjaccard.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('polbooks_alinkjaccard.txt','polbooks_gd.txt',k.k);
fprintf(nafp,'alinkjaccard: NMI:%f ACC:%f \n',NMI,ACC);

clustering = girvannewman( A.A,k.k );
fp=fopen('polbooks_girvanewman.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('polbooks_girvanewman.txt','polbooks_gd.txt',k.k);
fprintf(nafp,'girvanewman: NMI:%f ACC:%f \n',NMI,ACC);

clustering = rcut( A.A,k.k );
fp=fopen('polbooks_rcut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('polbooks_rcut.txt','polbooks_gd.txt',k.k);
fprintf(nafp,'rcut: NMI:%f ACC:%f \n',NMI,ACC);

clustering = ncut( A.A,k.k );
fp=fopen('polbooks_ncut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('polbooks_ncut.txt','polbooks_gd.txt',k.k);
fprintf(nafp,'ncut: NMI:%f ACC:%f \n',NMI,ACC);

clustering = modularity( A.A,k.k );
fp=fopen('polbooks_modularity.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('polbooks_modularity.txt','polbooks_gd.txt',k.k);
fprintf(nafp,'modularity: NMI:%f ACC:%f \n',NMI,ACC);

fclose(nafp);
%%

%%
%database2:football
A=load('football.mat','A');
k=load('football.mat','k');
nafp=fopen('football_NMI_ACC.txt','w');

clustering = alinkjaccard( A.A,k.k );
fp=fopen('football_alinkjaccard.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('football_alinkjaccard.txt','football_gd.txt',k.k);
fprintf(nafp,'alinkjaccard: NMI:%f ACC:%f \n',NMI,ACC);

clustering = girvannewman( A.A,k.k );
fp=fopen('football_girvanewman.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('football_girvanewman.txt','football_gd.txt',k.k);
fprintf(nafp,'girvanewman: NMI:%f ACC:%f \n',NMI,ACC);

clustering = rcut( A.A,k.k );
fp=fopen('football_rcut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('football_rcut.txt','football_gd.txt',k.k);
fprintf(nafp,'rcut: NMI:%f ACC:%f \n',NMI,ACC);

clustering = ncut( A.A,k.k );
fp=fopen('football_ncut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('football_ncut.txt','football_gd.txt',k.k);
fprintf(nafp,'ncut: NMI:%f ACC:%f \n',NMI,ACC);

clustering = modularity( A.A,k.k );
fp=fopen('football_modularity.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
[NMI,ACC] = evaluation('football_modularity.txt','football_gd.txt',k.k);
fprintf(nafp,'modularity: NMI:%f ACC:%f \n',NMI,ACC);

fclose(nafp);
%%

%%
%database3:DBLP
A=load('DBLP.mat','A');
k=load('DBLP.mat','k');

clustering = rcut( A.A,k.k );
fp=fopen('DBLP_rcut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);

clustering = ncut( A.A,k.k );
fp=fopen('DBLP_ncut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);

clustering = alinkjaccard( A.A,k.k );
fp=fopen('DBLP_alinkjaccard.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);

clustering = modularity( A.A,k.k );
fp=fopen('DBLP_modularity.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
%%
clustering = girvannewman( A.A,k.k );
fp=fopen('DBLP_girvanewman.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
%%

%%
%database4:Egonet
x=load('Egonet.mat','x');

clustering = modularity( x.x,10 );
fp=fopen('Egonet_modularity.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);

clustering = rcut(x.x,10 );
fp=fopen('Egonet_rcut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);

clustering = ncut(x.x,10 );
fp=fopen('Egonet_ncut.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);

clustering = alinkjaccard( x.x,10);
fp=fopen('Egonet_alinkjaccard.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
%%
clustering = girvannewman(x.x,10 );
fp=fopen('Egonet_girvanewman.txt','w');
fprintf(fp,'%d\n',clustering);
fclose(fp);
%%
end

