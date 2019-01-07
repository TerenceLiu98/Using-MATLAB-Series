%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Binomial Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
profile one
% X is a binomial random variablw with parameters (25, 0.2)
% In MATLAB we use `binocdf`

% X is a binomial random variablw with parameters (25, 0.2)
% In MATLAB we use `binocdf` or `binopdf`

prob = binocdf(3,  25, 0.2); % the probability of X less than 3 
prob2 = sum(binopdf(0:3, 25, 0.2)); % the sum of the PDF from 0 to 3 

% this two commands have the same return 

% Get the values for the domain, x. 
x = 0:6; 
% Get the values of the probability density function 
% First for n = 6, p = 0.3
n_1 = 6; p_1 = 0.3;
pdf1 = binopdf(x, n_1, p_1);
%Second for n = 6, p = 0.7
n_2 = 6; p_2 = 0.7;
pdf2 = binopdf(x, n_2, p_2);
% Do the plots 
subplot(1, 2, 1), bar(x, pdf1, 1, 'red')
title("n_1 = 6, p_1 = 0.3")
xlabel("x"), ylabel("f(x)")
axis square
subplot(1,2,2), bar(x, pdf2, 1,'blue')
title("n_2 = 6, p_2 = 0.7")
xlabel("x"), ylabel("f(x)")
axis square

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Poisson Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this is another way to calculate the cdf and pdf 
% X = 3, lambda = 4
X = 0:3; lambda = 4;
prob_P = cdf("Poisson", 3, 4);
Pro_P2 = sum(pdf("Poisson",0:3, 4));
pdf_P = poisspdf(X, 4);
subplot(1,1,1), bar(X, pdf_P, 'white')
title("Poission")
xlabel("x"), ylabel("f(x)")
axis square

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Uniform Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get the domin over which we will
% evaluate the functions 
x = -1:.1:11;
% get the probability density function values at x
pdf = unifpdf(x, 0, 10);
% get the cumulate density function 
cdf = unifcdf(x, 0, 10);

%plot pdf & cdf
subplot(1,2,1);
plot(x,pdf, 'black');
title("PDF of uniform distribution");
xlabel("x"), ylabel("f(x)")
axis([-1 11 0 0.2]);
axis square

subplot(1,2,2);
plot(x,cdf, 'black');
title("CDF of uniform distribution");
xlabel("x"), ylabel("f(x)");
axis([0 11 0 1.5]);
axis square

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Normal Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set up the parameter for the normal distribution 
mu = 0;
sigma = 1;
% Set up the upper and lower limits, these are in the two element vector 'specs'
specs = [-1, 1];
prob = normspec(specs, mu, sigma, "inside");
prob2 = normspec(specs, mu, sigma, "outside");



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Exponential Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = 0:10;
pdf = exppdf(x, 12);
cdf = expcdf(x, 12);

subplot(1,2,1);
plot(x,pdf,'red')
xlabel('x'); ylabel('f(x)');
title('PDF of Exponential Distribution');
axis square

subplot(1,2,2)
plot(x,cdf, 'blue')
xlabel('x'); ylabel('f(x)');
title('CDF of Exponential Distribution');
axis square


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Gamma Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get the domin over which to evaluate the functions
x = 0:.01:3;
% get the functions values for  different values of lambda 
y1 = gampdf(x, 1, 1/1);
y2 = gampdf(x, 2, 1/2);
y3 = gampdf(x, 3, 1/3);

%plot the functions 
subplot(1,1,1);
plot(x, y1,'r', x, y2, 'g', x, y3, 'b');
title('PDF of Gamma Distribution');
xlabel('x'); ylabel('f(x)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Chi-Square Distribution %%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

chi2_pdf = chi2pdf(x,2);
subplot(1,1,1);
plot(x,chi2_pdf,'b')
title('PDF of Chi-Square Distribution')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Weibull Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0:0.1:4.5;
h1 = exppdf(t,0.8862)./(1-expcdf(t,0.8862));
h2 = wblpdf(t,1,2)./(1-wblcdf(t,1,2));
plot(t,h1,'--',t,h2,'-')

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Beta Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get the domain over which to evaluate the density function 
x = 0.01:.01:.99;
%get the values for the density function 
y1 = betapdf(x, 0.5, 0.5);
y2 = betapdf(x, 3, 3);
%plot the results 
plot(x, y1, 'r', x, y2, 'b');
title('PDFs of Beta Distribution')
xlabel('x'); ylabel('f(x)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Multivariate Normal Distribution %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = [1 -1];
SIGMA = [.9 .4; .4 .3];
figure;
[X1,X2] = meshgrid(linspace(-1,3,25)',linspace(-3,1,25)');
X = [X1(:) X2(:)];
pdf = mvnpdf(X,mu,SIGMA);
surf(X1,X2,reshape(pdf,25,25));
cdf = mvncdf(X,mu,SIGMA);
surf(X1,X2,reshape(cdf,25,25));

%%%%%%%%%%
%% mean %%
%%%%%%%%%%

x = [1 2 3 4 5 6 7 8 9 10];
mean(x)

y = [1 2 3; 2 3 4; 3 4 5];
mean(y) == mean(y,1) % default mode: mean by column
mean(y,2) % mean by column 

%%%%%%%%%%%%%%
%% variance %%
%%%%%%%%%%%%%%

var(x); % variance of x
std(x); % std of x
var(x) == std(x) ^ 2 % to check whether they are equals

%%%%%%%%%%%%%%%%%%%%
%% Sample Moments %%
%%%%%%%%%%%%%%%%%%%%

% Generate a random sample from the uniform 
% distribution
n = 200;
x = rand(1,200); % uniform distribution random number 
% Find the mean of the sample 
mu = mean(x);
% Find the numerator and denominator for gamma_1 
num = (1/n) * sum((x - mu).^ 3);
den = (1/n) * sum((x - mu).^2);
gam1 = num / den^(3/2);

% Find the kurtosis
num = (1/n) * sum((x - mu) .^ 4);
den = (1/n) * sum((x - mu) .^ 2);
gam2 = num / den ^ 2; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Covariance and Correlation coefficient %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% First load the data. 
load ('/Volumes/Storage/computation statistics/CSToolbox V3/cement.txt');
% get the transformations 
xr = 1./cement(:,1);
logy = log(cement(:,2));
%get a sctterplot of the data to see if the relationship is lienar 
plot(xr, logy, 'x')
axis([0 1.1 2.4 4])
xlabel('Reciprocal of Drying Times')
ylabel('Log of Tensile Strength')

% get the covariance and the coreelation coefficient
cmat = cov(xr, logy)
cormat = corrcoef(xr, logy)

















