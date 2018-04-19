function [L,U,P] = luFactor(A)
%luFactor.m will provide the user the lower triangular matrix, upper
%triangular matrix, and the pivot matrix for a user imputed coefficient
%matrix.
%Inputs:
%   A - The coefficient matrix (A symmetrical matrix that repesents a
%   system of equations and must by nxn)
%Outputs:
%   L - The lower triangular matrix of A (Matrix allowing user to see what
%   multipliers were used throughout gauss elimination)
%   U - The upper triangular matrix of A (Factorization of matrix A using
%   gauss elimination with pivoting)
%   P - The pivot matrix of A (Matrix to keep track of row switches
%   throughout gauss elimination and begins as an identity matrix)
%Created by Benjamin Markworth on March 25, 2018
%% Error Statements
%Error in case user doesn't input a coefficient matrix
if nargin<1
    error('Must input coefficient matrix')
end
%Error in case user enters more than just the coefficient matrix
if nargin>1
    error('Must only input coefficient matrix and nothing else')
end
%Error if user matrix isn't a square matrix since lu factorization can't be
%done to a non square matrix
if size(A,1)~=size(A,2)
    error ('Input matrix must be symmetrical')
end
%% Creating Starting Points to Satisfy PA=LU 
%Cakculating n by finding amount of rows because the matrix is symmetrical
%both the rows and columns total elements should be equal to n
n=size(A,1);
%Setting the pivot matrix to an identity matrix
P=eye(n);
%Setting the lower triangular matrix to an identity matrix
L=eye(n);
%Setting the upper triangular matrix to the coefficient matrix
U=A;
%% Algorithm to Run Lu Factorization
%Initiating loop to run through the entire matrix
for c=1:n
    %Calculating absolute value for all the coresponding xn depending on how
    %many times loop went through and finding the max of those values. Ex
    %the first time through the loop will find the absolute value of all
    %the x1s and determine which one was the max.
	pivot=max(abs(U(c:n,c)));
	%Determining what row the max abs value for xn was in and then
	%declaring that as the pivot row.
    for d=c:n
        if(abs(U(d,c))==pivot)
            m=d;
        end
    end
    %Pivoting the U matrix so the highest max abs value xn is above the
    %rest. For example the first time through the highest abs max x row
    %will pivot to the top row of the U matrix.
	U([c,m],c:n)=U([m,c],c:n);
    %Pivoting L matrix so the corresponding spot applies to the multiplier
    %used to eliminate x1 x2 all the way to  xn. Here k-1 is used to ensure
    %certain elements in the lower triangular matrix don't get swapped.
    %Makes sure the correct multipier is being applied to the corresponding
    %rows in the U matrix.
	L([c,m],1:c-1)=L([m,c],1:c-1);
    %Pivoting of the identity matrix to keep track of row swaps
    P([c,m],:)=P([m,c],:);
    %Using the multipliers in the L matrix to eliminate in order to make U
    %an upper triangular matrix.
	for d=c+1:n
        L(d,c)=U(d,c)/U(c,c);
        U(d,c:n)=U(d,c:n)-L(d,c)*U(c,c:n);
	end
end
%% Displaying L U P
%Displaying L
disp(L)
%Displaying U
disp(U)
%Displaying P
disp(P)
end
