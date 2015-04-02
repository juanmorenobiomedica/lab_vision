%Generador diccionario de textones

clear all;close all;clc;
addpath('lib')
%numero de textones en diccionario
k = 50;
%create filter bank
[fb] = fbCreate;
% % imagenes de referencia para construir diccionario de textones
% im1=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T01_01.jpg')))/255;
% im2=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T02_01.jpg')))/255;
% im3=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T03_01.jpg')))/255;
% im4=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T04_01.jpg')))/255;
% im5=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T05_01.jpg')))/255;
% im6=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T06_01.jpg')))/255;
% im7=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T07_01.jpg')))/255;
% im8=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T08_02.jpg')))/255;
% im9=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T09_01.jpg')))/255;
% im10=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T10_03.jpg')))/255;
% im11=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T11_01.jpg')))/255;
% im12=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T12_01.jpg')))/255;
% im13=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T13_03.jpg')))/255;
% im14=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T14_02.jpg')))/255;
% im15=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T15_01.jpg')))/255;
% im16=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T16_01.jpg')))/255;
% im17=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T17_01.jpg')))/255;
% im18=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T18_01.jpg')))/255;
% im19=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T19_01.jpg')))/255;
% im20=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T20_01.jpg')))/255;
% im21=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T21_01.jpg')))/255;
% im22=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T22_01.jpg')))/255;
% im23=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T23_01.jpg')))/255;
% im24=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T24_01.jpg')))/255;
% im25=double(rgb2gray(imread('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\T25_02.jpg')))/255;
% 
% im = [im1 im2 im3 im4 im5 im6 im7 im8 im9 im10 im11 im12 im13 im14 im15 im16 im17 im18 im19 im20 im21 im22 im23 im24 im25];
% 
% % diccionario de textones
% [map,textons] = computeTextons(fbRun(fb,im),k);
% folder=fullfile('C:\Users\JUAN\Documents\GitHub\Nueva carpeta\lab6_textons\lib','textones.mat');
% save(folder, 'textons' )
load('textones')
% Generador histogramas Train
D=dir(fullfile('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\textures\train\*.jpg'));

for i=1:numel(D),
    nombre=D(i).name;
        im2=double(imread(strcat('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\textures\train\',nombre)))/255;
        tmap = assignTextons(fbRun(fb,im2),textons');
%          figure;subplot(1,2,1);imshow(tmap,[]);colormap(jet);
%         subplot(1,2,2);bar(histc(tmap(:),1:k)/numel(tmap));
%         drawnow;
        htr{i}= histc(tmap(:),1:k)/numel(tmap);
    
end
%     folder1=fullfile('C:\Users\JUAN\Documents\GitHub\Nueva carpeta\lab6_textons\lib','htrm.mat');
%     save(folder1,'htr')

%    Generador Histogramas Test

% D2=dir(fullfile('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\textures\test\*.jpg'));
% for i=1:numel(D2),
%     nombre=D2(i).name;
%         im3=double(imread(strcat('C:\Users\JUAN\Documents\GitHub\visionartificial\lab6_textons\textures\test\',nombre)))/255;
%         tmap = assignTextons(fbRun(fb,im3),textons');
%         htest{i} = histc(tmap(:),1:k)/numel(tmap);        
% end
%     folder=fullfile('C:\Users\JUAN\Documents\GitHub\Nueva carpeta\lab6_textons\lib','htestm.mat');
%     save(folder, 'htest')
% 
%     
