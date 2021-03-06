%In class 19
%GB comments
1A 100
1B 100
1C 100
2. 100
Overall 100


% Problem 1. Imagine a clinical trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

mplacebo=mean(placebo);
mt1=mean(treatment1);
mt2=mean(treatment2);
means1=[mplacebo, mt1, mt2];
stdp=std(placebo);
stdt1=std(treatment1);
stdt2=std(treatment2);

mstdp=mean(stdp);
mstdt1=mean(stdt1);
mstdt2=mean(stdt2);
error=[mstdp,mstdt1,mstdt2];

figure (1);
bar(means1); 
hold on;
errorbar(means1,error,'r.-');

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 

all=zeros(10,3);
all(:,1)=placebo';
all(:,2)=treatment1';
all(:,3)=treatment2';

groups={'Placebo','Treatment 1', 'Treatment 2'};
[P, table, stats]=anova1(all,groups);

%Miguel Angel: There is statistically significant difference.

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 

multcompare(stats);
%Miguel Angel: 2 groups(placebo and treatment 1) have means significatly different from treatment 2

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.

%for xdat and ydat
[coeff]=polyfit(xdat,ydat,1);
plot(xdat,ydat,'r.','MarkerSize',22); 
hold on; plot(xdat,polyval(coeff,xdat),'k.-','LineWidth',3);
%best

[coeff]=polyfit(xdat,ydat,2);
plot(xdat,ydat,'r.','MarkerSize',22);
hold on; plot(xdat,polyval(coeff,xdat),'k.-','LineWidth',3);

[coeff]=polyfit(xdat,ydat,3);
plot(xdat,ydat,'r.','MarkerSize',22);
hold on; plot(xdat,polyval(coeff,xdat),'k.-','LineWidth',3);

%Miguel Angel: the lineal would be the most apporpiate, because we can see
%that with order 2 and 3 the polynomial values are set to almost equal zero
%in order to linearize the equations.

%for xdat and ydat2
[coeff]=polyfit(xdat,ydat2,1);
plot(xdat,ydat2,'r.','MarkerSize',22);
hold on; plot(xdat,polyval(coeff,xdat),'k.-','LineWidth',3);
%not good

[coeff]=polyfit(xdat,ydat2,2);
plot(xdat,ydat2,'r.','MarkerSize',22);
hold on; plot(xdat,polyval(coeff,xdat),'k.-','LineWidth',3);
%better but still not good

[coeff]=polyfit(xdat,ydat2,3);
plot(xdat,ydat2,'r.','MarkerSize',22);
hold on; plot(xdat,polyval(coeff,xdat),'k.-','LineWidth',3);
%best fit to data.

