% n=0;            %initialize iteration counter
% eps=1;          %initialize error
% x=[1;1];        %set starting value
% 
% %Computation loop
% while eps>1e-10&n<100
%     gradf=[4*(x(1)-x(2))^3+4*x(1)-1;-4*(x(1)-x(2))^3+2*x(2)+2];  %gradf(x)
%     eps=abs(gradf(1))+abs(gradf(2));                             %error
%     Hf=[12*(x(1)-x(2))^2+4,-12*(x(1)-x(2))^2;...                 %Hessean
%             -12*(x(1)-x(2))^2,12*(x(1)-x(2))^2+2];
%     y=x-Hf\gradf;                                                %iterate
%     x=y;                                                         %update x
%     n=n+1;                                                       %counter+1
% end
% n,x,eps,        %display end values

% n=0;            %initialize iteration counter
% eps=1;          %initialize error
% x=[3.5;3.7];        %set starting value
% 
% %Computation loop
% while eps>1e-10&n<100
%     g=[-x(1)+x(2) ;(3*x(1)^2/(x(1)^2+4)^2-0.5*x(2))];         %g(x)
%     eps=abs(g(1))+abs(g(2));                             %error
%     Jg=[-1,1;
%         24*x(1)/(x(1)^2+4)^2,-0.5];   %Jacobian
%     y=x-Jg\g;                                            %iterate
%     x=y;                                                 %update x
%     n=n+1;                                               %counter+1
% end
% n,x,eps,        %display end values

n=0;            %initialize iteration counter
eps=1;          %initialize error
x=[3.5;3.7];        %set starting value

%Computation loop
while eps>1e-10&n<100
    g=[-x(1)+x(2) ;(3*x(1)^2/(x(1)^2+4)^2-0.5*x(2))];         %g(x)
    eps=abs(g(1))+abs(g(2));                             %error
    Jg=[-1,1;
        24*x(1)/(x(1)^2+4)^2,-0.5];   %Jacobian
    y=x-Jg\g;                                            %iterate
    x=y;                                                 %update x
    n=n+1;                                               %counter+1
end
n,x,eps,        %display end values