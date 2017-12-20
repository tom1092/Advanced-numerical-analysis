%Ex 13
%Eventualmente settare un passo eps per generare nodi uniformi con distanza
%diversa da 1

eps = 1;
for n=2:4:20
   x = 0:eps:n; %genera n punti tra 0 ed n con passo eps
   h = n/(length(x)-1); %TODO: generalizzabile al caso a diverso da zero
   w = ones(1,length(x)) * h;
   w(1) = h/2;
   w(length(x)) = h/2;
   figure
   plot(x, w)
   legend(num2str(n));
end