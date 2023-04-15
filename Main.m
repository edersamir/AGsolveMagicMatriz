clc 
clear all

%Parametros
N=5;
Poblacion=2000;
Pm=0.03;  
Iteraciones=300;


[MatrizMagic,MejorCromosoma,FOMejorCromosoma] = FunctionAG(N,Poblacion,Pm,Iteraciones);
fprintf ('El resultado es ')

MatrizMagic
NombreArchivo=strcat("N=",num2str(N),"  Pobl=",num2str(Poblacion),"  ProbMut=",num2str(Pm)," Ite=",num2str(Iteraciones),".png");
fig1=plot(FOMejorCromosoma);
  hold on
title(NombreArchivo); 
saveas(fig1,NombreArchivo);








