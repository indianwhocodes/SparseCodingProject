
function fileNames = list_image_files(parameterString)

if nargin==0,
   
    parameterString = '.';
end

temp = dir(parameterString);
fileNames = {};
[fileNames{1:length(temp),1}] = deal(temp.name);

hiddenFiles = nan(size(fileNames));
for fileIndex = 1:length(fileNames),
    tempName = fileNames{fileIndex};
    hiddenFiles(fileIndex) = tempName(1) == '.';
end

imageFlags = nan(size(fileNames));
for fileIndex = 1:length(fileNames),
    [boo1, boo2, tempExtension] = fileparts(fileNames{fileIndex});
    tempExtension = lower(tempExtension);
    imageFlags(fileIndex) = ismember(tempExtension, {'.bmp', '.png', '.tif', '.jpg'});
end

directoryFlags = {};
[directoryFlags{1:length(temp),1}] = deal(temp.isdir);
directoryFlags = cell2mat(directoryFlags);

tempFlags = (~hiddenFiles) & (~directoryFlags) & (imageFlags);
fileNames = fileNames(tempFlags);
