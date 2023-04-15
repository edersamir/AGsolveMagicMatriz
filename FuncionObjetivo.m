function y = FuncionObjetivo(Matriz,N)

%Calculo dela F.O.
Sumas=zeros(2*N,1);
C=0;
for i=1:N
  C=C+1;
  Sumas(C)=0;
  for j=1:N 
      Sumas(C)=Sumas(C)+Matriz(i,j);
  end  
end

for j=1:N
  C=C+1;
  Sumas(C)=0;
  for i=1:N 
      Sumas(C)=Sumas(C)+Matriz(i,j);
  end  
end
y=std(Sumas);
