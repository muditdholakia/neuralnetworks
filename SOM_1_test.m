% Kohonen’s Network for Pattern Classification:
clc; 
% Consider FOUR input patterns as follows: 
% p1=[0.1 0.2 0.3 0.4 0.5]; 
% p2=[0.11 0.22 0.33 0.44 0.55]; 
% p3=[1 2 3 4 5]; % p4=[1.1 2.1 3.1 4.1 5.1]; 
% Represent these input patterns in Matrix form: 
p = [0.1 0.2 0.3 0.4 0.5; 0.11 0.22 0.33 0.44 0.55; 2.1 2.2 3.2 4.5 5.6; 1.1 2.1 3.1 4.1 5.1]; 
% However, data has to be input column wise to the ANN, and hence 
% transposition is necessary 
q = p' 
% You can now verify the transposed input data (which is in a column wise format) 
% q = % 0.1000 0.1100 1.0000 1.1000 
% 0.2000 0.2200 2.0000 2.1000 
% 0.3000 0.3300 3.0000 3.1000 
% 0.4000 0.4400 4.0000 4.1000 
% 0.5000 0.5500 5.0000 5.1000 
% Visibly, there are two distinct classes in the input data. 
% ********************************************************************* 
% ***********Creating the Competitive Learning ANN Architecture ****** 
% ************************************************************************ 
%To classify these 4 input patterns, create a two layer 
% Competitive Learning ANN with FIVE input elements 
% (the number of input neurons must be same as the dimension of the input data) 
% ranging from 0.1 to 5.11 (the overall min-max range of the data) 
% Note that, in the "newc" the first argument indicates the ranges of each of the FIVE nput elements, 
% and the second argument says that there are to be two neurons in the output. 
% Note that the number of output neurons decides the maximum number of 
% output classes to be created by ANN. In this case there are TWO distinct 
% classes to be created... % 
net = newc([0.1 5.1; 0.1 5.1 ; 0.1 5.1; 0.1 5.1; 0.1 5.1],2); 
% % The weights are initialized to the centres of the input ranges with the function midpoint. %
wts1 = net.IW{1,1} ;
% You can check to see these initial values as follows: 
%wts = % 2.6000 2.6000 2.6000 2.6000 2.6000 
% 2.6000 2.6000 2.6000 2.6000 2.6000 
% These weights are indeed the values at the midpoint of the range (0 to 1) of the inputs, 
% as you would expect when using midpoint for initialization. % 
% The biases are computed by initcon, which gives % 
biases = net.b{1} ;
% % biases = 
% 5.4366 
% 5.4366 
% Now you have a network, but you need to train it to do the classification job. % 
% Recall that each neuron competes to respond to an input vector p. 
% If the biases are all 0, the neuron whose weight vector is closest to p gets the highest net input 
% and, therefore, wins the competition and outputs 1. 
% All other neurons output 0. You want to adjust the winning neuron so as to move it closer to the input. 
% A learning rule to do this is discussed in the next section.

% **************** Kohonen Learning Rule (learnk)******************** 
% The function learnk is used to perform the Kohonen learning rule in this toolbox. 
% The weights of the winning neuron (a row of the input weight matrix) are adjusted 
% with the Kohonen learning rule. Supposing that the ith neuron wins, 
% the elements of the ith row of the input weight matrix are adjusted as shown below. 
% The Kohonen rule allows the weights of a neuron to learn an input vector, 
% and because of this it is useful in recognition applications. 
% Thus, the neuron whose weight vector was closest to the input vector is updated to be even closer. 
% The result is that the winning neuron is more likely to win the 
% competition % Next time a similar vector is presented, 
% and less likely to win when a very different input vector is presented. 
% As more and more inputs are presented, each neuron in the layer closest to a group of input vectors 
% soon adjusts its weight vector toward those input vectors. 
% Eventually, if there are enough neurons, every cluster of similar input vectors will have 
% neuron that outputs 1 when a vector in the cluster is presented, 
% while outputting a 0 at all other times. Thus, the competitive network learns to categorize 
% the input vectors it sees. 
% ******************************* % Training % ******************************* 
% Now train the network for 50 epochs. You can use either train or adapt.% 
net.trainParam.epochs = 100; 
net = train(net,q); 
% For each epoch, all training vectors (or sequences) are each presented once in a different random order 
% with the network and weight and bias values updated after each individual presentation. 
% Next, supply the original vectors as input to the network, simulate the network, and 
% finally convert its output vectors to class indices. %
a = sim(net,q); 
class_index = vec2ind(a) 
% This yields 
% class_index = 
% 1 1 2 2 
% Note that the network is trained to classify the input vectors into two groups, 
%First two vectors are put into class 1, and the other two vectors are put into class 2.