numChannels = size(sig, 2);
numFiguresY = ceil(numChannels / 4);
for figureIdx = 1:numFiguresY
    figure;
    for i = 1:4
        channelIdx = (figureIdx - 1) * 4 + i;
        if channelIdx <= numChannels
            subplot(4, 1, i);

            plot(sig(:, channelIdx), 'b'); 
            hold on;

            plot(Y(channelIdx, :), 'Color', [0, 0.8, 0], 'LineWidth', 0.25); 
            title(['Channel ', num2str(channelIdx)]);
            hold off;
        end
    end
end
