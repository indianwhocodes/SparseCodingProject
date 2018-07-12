clc ;
clear all;
close all ;

% addpath
addpath RASL_toolbox ;
addpath data ;
addpath results ;

currentPath = cd ;
% input path
imagePath = fullfile(currentPath, 'data') ;
pointPath = fullfile(currentPath, 'data') ;
userName = 'Digits_3' ;

% output path
destRoot = fullfile(currentPath,'results') ;
destDir = fullfile(destRoot,userName) ;
if ~exist(destDir,'dir')
    mkdir(destRoot,userName) ;
end

%% define parameters

% dispaly flag
raslpara.DISPLAY = 1 ;

% save flag
raslpara.saveStart = 1 ;
raslpara.saveEnd = 1 ;
raslpara.saveIntermedia = 0 ;

% for windows images
raslpara.canonicalImageSize = [ 29  29];
raslpara.canonicalCoords = [ 5  24 ; ...
                             15 15  ];
                            
% parametric tranformation model
raslpara.transformType = 'EUCLIDEAN'; 

raslpara.numScales = 1 ; % if numScales > 1, we use multiscales

% main loop
raslpara.stoppingDelta = .01; 
raslpara.maxIter = 25; 

% inner loop
raslpara.inner_tol = 1e-6 ;
raslpara.inner_maxIter = 1000 ;
raslpara.continuationFlag = 1 ;
raslpara.mu = 1e-3 ;
raslpara.lambdac = 1 ; % lambda = lambdac/sqrt(m)

transformationInit = 'SIMILARITY';
[fileNames, transformations, numImages] = get_training_images( imagePath, pointPath, userName, raslpara.canonicalCoords, transformationInit) ;



[D, Do, A, E, xi, numIterOuter, numIterInner ] = rasl_main(fileNames, transformations, numImages, raslpara, destDir);

%% plot the results

layout.xI = 10 ;
layout.yI = 10 ;
layout.gap = 0 ;
layout.gap2 = 0 ;
rasl_plot(destDir, numImages, raslpara.canonicalImageSize, layout)
