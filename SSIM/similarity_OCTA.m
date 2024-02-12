clear all;
clc;


folder1 = "D:\OCT_500\Quantitative OCTA\Quantitative OCTA\projection_OCTA_6mm\projection_realOCTA_NORMAL";  % Replace with your first folder path
folder2 = "D:\OCT_500\Quantitative OCTA\Quantitative OCTA\projection_OCTA_6mm\projection_fakeOCTA_NORMAL"; % Replace with your second folder path

files1 = dir(fullfile(folder1, '*.png')); % Change '*.png' to your file format
files2 = dir(fullfile(folder2, '*.png')); % Change '*.png' to your file format

% Initialize array to store SSIM values
ssim_values = zeros(length(files1), 1);

for k = 1:length(files1)
    % Read each pair of images
    img1 = imread(fullfile(folder1, files1(k).name));
    img2 = imread(fullfile(folder2, files2(k).name));

    % Calculate SSIM
    [ssimval, ~] = ssim(img1, img2);
    ssim_values(k) = ssimval;
end

% Plot SSIM values
figure;
plot(ssim_values);
title('SSIM Values');
xlabel('Image Index');
ylabel('SSIM Value');

% Save the workspace
save('ssim_3mm_xx.mat');
