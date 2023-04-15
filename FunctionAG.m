

function [MatrizMagic,MejorCromosoma,FOMejorCromosoma] = FunctionAG(N,Poblacion,Pm,Iteraciones)


%Población Inicial:
Generacion=zeros(Poblacion,N*N); 
FOGen=zeros(Poblacion,1);

for i=1:Poblacion
  Generacion(i,:)=randperm(N*N);
  FOGen(i)=FuncionObjetivo(reshape(Generacion(i,:),[N,N])',N);
  %Condicional if FOGen(i)=0 el algoritmo termina y es la repsuesta
  if FOGen(i)==0
    fprintf ('El resultado es')
    reshape(Generacion(i,:),[N,N])
  end     
end
originalFOGen=FOGen;
FOGen=1./FOGen;

ExpectedCount=zeros(Poblacion,1);
for i=1:Poblacion
   ExpectedCount(i)= Poblacion*((FOGen(i)/sum(FOGen)));
end    

%Población Intermedia
ExpectedCountTemp=ExpectedCount;
GeneracionInt=zeros(Poblacion,N*N);
c=1;
for i=1:Poblacion
 [M,Ind] = max(ExpectedCountTemp); 
 GeneracionInt(c,:)=Generacion(Ind,:);
 ExpectedCountTemp(Ind)=ExpectedCountTemp(Ind)-1;
 c=c+1;
end



%Inicia Ciclo:
%Evolución 
%No hay cruce
MejorCromosoma=zeros(Iteraciones,N*N);
FOMejorCromosoma=zeros(Iteraciones,1);

for ciclo=1:Iteraciones
ciclo
GeneracionHijos=GeneracionInt;
%%%%%%%%%%%%%%%%%%%%%       Mutación

AlelosPermutados=round(Poblacion*N*N*Pm);
GenTemporal=zeros(1,N*N);

for i=1:AlelosPermutados
   PCrom=randi([1,Poblacion]);
   P1=randi([1, N*N]);
   P2=randi([1, N*N]);
   GenTemporal=GeneracionHijos(PCrom,:);
   GeneracionHijos(PCrom,P1)= GenTemporal(P2);
   GeneracionHijos(PCrom,P2)= GenTemporal(P1);
end

%Función Objetivo Hijos:
FOHijos=zeros(Poblacion,1);
for i=1:Poblacion
  FOHijos(i)=FuncionObjetivo(reshape(GeneracionHijos(i,:),[N,N])',N);
  if FOHijos(i)==0
    MatrizMagic= reshape(GeneracionHijos(i,:),[N,N]);
    return
  end     
end

originalFOGenH=FOHijos;
FOHijos=1./FOHijos;

%Mejores resultados
[M,Ind2] = min(originalFOGenH);
MejorCromosoma(ciclo,:)= GeneracionHijos(Ind2,:);
FOMejorCromosoma(ciclo,:)=originalFOGenH(Ind2,1);

%Ruleta:

ExpectedCountH=zeros(Poblacion,1);
for i=1:Poblacion
   ExpectedCountH(i)= Poblacion*((FOHijos(i)/sum(FOHijos)));
end  


ExpectedCountTempH=ExpectedCountH;
GeneracionIntH=zeros(Poblacion,N*N);
c=1;
for i=1:Poblacion
 [M,Ind] = max(ExpectedCountTempH); 
 GeneracionIntH(c,:)=GeneracionHijos(Ind,:);
 ExpectedCountTempH(Ind)=ExpectedCountTempH(Ind)-1;
 c=c+1;
end

GeneracionInt=GeneracionIntH;
end

MatrizMagic="No fue posible encontrar la Matriz";







