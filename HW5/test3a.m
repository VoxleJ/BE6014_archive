%% Test 3a
clear,clc
A= [ 10/3 -5/3    0  5/3  2;
    -1/3  -4/3    0  1/3  4;
      2    -1    -4  -2   3;
     10    -23   -27 -5  33;
     5/3  -13/3  -6 -5/3  9]
Adim=size(A)
I=eye(Adim(1))
[V,lambda]=eig(A); %sanity check
%guess vectors
xguess_1=[0 0 1 0 0]';
xguess_2=[0 1 1 0 0]';
xguess_3=[0 0 0 -1 -1]';
xguess_4=[1 0 0 0 0]';
xguess_5=[-1 1 0 0 0]';
%xguess_5=[-1 1 0 0 0]'; good one
%normalized guess vectors
xguess_norm1=xguess_1/norm(xguess_1)
xguess_norm2=xguess_2/norm(xguess_2)
xguess_norm3=xguess_3/norm(xguess_3)
xguess_norm4=xguess_4/norm(xguess_4)
xguess_norm5=xguess_5/norm(xguess_5)
yguess_1=xguess_norm1'*A*xguess_norm1
yguess_2=xguess_norm2'*A*xguess_norm2
yguess_3=xguess_norm3'*A*xguess_norm3
yguess_4=xguess_norm4'*A*xguess_norm4
yguess_5=xguess_norm5'*A*xguess_norm5
guesscount=0;
p=1;
m=1;
% for n=1:1000 %arbitrary to just step through
% if p == 6 %how we break the loop once we are done with guess set 5
%     break
% end
%     if m==1
%     xguess_norm=eval(['xguess_norm',num2str(p)]);
%     yguess=eval(['yguess_',num2str(p)]);
%     end
%     xguess_norm(:,m+1)=(A-(yguess(m)*I))\xguess_norm(:,m); %calculate next unnormalized x guess and place in vector
%     xguess_norm(:,m+1)=xguess_norm(:,m+1)/norm(xguess_norm(:,m+1)); %calculate normalized version of new xguess vector and replace unnormalized version
%     yguess(:,m+1)=xguess_norm(:,m+1)'*A*xguess_norm(:,m+1); %calculate new yguess(lambda) based on new xguess, store in yguess vector
%     guesscount=guesscount+1; %tells me what iteration of guessing I am at (starts at zero with first guess)
%         if max(abs(yguess(:,m) -  yguess(:,m+1)))<0.00005 %if difference between successive gamma guesses is less than 4 dec places
%             master(p).iterations=guesscount; %update master matrix with iteration count to answer
%             master(p).xguess=xguess_norm; %update master matrix with matrix of x guess iterations; p+1 because xguess initial is first
%             master(p).yguess=yguess; %update master matrix with final calculated lambdas from converged xguess; p+1 because yguess initial is first
%             guesscount=0; %reset the guesscount because we are done now with this set
%             m=0; %reset the m value to zero so we can start over with a new guess set
%             p=p+1; %final step is to increment the guess set we are on
%         end
%     m=m+1; %manually increment the guess count
% end



%3
guesscount=0;
for m=1:2000
xguess_norm3(:,m+1)=inv((A-(yguess_3(m)*I)))*xguess_norm3(:,m);
xguess_norm3(:,m+1)=xguess_norm3(:,m+1)/norm(xguess_norm3(:,m+1));
yguess_3(:,m+1)=xguess_norm3(:,m+1)'*A*xguess_norm3(:,m+1);
guesscount=guesscount+1;
if max( abs(xguess_norm3(:,m) -  xguess_norm3(:,m+1)))<0.00005
    disp('The final X3 guess count index is:')
    guesscount
    iterations(3)=guesscount;
    disp('The converged eigenvector S3 is:')
    xguess_norm3(:,m+1)
    eigenvect_est(:,3)=xguess_norm3(:,m+1);
    disp('The final estimated eigen value, lambda 3, is:')
    yguess_3(:,m+1)
    eigenval_est(:,3)=yguess_3(:,m+1);
    break
end
end