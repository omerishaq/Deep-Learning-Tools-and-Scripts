% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input:
%
% Output:
%
% Action: Generate a file for specifying the Ground truth for caffe
% 
%

%
% Data variable allocation
%

source_Folder = 'C:\Users\Omer\Dropbox\Test data folder';
source_File_Ext = '.tif';

groundtruth_File_Name = 'GT.txt';
groundtruth_Prefix = 'Prefix';

groundtruth_Label = '0';

%
% Get the file details 
%

files = dir([source_Folder '\*' source_File_Ext]);

%
% Check if the .txt file exists.
%

if exist([source_Folder '\' 'GT.txt'], 'file') == 2
    % append
    fid = fopen([source_Folder '\' 'GT.txt'], 'a+');
    for i = 1:length(files)
        fprintf(fid, '%s\n', [groundtruth_Prefix files(i).name ' ' groundtruth_Label]);
    end
    fclose(fid);
else
    % create
    fid = fopen([source_Folder '\' 'GT.txt'], 'w');
    for i = 1:length(files)
        fprintf(fid, '%s\n', [groundtruth_Prefix files(i).name ' ' groundtruth_Label]);
    end
    fclose(fid);
end

