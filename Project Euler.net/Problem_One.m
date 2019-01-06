%%%%%%%%%%%%%%%%%
%% Problem One %%
%%%%%%%%%%%%%%%%%
%If we list all the natural numbers below 10 that are multiples of 3 or 5, 
%we get 3, 5, 6 and 9. The sum of these multiples is 23.
%Find the sum of all the multiples of 3 or 5 below 1000.

clc;
clear all;

x = 1:1:999;

y1 = find((gcd(3,x) == 3) == 1); % calculate the multiples of 3
y2 = find((gcd(5,x) == 5) == 1); % calculate the multiples of 5
y3 = find((gcd(15,x) == 15) == 1); 
ans = (sum(y1) + sum(y2) - sum(y3)); % delete the multiples of 3 times 5

% there is also another way to get the answer: 
ans2 = sum(unique([3:3:999,5:5:999])) 

%Answer is 233168