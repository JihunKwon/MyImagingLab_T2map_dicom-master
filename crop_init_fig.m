%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Version 1.0
% created on 09/11/2018 by Jihun Kwon
% this code crops initial figure to make calculation efficient.
% Email: jihun.k@frontier.hokudai.ac.jp
% Note: running directory has to be the output folder of new dicom file. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;
%% load data and header information
%dirname=uigetdir; % location of dicom files
%dirname = '\Users\jihun\Documents\BOLD_TOLD\Data\247\BOLD 247';
dirname = '\Users\jihun\Documents\BOLD_TOLD\Data\249\BOLD 249';
len = 192/2-1; %192/2=96
x_init = 30;
y_init = 55;
for i=1:1875
    sname = sprintf('MRIm%04d.dcm',i);
    fname = fullfile(dirname, sname);
    [X, map] = dicomread(fname);
    info = dicominfo(fname); %Extract dicom_info
    
%     x_new = size(X,1)/2; %192/2=96
    X_crop = X(x_init:x_init+len,y_init:y_init+len);
    %imshow(X_crop); %Check whether tumor is in the ROI.
    fname_new = sprintf('MRIc%04d.dcm',i);
    
    %No need for this because header info is overlayed eventually anyway.
    %info_new = dicominfo(fname_new);
    
    dicomwrite(X_crop, fname_new);
end
