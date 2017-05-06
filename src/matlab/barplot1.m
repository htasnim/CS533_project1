color_vals_rand = [22, 4; 21, 4; 22, 4; 22, 3; 22, 4; 20, 4; 23, 3; 22, 4; 22, 4; 20, 4; 20, 4];
m = size(color_vals_rand,1);
color_vals_gred = repmat([20, 4],m,1);
iter = [1:m];
figure; hold on;
plot(iter-1,color_vals_rand);
plot(iter-1,color_vals_gred);

title('Color count Vs Iterations (nodes# 100)', 'fontsize', 14)
xlabel('Iterations', 'fontsize', 14);
ylabel('Color Count', 'fontsize', 14);
h_legend = legend('random(edges# 2500)', 'random(edges# 100)', 'greedy(edges# 2500)', 'greedy(edges# 100)');
set(h_legend,'FontSize',12);
xlim([0 15]);
hold off;

