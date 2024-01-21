% path = 'data/S006/S006R04.edf';
% 
% [sig, freq, tm, icasig, A, W, W1] = doIca(path);

numChannels = size(icasig, 1);

figure('Position', [100, 200, 1000, 1000]);

numSubplots = 3;
subplotCols = numSubplots;
subplotRows = ceil(numChannels / subplotCols);

for i = 1:numChannels
    subplot(subplotRows, subplotCols, i);
    plot(icasig(i, 1:size(icasig, 2)));
    title(['Channel ', num2str(i)]);
end

figure;
for i = 1:size(W1, 2)
    subplot(size(W1, 1)/8, size(W1, 1)/8, i);
   
    topoplot(W1(:, i), 'pnas_chan.locs', 'style', 'both', 'headrad', 0.5, 'maplimits', 'absmax');
    
    title(['Component ', num2str(i)]);
end
colorbar('southoutside');

prompt = 'Enter the components you would like to exclude (space-separated): ';
dlgtitle = 'Input Components';
dims = [1 50];
definput = {''};
answer = inputdlg(prompt, dlgtitle, dims, definput);

exclude_indices = str2num(answer{1}); %#ok<ST2NM>

if isempty(exclude_indices) || any(isnan(exclude_indices))
    error('Invalid input. Make sure to enter space-separated numeric values.');
end

include_indices = setdiff(1:size(W1, 2), exclude_indices);

Wap = W1(:, include_indices);
newComp = icasig(include_indices, :);

Y = Wap * newComp;
