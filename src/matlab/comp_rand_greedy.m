mcolor_random = [6, 13, 9, 20, 14, 22, 7, 15, 18, 19, 5, 10, 9, 12, 17, 8, 22, 17, 16, 4, 13, 16, 8, 12, 20; 5, 13, 10, 19, 14, 20, 7, 13, 18, 19, 4, 9, 9, 13, 16, 9, 21, 15, 16, 4, 11, 14, 8, 11, 19; 6, 13, 10, 21, 14, 21, 6, 14, 18, 19, 5, 10, 8, 12, 17, 8, 22, 16, 15, 4, 11, 14, 7, 11, 18; 6, 14, 10, 21, 14, 19, 7, 14, 17, 19, 5, 9, 9, 13, 16, 8, 22, 15, 16, 3, 11, 16, 8, 11, 18; 6, 13, 11, 19, 13, 20, 6, 13, 17, 18, 5, 9, 8, 13, 16, 8, 22, 17, 15, 4, 12, 14, 8, 11, 18; 6, 13, 11, 20, 14, 22, 7, 14, 17, 19, 5, 9, 9, 12, 17, 9, 20, 17, 16, 4, 11, 14, 7, 11, 19; 6, 13, 11, 21, 13, 21, 7, 15, 19, 21, 5, 10, 8, 12, 18, 9, 23, 16, 15, 3, 13, 14, 8, 11, 19; 6, 13, 11, 21, 13, 23, 6, 15, 18, 20, 5, 9, 8, 11, 17, 8, 22, 16, 15, 4, 11, 14, 7, 11, 19; 5, 12, 10, 20, 14, 21, 6, 14, 18, 18, 5, 9, 10, 12, 16, 9, 22, 16, 16, 4, 12, 15, 8, 11, 20; 6, 14, 11, 21, 14, 20, 7, 15, 17, 20, 5, 10, 9, 12, 18, 8, 20, 17, 16, 4, 11, 15, 8, 11, 18; 5, 13, 11, 19, 14, 19, 6, 14, 18, 19, 5, 10, 9, 12, 16, 9, 20, 16, 17, 4, 11, 15, 7, 11, 18];
mcolor_greedy = [6, 13, 10, 21, 14, 22, 6, 14, 18, 19, 5, 9, 7, 12, 18, 7, 20, 16, 15, 4, 12, 15, 7, 11, 19];
ctime_random =  [2.1e-05, 4.1e-05, 3.3e-05, 7.7e-05, 4.7e-05, 7.4e-05, 2.6e-05, 4.9e-05, 6.2e-05, 8.2e-05, 2.3e-05, 3.4e-05, 3.2e-05, 4.3e-05, 6e-05, 2.9e-05, 7.3e-05, 6.5e-05, 5.2e-05, 1.6e-05, 3.9e-05, 5.5e-05, 2.4e-05, 3.7e-05, 8.2e-05; 2.9e-05, 6.8e-05, 9.8e-05, 0.00012, 7.4e-05, 0.000129, 3.5e-05, 7.9e-05, 0.000103, 0.000119, 2.8e-05, 4.8e-05, 4.5e-05, 7.2e-05, 9.9e-05, 4.3e-05, 0.000139, 9.2e-05, 8.8e-05, 2.2e-05, 6.1e-05, 8.5e-05, 3.9e-05, 5.6e-05, 0.000124; 5e-05, 0.000123, 9e-05, 0.000223, 0.000131, 0.000262, 5.5e-05, 0.000149, 0.000189, 0.000214, 4.2e-05, 8.1e-05, 7.4e-05, 0.000113, 0.000182, 6.8e-05, 0.000278, 0.000174, 0.000165, 4e-05, 0.00016, 0.000225, 6.4e-05, 0.000101, 0.000212; 8.2e-05, 0.000229, 0.000164, 0.000442, 0.000258, 0.000583, 9.6e-05, 0.000298, 0.00038, 0.000458, 8.5e-05, 0.000177, 0.000147, 0.000215, 0.000393, 0.000127, 0.000504, 0.00033, 0.000313, 6.1e-05, 0.000209, 0.000297, 0.000114, 0.000192, 0.000414; 0.000154, 0.000444, 0.000327, 0.000868, 0.000513, 0.000929, 0.000181, 0.000522, 0.000713, 0.000883, 0.00013, 0.000294, 0.000311, 0.000435, 0.000672, 0.00024, 0.000965, 0.000669, 0.000588, 0.000107, 0.000403, 0.000579, 0.000208, 0.000379, 0.000755; 0.000294, 0.00117, 0.000845, 0.002104, 0.001174, 0.002014, 0.000416, 0.001172, 0.001511, 0.00182, 0.000263, 0.000615, 0.000531, 0.000877, 0.001347, 0.00056, 0.002094, 0.001465, 0.001263, 0.0002, 0.000815, 0.001184, 0.000595, 0.00092, 0.001559; 0.00064, 0.001791, 0.001383, 0.003759, 0.001953, 0.004015, 0.00079, 0.002327, 0.0029, 0.003392, 0.000538, 0.001434, 0.001131, 0.001697, 0.002848, 0.001078, 0.003942, 0.002528, 0.002458, 0.000406, 0.001468, 0.002396, 0.001036, 0.001549, 0.003072; 0.001449, 0.00373, 0.002772, 0.007195, 0.004015, 0.007447, 0.001681, 0.004322, 0.00606, 0.006671, 0.001, 0.002375, 0.002202, 0.003601, 0.005551, 0.001997, 0.007836, 0.005074, 0.004654, 0.000968, 0.002935, 0.004397, 0.001762, 0.002928, 0.006225; 0.002542, 0.00728, 0.005173, 0.013782, 0.007588, 0.014974, 0.002946, 0.008463, 0.011962, 0.014106, 0.002236, 0.004775, 0.004294, 0.006603, 0.010729, 0.00375, 0.015396, 0.010127, 0.009838, 0.001852, 0.006052, 0.008875, 0.00341, 0.005742, 0.012441; 0.004681, 0.014601, 0.010135, 0.028062, 0.015267, 0.02896, 0.005811, 0.016259, 0.022642, 0.026048, 0.004124, 0.009101, 0.009348, 0.013624, 0.021488, 0.007352, 0.031064, 0.019497, 0.018667, 0.002943, 0.01161, 0.017661, 0.00656, 0.011056, 0.02411; 0.009089, 0.028134, 0.020313, 0.054208, 0.029689, 0.058922, 0.011175, 0.032873, 0.045487, 0.051386, 0.007808, 0.018053, 0.016272, 0.025688, 0.043166, 0.014084, 0.060801, 0.039464, 0.037057, 0.006441, 0.023445, 0.034765, 0.012477, 0.021693, 0.047498];
ctime_greedy = [2.6e-05, 5.4e-05, 3.9e-05, 8.5e-05, 4.5e-05, 9.7e-05, 2.1e-05, 5.9e-05, 7.3e-05, 8.5e-05, 2.1e-05, 3.5e-05, 3.1e-05, 4.7e-05, 7.6e-05, 3.4e-05, 9.4e-05, 7e-05, 6.6e-05, 2.2e-05, 4.5e-05, 5.9e-05, 2.8e-05, 5e-05, 7.8e-05];


