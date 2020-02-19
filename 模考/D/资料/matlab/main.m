%% matlab绘图详解
% 报告人：陈斌豪
% 报告日期：2020/2/2

%% Plot绘制
close all;
clear;
clc;
M=3.5:0.01:7.5;
q1=-0.25*M+5.6;                                                     %函数可能是已知表达式的
q2=-0.25*M+3.6;                                                     %可能是计算得到的数值解
q3=sin(M)+3;                                                        %也可能是数值解插值后的结果
l1=plot(M,q1,'Color',[250/255 204/255 181/255],'LineWidth',3);
hold on;
l2=plot(M,q3,'r--');
l4=plot(M(1:40:401),q3(1:40:401),'b.');
l3=plot(M,q2,'Color',[166/255 217/255 250/255],'LineWidth',3);
hold off;
str='ln $$m$$';
xlabel(str,'Interpreter','latex');                                  %坐标轴
ylabel('ln \itq');
xlim([3.5 8]);                                                      %坐标轴区间
ylim([1.5 5]);
legend([l1 l3],'action state','rest state');                        %图例
% grid on;                                                          %网格
% help grid ……
% grid minor;

% axis off;                                                         %坐标轴
% axis equal;

% ax=gca;                                                           %gca
% ax.XTick=linspace(pi,3*pi,9);
% ax.FontSize=5;
%% 子图
close all;
clear;
clc;
subplot(2,3,1);                                                     %子图
M=3.5:0.01:7.5;
q1=-0.25*M+5.6;                                                     %函数可能是已知表达式的
q2=-0.25*M+3.6;                                                     %可能是计算得到的数值解
q3=sin(M)+3;                                                        %也可能是数值解插值后的结果
l1=plot(M,q1,'Color',[250/255 204/255 181/255],'LineWidth',3);
hold on;
l2=plot(M,q3,'r--');
l4=plot(M(1:40:401),q3(1:40:401),'b.');
l3=plot(M,q2,'Color',[166/255 217/255 250/255],'LineWidth',3);
hold off;
str='ln $$m$$';
xlabel(str,'Interpreter','latex');                                  %坐标轴
ylabel('ln \itq');
xlim([3.5 8]);                                                      %坐标轴区间
ylim([1.5 5]);
legend([l1 l3],'action state','rest state');                        %图例

subplot(2,3,5);
l1=plot(M,q1,'Color',[250/255 204/255 181/255],'LineWidth',3);
hold on;
l2=plot(M,q3,'r--');
l4=plot(M(1:40:401),q3(1:40:401),'b.');
l3=plot(M,q2,'Color',[166/255 217/255 250/255],'LineWidth',3);
hold off;
str='ln $$m$$';
xlabel(str,'Interpreter','latex');                                  %坐标轴
ylabel('ln \itq');
xlim([3.5 8]);                                                      %坐标轴区间
ylim([1.5 5]);
legend([l1 l3],'action state','rest state');                        %图例
%% polar
close all;
clear;
clc;
theta=0:0.01*pi:4*pi;
r=1+0.5*theta;
polar(theta,r,'r--');
legend('Archimedean');
%% 对数坐标
close all;
clear;
clc;
x=0:1000;
y=exp(-20*log(x)+20);
subplot(1,3,1);
loglog(x,y,'r');
title('xy对数');
subplot(1,3,2);
semilogx(x,y,'r');
title('x对数');
subplot(1,3,3);
semilogy(x,y,'r');
title('y对数');
%% 双y轴图
close all;
clear;
clc;
x=0:0.1:10;
y1=exp(x).*sin(x);
y2=10*exp(x);
[AX,h1,h2]=plotyy(x,y1,x,y2);
set(get(AX(1),'Ylabel'),'String','Left Y');
set(get(AX(2),'Ylabel'),'String','Right Y');
xlabel('x');
h1.LineStyle='--';
%% 三维图
close all;
clear;
clc;
P=[0.0229 0.6882 0.6178 0.9727 0.3973 0.5611;
0.0667  0.626 0.5478 0.9367 0.8219  0.3265;
0.8617 0.0714 0.0478 0.0596  0.6986 0.1029;
0.8157 0.0967 0.0669 0.079 0.6438 0.1575;
0.8175 0.0495 0.0318 0.1048 0.6986 0.0923;
0.998 0.1846 0.1338 0.0556 0.4795 0.2549;
0.998 0.1846 0.1338 0.0556 0.4795 0.2549;
0.9595 0.1928 0.1401 0.0037 0.5205 0.2381];
x=1:6;
y=1:8;
[xx,yy]=meshgrid(x,y);
subplot(2,1,1);
plot3(xx,yy,P,'k*');
[xi,yi]=meshgrid(1:0.01:6,1:0.01:8);
zi=griddata(xx,yy,P,xi,yi,'cubic');
hold on;
mesh(xi,yi,zi);
hold off;
subplot(2,1,2);
plot3(xx,yy,P,'r*');
hold on;
surf(xi,yi,zi,'EdgeAlpha','0');
hold off;
colorbar;
% colormap winter;                                          %颜色图

