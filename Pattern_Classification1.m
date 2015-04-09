clc;
clear all;
close all;
%Implement program of pattern classification using perceptron.
% Extend it for 1) Limtit number of epochs 2) Print Final Weights 2) Print
% Bias (if any) 3) Check with other pattern which is not used in traing 4)
% Print error 5) Plot orignial patterns , Stragiht Line and new patterns
% which are classified in their respective class.
x = [0 0 0 0 1 1 1 1 ; 0 0 1 1 0 0 1 1; 0 1 0 1 0 1 0 1 ];
t = [0 1 1 1 1 1 1 1];
ep=input('Enter number of epoches:-');
w=[0 0 0];
net = perceptron;
net = configure(net,x,0);
net.IW{1,1}=w;
disp('Initial weights:-');
w=net.IW{1,1};
disp(w);
net.trainParam.epochs = ep;
net = train(net,x,t);
view(net)
y = net(x);
w=net.IW{1,1};
disp('Final weights:-');
disp(w);
error=t-y;
disp('Error:-')
disp(error)
bias=net.b{1};
disp('Bias is:-');
disp(bias)
plotpv(x,t)
hold on
plot(x,y)
%plotpc(net.IW{1,1},net.b{1})
hold off

title('Graph:-')