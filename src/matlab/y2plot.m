function a = y2plot(x, y1, y2)
    % draw plot using the data from python program
    figure; hold on;
    x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    xvals = power(2,x);
    y_color_random = [9, 9, 8, 8, 8, 8, 8, 8, 8, 8];
    y_color_greedy = repelem(9, 10);
    y_time_random = [0.04449, 0.04556, 0.045388, 0.045245, 0.044711, 0.044355, 0.044897, 0.044398, 0.045095, 0.044972];
    y_time_greedy = repelem(0.000306, 10);
    set(gca,'XTickLabel',xvals);
    title('Color count Vs iterations')
    % plot for color count vs iterations
    yyaxis left
    xlabel('Iterations');
    ylabel('Random color#')
    plot(x,y_color_random);
    ylim([7 10]);
    
    yyaxis right
    ylabel('Greedy color#')
    plot(x,y_color_greedy);
    ylim([8 10]);
    hold off;
    
    % plot for running time vs iterations
    figure; hold on;
    set(gca,'XTickLabel',xvals);
    title('Running time Vs iterations')

    yyaxis left
    xlabel('Iterations');
    ylabel('Random running time')
    plot(x,y_time_random);
    
    yyaxis right
    ylabel('Greedy running time')
    plot(x,y_time_greedy);
    ylim([0.0001 0.001]);
    hold off;
end