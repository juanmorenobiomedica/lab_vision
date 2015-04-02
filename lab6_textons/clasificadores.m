close all
clear all
clc
addpath('lib')

load ('htrm')
load ('htestm')
fileID = fopen('texture_names.txt');
formatSpec = '%s%[^\n\r]';
dataArray = textscan(fileID, formatSpec);
ncat = dataArray{:,1};
fclose(fileID);
htrainmat = cell2mat(htr);
htrainmat = htrainmat';
htestmat = cell2mat(htest);
htestmat = htestmat';
trainfolder=dir(fullfile('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\textures\train\*.jpg'));
testfolder=dir(fullfile('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\textures\test\*.jpg'));

for i=1:numel (trainfolder)
    nombre=trainfolder(i).name;
    nombrecat{i}= nombre(1:3);
        
end
nombrecat=nombrecat';

for d=1:numel(testfolder)
    nombre=testfolder(d).name;
    categoria{d}= nombre(1:3);
 end
categoria=categoria';
k=1;
tic
% Nearest Neighbor
    Clasificador=knnclassify(htestmat,htrainmat,nombrecat,k,'cityblock');
    folder4=fullfile('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons','nnclasificador.mat');
    save(folder4, 'Clasificador')
toc
%Matriz de confusión NearestNeighbor
C1= confusionmat(categoria,Clasificador);
y= diag(C1);
mean (y)
figure; imagesc(C1) ;


% Random forest
tic
rng default
features = htrainmat;
classLabels = nombrecat;
nTrees = 200;
B = TreeBagger(nTrees,features,classLabels, 'Method','classification', 'oobpred','on');
TestData = htestmat;
predChar = B.predict(TestData);
figure; plot(oobError(B))
xlabel('Number of grown trees')
ylabel('Out-of-bag classification error')
toc
C2= confusionmat(categoria, predChar);
x= diag(C2);
mean (x)
figure; imagesc(C2) 
