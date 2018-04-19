function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falseposition.m will determine the root of a function using false
%position.
%   By entering a function and selecting a lower and upper bracket the
%   function falseposition.m will run false position on a user inputed
%   function until the maximum number of iterations is met or until the
%   approximate relative error is met. Resulting in the given root of a
%   function between the lower and upper brackets.
%Inputs:
%   func - the function being evaluated
%   xl - the lower guess (lower bracket)
%   xu - the upper guess (upper bracket)
%   es - the desired relative error (default at 0.0001%)
%   maxiter - the number of iterations desired (default at 200)
%Outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed
%Created By: Benjamin Markworth on February 18,2018

%Creating errors and default values depending on how many input arguments
%are present
if nargin<3
    error('Invalid number of arguments')
end
if nargin==3
    es=0.0001;
    maxiter=200;
end
if nargin==4
    maxiter=200;
end
if nargin>5
    error('Invalid number of arguments')
end
%Setting up counter for iterations performed through while loop and setting
%error to 100% for initial guesses so the while loop can run
iteration=1;
ea=1;
%Created a while loop to run until either the iteration counter is greater
%than the maxiter or the absolute relative error is greater than the
%calculated error in the while loop
while (iteration<maxiter) && (es<ea)
    xl=xl;
    xu=xu;
    root=(xu)-(((func(xu))*(xl-xu))/((func(xl))-(func(xu))));%False position calculation to find root
    fx=func(root);%Finding the function value at the calculated root
    rv(iteration+1)=root;%Storing the root as a vector so the new root can be used in the next loop
    ea=abs((rv(iteration+1)-rv(iteration))./(rv(iteration+1)))*100;%Approximate relative error calculation
    if fx*func(xl)<0%Determining which old bracket to use for new bracket depending on where the sign change occurs
        xu=root;
    elseif fx*func(xu)<0%Determining which old bracket to use for new bracket depending on where the sign change occurs
        xl=root;
    end
    iteration=iteration+1;%Adding one to the iteration counter for each loop completed
end
%make the output iter equal to the counter iteration of the while loop
iter=iteration
%Calculating the amount of iterations in while loop by subtracting one to
%account for the extra time the while loop ran
%Displaying all the outputs of the function
disp('The estimated root is:');disp(double(root));
disp('The function evaluated at the estimated root is:');disp(double(fx));
disp('The approximate relative error (in percent) is:');disp(double(ea));
disp('the number of iterations performed:');disp(double(iter));

