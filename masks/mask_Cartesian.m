%-`mask_Cartesian.m`用于生成笛卡尔模板。 可以选择模板大小和读出线数。
clc;close all;clear all;
Num_fixed=20;   %中心区域行数
Num_Ran=80 ;     %其他区域随机行数
M=256; N=256;   %采样模板大小(M+2,N+2)

Mf=round(M/2);
Nf=round(N/2);

NH1=1:(Mf-Num_fixed/2);
NH2=(Mf+Num_fixed/2+1):M;
z1=length(NH1);
ranlist1= randperm(z1);  % randperm 随机打乱一个数列函数 y = randperm(n) y是把1到n这些数随机打乱得到的一个数字序列
z2=length(NH2);
ranlist2= randperm(z2); 

o=zeros(M,N);
o((NH1(end)+1):(NH2(1)-1),:)=1;

ranrow1=ranlist1(1:Num_Ran/2);
o(ranrow1,:)=1;
ranrow2=ranlist2(1:Num_Ran/2)+length(NH1)+Num_fixed;
o(ranrow2,:)=1;

Umask=o;

o1=zeros(M+2,N+2);
o1(2:end-1,2:end-1)=o;
whos o1

disp('测量比例，即采样率')
disp(sum(sum(o1))/((M+2)*(N+2)))
  
figure;imshow(o1)
title('平行线采样模板')
%  保存
 save Umask_Cartesian_100