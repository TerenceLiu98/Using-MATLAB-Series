%% Exercise One 
%% parameters
x_min = 0;
x_max = 10; 
n = 100;
alpha = 2;
beta = 3;
lambda = 2;

x = linspace(x_min, x_max, n);
beta_pdf = betapdf(x,alpha, beta);
exponential_pdf = exppdf(x,1/lambda);

subplot(1,2,1);
plot(x, beta_pdf, 'k');
xlabel('x'); ylabel('pdf');
title('Probability Density Function of beta(2,2)');

subplot(1,2,2);
plot(x, exponential_pdf, 'k-');
xlabel('x'); ylabel('pdf');
title('Probability Density Function of exp(2)');

%% Exerciese Two
%% parameters
clc; 
clear;
N = 10;
theta = 0.3; 
x_min = 0;
x_max = 10; 
n = 1000000000;

x = x_min:x_max;
probability_binomial = binopdf(x, N, theta);
subplot(1,1,1);
plot(x, probability_binomial);
xlabel('x'); ylabel('pdf');
title("pdf of binomial distribution Binomial(10,3)");

%% Exerciese Three
clc; 
clear;
%% parameters
values = 1; 
N = 1; 
theta = 0.3;
probability_bernoulli = zeros(10,1);
for i = 1:10
    probability_bernoulli(i) = binopdf(round(rand(1)), N, theta);
end
plot(1:10, probability_bernoulli);
xlabel('x'); ylabel('pdf');
title("plot of 10 times bernoulli");