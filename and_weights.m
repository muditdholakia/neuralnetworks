clc;
close all;
clear all;

w21=input('input weight 1:' );
w22=input('second weight 2:');

x1=[0,0,1,1];
x2=[0,1,0,1];

d=[0,0,0,1];
cw=0;
count=1;
for i=1:4
    v=(w21.*x1(i))+(w22.*(x2));
    if(v(i)<1)
        y=0;
    else
        y=1;
    end
    e=d(i)-y;
    if(e>0 || e<0)
       cw1=1*e*x1(i);
       w21=w21+cw1;
       
       cw2=1*e*x2(i);
       w22=w22+cw2;
       count=count+1;
       continue;
    end
    
end
disp('synaptic weights w21 :');
disp(w21);
disp('synaptic weights w22 :');
disp(w22);
disp('number of iterations :');
disp(count);

