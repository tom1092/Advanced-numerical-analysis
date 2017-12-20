function [Q,R] = QR_fact(A)
    %Ex 6 paper 2
    %ritorna le matrici Q e R associate alla decomposizione
    %Example of usage: 
    %A = [4 -2 1; 1 3 -1; -1 1 2; 0 1 3];
    %[Q, R] = QR_fact(A);
    
    R = A;
    m = length(A(:,1));
    n = length(A(1,:));
    M = m-1; %M = m-1
    if m > n %m>n --> M = n
        M = n;
    end
    Q = eye(m);
    for k=1:M
        x_tilde = R(k:m,k);
        u_tilde = x_tilde + sign(x_tilde(1))*norm(x_tilde)*eye(m-k+1,1);
        Hu = eye(m);
        Hu(k:m, k:m) = create_Hu(u_tilde); %immergo nell'identit�
        %computo le matrici R e Q
        R = Hu*R;
        Q = Q*Hu;
    end
end