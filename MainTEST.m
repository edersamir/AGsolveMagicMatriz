clc 
clear all

%Parametros
N=5;
%Poblacion=1000;
%Pm=0.03;  
Iteraciones=300;
Repeticiones=10;
%for N=3:10
for Pm=0.01:0.01:0.3
 for Poblacion=10:50:1000
    for i=1:Repeticiones
        [MatrizMagic,MejorCromosoma,FOMejorCromosoma] = FunctionAGTest(N,Poblacion,Pm,Iteraciones);
       % fprintf ('El resultado es ')
       % MatrizMagic
        NombreArchivo=strcat("N=",num2str(N),"  Pobl=",num2str(Poblacion),"  ProbMut=",num2str(Pm)," Ite=",num2str(Iteraciones),".png");
        fig1=plot(FOMejorCromosoma);
        hold on
        title(NombreArchivo); 
        saveas(fig1,NombreArchivo);
    end
  hold off
 end %Fin Poblacion

end %Fin Pm
%end %Fin N