% draw box plot for max color (random algorithm)
figure;
rows = size(mcolor_random,1);
cols = size(mcolor_random,2);
y = mcolor_random';
x = [1:rows];
boxplot(y,power(2,x-1));
title ('Min color Vs Iteration', 'fontsize', 14);
xlabel('Iterations', 'fontsize', 14);
ylabel('Color Count', 'fontsize', 14);

% draw box plot for running time (random algorithm)
figure;
rows = size(ctime_random,1);
cols = size(ctime_random,2);
y = ctime_random';
x = [1:rows];
boxplot(y,power(2,x-1));
title ('Runtime Vs Iteration', 'fontsize', 14);
xlabel('Iterations', 'fontsize', 14);
ylabel('Run time (in seconds)', 'fontsize', 14);

% draw box plot for max color (greedy algorithm)
figure;
y = mcolor_greedy';
boxplot(y);
title ('Min color Vs Iteration', 'fontsize', 14);
xlabel('Iterations', 'fontsize', 14);
ylabel('Color Count', 'fontsize', 14);

% draw box plot for max color (greedy algorithm)
figure;
y = ctime_greedy';
boxplot(y);
title ('Runtime Vs Iteration', 'fontsize', 14);
xlabel('Iterations', 'fontsize', 14);
ylabel('Run time (in seconds)', 'fontsize', 14);

% peform statistical tests

mcolor_random_1iter = mcolor_random(1,:);
ctime_random_1iter = ctime_random(1,:);

%Wilcoxon rank sum test for color count
p1 = ranksum(mcolor_random_1iter, mcolor_greedy);
t1 = ttest2(mcolor_random_1iter, mcolor_greedy);
k1 = kstest2(mcolor_random_1iter, mcolor_greedy);
disp(p1);
disp(t1);
disp(k1);

%Wilcoxon rank sum test for runtime
p2 = ranksum(ctime_random_1iter, ctime_greedy);
t2 = ttest2(ctime_random_1iter, ctime_greedy);
k2 = kstest2(ctime_random_1iter, ctime_greedy);
disp(p2);
disp(t2);
disp(k2);
