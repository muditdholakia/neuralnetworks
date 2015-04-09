clc
close all
clear all

vk = linspace(-1,1,30);
a = 8;
yk=vk;
yk1 = 1 ./(1+exp(-a * vk));
yk2 = tanh(a * vk);
plot(vk,yk,'go'),xlabel('vk'), ylabel('yk'),
hold on
plot(vk,yk1,'r*'),
hold on
plot(vk,yk2,'b-'), legend('Linear','Logistic','Hyperbolic Tangent','Orientation','vertical'),
grid on
axis equal

