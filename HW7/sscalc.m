function ss = sscalc(X)

%Calculate SS

%do it for each each group


%take variable
%find mean
% dtot = totvec' - totvecm*ones(length(totvec),1);
% SStot = dtot'*dtot;
% doftot = length(totvec-1);
%do thatno

aa = mean(X);
d = X - aa*ones(length(X),1);
ss = d' * d;
end

