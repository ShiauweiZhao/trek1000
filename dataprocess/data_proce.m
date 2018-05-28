clear
clc

    addpath ..\data\optitrack;
    addpath ..\data\trek1000;

taglog='log11.txt';
optitracklog='gt-1.txt';
tag=importdata(taglog);
optitrack=importdata(optitracklog);
taglength = size(tag.data);
optitracklength=size(optitrack(:,1));%%length
[timeuwb,x,y,z] = importtaglog(taglog,45, taglength);%%tag log to mat 
[timestamp,pos_x,pos_z,pos_y,q_w,q_x,q_y,q_z] = optitracktomat(optitracklog,1, optitracklength); %%optitrack log tomat
clear taglog optireacklog taglenth optitracklength；
%%计算trek1000时间戳
log_hour = floor(timeuwb/1e7);
log_minu = floor(timeuwb/1e5) - log_hour*100;
log_sec = floor(timeuwb/1e3) - log_minu*100 - log_hour*10000;
log_msec = timeuwb - log_sec*1000 - log_minu*100000 - log_hour*10000000;
log_t = log_hour*3600*1000 + log_minu*60*1000 + log_sec*1000 + log_msec;
log_time = log_t - log_t(1);
clear log_hour log_minu log_sec log_msec log_t ;
%%
%%计算optitrack时间戳
gt_t = timestamp/1e6;
gt_time = gt_t - gt_t(1);
%% x

plot(gt_time,pos_x,'LineWidth',1.5);grid on;hold on;plot(log_time,x,'r','LineWidth',1.5);legend('gt','log');xlabel('time(ms)');ylabel('value')
hold off;
%% y
figure
plot(gt_time,pos_y,'LineWidth',1.5);grid on;hold on;plot(log_time,y,'r','LineWidth',1.5);legend('gt','log');xlabel('time(ms)');ylabel('value')
hold off;

figure

plot(gt_time,pos_z,'LineWidth',1.5);grid on;hold on;plot(log_time,z,'r','LineWidth',1.5);legend('gt','log');xlabel('time(ms)');ylabel('value')







