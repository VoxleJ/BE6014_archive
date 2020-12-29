function [xg, yg, itr_fin, eig_S, lambda ] = riterq(A, x0, maxitr)
%xg is norm guess vector
%A is square matrix
%maxitr is max iterations
%Outputs:
%xg--> x guess vector output for each iteration
%yg--> y guess vector output for each iteration
%itr_fin --> end iteration for convergence
%eig_S-->Converged eigenvector
%lambda --> Converged eigenvalue
    dimd = size(A);
    id = eye(dimd(1));
    
    xg = x0/norm(x0);
    yg = xg'*A*xg;

    
    itr = 0;
    for kk = 1:maxitr
        xg(:,kk+1) = inv((A-(yg(kk)*id)))*xg(:,kk);
        %normalize
        xg(:,kk+1) =  xg(:,kk+1)/norm(xg(:,kk+1));
        %add to yg vector
        yg(:,kk+1) = xg(:,kk+1)' * A * xg(:,kk+1);
        itr = itr + 1;
        
        %find best
        if abs(xg(:,kk) - xg(:,kk+1)) < 0.00001
            itr_fin = itr; %count
            eig_S = xg(:,kk+1); %converged eigv
            lambda = yg(:,kk+1);
            break
        end
    end
    
            