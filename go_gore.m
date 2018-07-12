
clc ;
clear all;
close all ;

addpath RASL_toolbox ;
addpath data ;
addpath results ;


currentPath = cd;

imagePath = fullfile(currentPath,'data') ;
pointPath = fullfile(currentPath,'data') ; % path to files containing initial feature coordinates
userName = 'Al_Gore' ;

destRoot = fullfile(currentPath,'results') ;
destDir = fullfile(destRoot,userName) ;
if ~exist(destDir,'dir')
    mkdir(destRoot,userName) ;
end

raslpara.DISPLAY = 1 ;
raslpara.saveStart = 1 ;
raslpara.saveEnd = 1 ;
raslpara.saveIntermedia = 0 ;


raslpara.canonicalImageSize = [ 80 60  ];
raslpara.canonicalCoords = [ 5  55 ; ...
                             32 32  ];
                            
raslpara.transformType = 'AFFINE'; 

raslpara.numScales = 1 ; 

raslpara.stoppingDelta = .01; 
raslpara.maxIter = 25; 

raslpara.inner_tol = 1e-6 ;
raslpara.inner_maxIter = 1000 ;
raslpara.continuationFlag = 1 ;
raslpara.mu = 1e-3 ;
raslpara.lambdac = 1.1 ;


transformationInit = 'SIMILARITY';

[fileNames, transformations, numImages] = get_training_images( imagePath, pointPath, userName, raslpara.canonicalCoords, transformationInit) ;



[D, Do, A, E, xi, numIterOuter, numIterInner ] = rasl_main(fileNames, transformations, numImages, raslpara, destDir);

layout.xI = 10 ;
layout.yI = 14 ;
layout.gap = 0 ;
layout.gap2 = 0 ;
rasl_plot(destDir, numImages, raslpara.canonicalImageSize, layout)
