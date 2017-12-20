%Ex 10
x = linspace(-4,4,11);
f = (x.^2)';
figure('Name','Polinomio trigonometrico interpolante f(x)=x^2');
trigonometrical_interpolating(x, f);

f = sin(x);
f = (f.^2)';
figure('Name','Polinomio trigonometrico interpolante f(x)=(sin(x))^2');
trigonometrical_interpolating(x, f);


%Ex 11

x = linspace(-5,9,8); %No punti simmetrici rispetto all'origine
f = tan(x)';
figure('Name','Polinomio trigonometrico interpolante f(x)=tan(x)');
trigonometrical_interpolating(x, f);

f = exp(x)';
figure('Name','Polinomio trigonometrico interpolante f(x)=e^x');
trigonometrical_interpolating(x, f);
