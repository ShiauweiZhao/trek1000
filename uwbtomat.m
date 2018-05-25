%%读取处理过的txt taglog
taglog='log11.txt';
optitracklog='gt-1.txt';
tag=importdata(taglog);
optitrack=importdata(optitracklog);
taglength = size(tag.data);
optitracklength=size(optitrack(:,1));%%length

[timeuwb,x,y,z] = importtaglog(taglog,1, taglength);%%tag log to mat 
[timestamp,pos_x,pos_y,pos_z,q_w,q_x,q_y,q_z] = optitracktomat('gt-1.txt',1, optitracklength); %%optitrack log tomat

timemocap=max(timestamp)-min(timestamp);
timetag=max(timeuwb)-min(timeuwb);
time=