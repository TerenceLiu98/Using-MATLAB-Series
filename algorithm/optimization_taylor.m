g=sin(x);
taylor_1 =taylor(g,x,1);   % 展开成x-1
pretty(taylor_1);

clean;
clc;

x = 0:0.05:2;
y = sin(x);
y1 = sin(1) - (sin(1).*(x - 1).^2)/2;
y2 = sin(1) - (sin(1).*(x - 1).^2)/2 + (sin(1).*(x - 1).^4)/24 + cos(1).*(x - 1);
plot(x,y,'color','r'); %red
hold on;
plot(x,y1,'color','y'); %yellow
hold on;
plot(x,y2,'color','b'); %blue
