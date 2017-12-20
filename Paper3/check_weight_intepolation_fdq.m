%Ex 3 paper 3
%Le linee sono disegnate solo per mostrare l'oscillazione del segno dei
%pesi
for n=2:4:20
   figure
   x = 0:1:n;
   calculate_weigth_interpolation(x, true);
   legend(num2str(n));
end