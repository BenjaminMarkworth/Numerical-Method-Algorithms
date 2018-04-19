# falsePosition.m
## Purpose
Once opened into Matlab the function falsePosition will be ready to use. falseposition.m will determine the root of a function using false position. By entering a function and selecting a lower and upper bracket the function falseposition.m will run false position on a user inputed function until the maximum number of iterations is met or until the approximate relative error is met. Resulting in the given root of a function between the lower and upper brackets.
### Inputs
This Matlab function contains five inputs. The first input is func which is the function being evaluated. The second input is xl which is the lower guess (lower bracket). The third input is xu which is the upper guess (upper bracket). The fourth input is es which is the desired relative error which is set to default at 0.0001%. The final input is maxiter which is the number of iterations desired which is set to default at 200.
### Outputs
This Matlab function contains four outputs. The first output is root which is the estimated root location. The second output is fx which is the function evaluated at the root location. The third output is ea which is the approximate relative error for the root found. And the final output is iter which is how many iterations were performed.
### Limitations
This algorithm won't work if the lower or upper guess is the actual root.
### Useful Information
Example on how to use:

clear

clc

syms x

f(x)=x^2-5

falsePosition(f,0,5,.0001,200)
