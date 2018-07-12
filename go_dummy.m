
clc ;
close all ;

% addpath
addpath RASL_toolbox ;
addpath data ;
addpath results ;


currentPath = cd;

imagePath = fullfile(currentPath,'data') ;
pointPath = fullfile(currentPath,'data') ; % path to files containing initial feature coordinates
userName = 'Dummy_59_59' ;

destRoot = fullfile(currentPath,'results') ;
destDir = fullfile(destRoot,userName) ;
if ~exist(destDir,'dir')
    mkdir(destRoot,userName) ;
end

raslpara.DISPLAY = 1 ;

raslpara.saveStart = 1 ;
raslpara.saveEnd = 1 ;
raslpara.saveIntermedia = 0 ;


raslpara.canonicalImageSize = [ 49 49  ];
raslpara.canonicalCoords = [ 4.15   45.68 ; ...
                             19.6 19.6  ];
                            
raslpara.transformType = 'SIMILARITY'; 


raslpara.numScales = 1 ; 

raslpara.stoppingDelta = .01; 
raslpara.maxIter = 25; 
raslpara.inner_tol = 1e-6 ;
raslpara.inner_maxIter = 1000 ;
raslpara.continuationFlag = 1 ;
raslpara.mu = 1e-3 ;
raslpara.lambdac = 1 ; 


transformationInit = 'SIMILARITY'; 
[fileNames, transformations, numImages] = get_training_images( imagePath, pointPath, userName, raslpara.canonicalCoords, transformationInit) ;


[D, Do, A, E, xi, numIterOuter, numIterInner ] = rasl_main(fileNames, transformations, numImages, raslpara, destDir);


layout.xI = 10;
layout.yI = 10;
layout.gap = 2;
layout.gap2 = 1;
rasl_plot(destDir, numImages, raslpara.canonicalImageSize, layout)
