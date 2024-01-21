
% path = 'data/S006/S006R06.edf'; 
% [sig, freq, tm, icasig, A, W, W1] = doIca(path);


% figure;
% for i = 1:size(W1, 2)
%     subplot(size(W1, 1)/8, size(W1, 1)/8, i);
%     topoplot(W1(:, i), 'pnas_chan.locs', 'style', 'both', 'headrad', 0.5, 'maplimits', 'absmax');
%     title(['Component ', num2str(i)]);
% end
% colorbar('southoutside');

 
figure;
topoplot(W1(:, 6), 'pnas_chan.locs', 'style', 'both', 'headrad', 0.5, 'maplimits', 'absmax');
colorbar('southoutside');
