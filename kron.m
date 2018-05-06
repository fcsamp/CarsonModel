function M_red = myFun(M)

C = mat2cell(M,[(length(M)-1) 1],[(length(M)-1) 1]);

c1 = C{1,1};
c2 = C{1,2};
c3 = C{2,1};
c4 = C{2,2};

M_red = c1 - c2*inv(c4)*c3;

end