figure(2);
mesh(xx,yy,P);
figure(3);
surf(xx,yy,P);
%% 矢量图
close all;
clear;
clc;
t0=linspace(0,2,21);
y0=linspace(0,2,21);
[T,Y]=meshgrid(t0,y0);
DT=ones(size(T));
DY=T.*sqrt(Y);
Dnorm=sqrt(DT.^2+DY.^2);
DT=DT./Dnorm;
DY=DY./Dnorm;
quiver(T,Y,DT,DY,0.8,'r');
%% 小提琴图
close all;
clear;
clc;
P=[0.0229 0.6882 0.6178 0.9727 0.3973 0.5611;
0.0667  0.626 0.5478 0.9367 0.8219  0.3265;
0.8617 0.0714 0.0478 0.0596  0.6986 0.1029;
0.8157 0.0967 0.0669 0.079 0.6438 0.1575;
0.8175 0.0495 0.0318 0.1048 0.6986 0.0923;
0.998 0.1846 0.1338 0.0556 0.4795 0.2549;
0.998 0.1846 0.1338 0.0556 0.4795 0.2549;
0.9595 0.1928 0.1401 0.0037 0.5205 0.2381];
[x,y]=size(P);
P=reshape(P,x*y,1);
violinplot(P);
%% 直方图
close all;
clear;
clc;
y = randn(1000, 1);
% hist(y, 4);
% hist(y,-4:4);
hist(y,[-4 2 3 9]);
%% 二维数据分布图
close all;
clear;
clc;
x = randn([10000,1]);
y = 2 * x + randn([10000,1]);

% xbins = 25;
% ybins = 25;
% [n, C] = hist3([x(:), y(:)], [xbins, ybins]);
% contourf(C{1}, C{2}, n);
% colorbar

xbins = 80;
ybins = 80;
[n, C] = hist3([x(:), y(:)], [xbins, ybins]);
imagesc(C{1}, C{2}, n);
set(gca,'YDir','normal');
colorbar;
%% 气泡图
close all;
clear;
clc;
data = csvread('data2.csv',1,0);
fd = data(1:111,:);
for i=1:100
    fd(111+i,:)=fd(1,:);
end
md = data(112:236,:);
% scatter(fd(:,2),fd(:,4),25,'r','filled');
% hold on;
% scatter(md(:,2),md(:,4),25,'b','filled');

scatter(fd(:,2),fd(:,4),fd(:,7),'r','filled','MarkerFaceAlpha',0.5);
hold on;
scatter(md(:,2),md(:,4),md(:,7),'b','filled','MarkerFaceAlpha',0.5);

legend('f','m')
xlabel('ageYear')
ylabel('heightIn')
%% 相关矩阵图
close all;
clear;
clc;
x = [1,-0.2,0.3,0.8,-0.5
   -0.2,1,0.6,-0.7,0.2
    0.3,0.6,1,0.5,-0.3
    0.8,-0.7,0.5,1,0.7
   -0.5,0.2,-0.3,0.7,1];
XVarNames = {'data_one','data_two','data_thr','data_fou','data_fiv'};
matrixplot(x,'FillStyle','nofill','textcolor','auto','XVarNames',XVarNames,'YVarNames',XVarNames);
matrixplot(x,'XVarNames',XVarNames,'YVarNames',XVarNames,'DisplayOpt','off','FigSize','Auto','ColorBar','on');
matrixplot(x,'XVarNames',XVarNames,'YVarNames',XVarNames,'DisplayOpt','off','FigSize','Full','ColorBar','on','FigShape','d');
%% 条形图
close all;
clear;
clc;
load fisheriris
setosa=meas(find(ismember(species,'setosa')),:);
versicolor=meas(find(ismember(species,'versicolor')),:);
virginica=meas(find(ismember(species,'virginica')),:);
setosa=mean(setosa);
versicolor=mean(versicolor);
virginica=mean(virginica);
data=[setosa' versicolor' virginica'];
bar(data);
legend('setosa','versicolor','virginica');
ax=gca;
ax.XTickLabel={'Sepal Length','Sepal Width','Petal Length','Petal Width'};
%% 饼图
close all;
clear;
clc;
x=1:5;
label={'L1','L2','L3','L4','L5'};
percent=x/sum(x);
p=num2str(percent'*100,'%1.2f');
p=[repmat(blanks(1),length(x),1),p,repmat('%',length(x),1)];
p=cellstr(p);
label=strcat(label,p');
explode=[0 0 0 0 1];
subplot(2,1,1);
pie(x,explode,label);
legend('L1','L2','L3','L4','L5');
subplot(2,1,2);
pie3(x,explode,label);
legend('L1','L2','L3','L4','L5');
%% 堆积图
close all;
clear;
clc;
data = xlsread('data3.xlsx');
x=2004:1:2013;
area(x,data);
xlabel('Year');
ylabel('GDP (billion yuan)');
legend('Hebei','Shanxi','Jilin','Liaoning','Jiangsu','Zhejiang','Anhui','Fujian');
%% 堆积图2
close all;
clear;
clc;
t=0:4000;
m=((1-exp(-0.002*t))*(1.2*100000)^(1/3)+exp(-0.002*t)*10^(1/3)).^3;
m1=[m(1) m];
m1=m1(1,1:4001);
m2=[m m(end)];
m2=m2(1,2:4002);
fmt=(m2-m1)/2;
plot(t,m,'LineWidth',2);%0 114 189
hold on;
for i=1:length(m)-1
    h=area([t(i) t(i+1)],[m(i) m(i+1)],'FaceColor',[1 1 1]-[1 1-114/255 1-189/255]*(fmt(i)+fmt(i+1))/2/max(fmt),'EdgeAlpha',0);
%     h.EdgeAlpha=0;
end
load color.mat
colormap(color);
colorbar;
hold off;