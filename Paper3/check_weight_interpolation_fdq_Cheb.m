%Ex 4 paper 3
for n=2:4:20
   figure
   x = generate_cheb_nodes(n,-1,1);
   calculate_weigth_interpolation(x, true);
   legend(num2str(n));
end