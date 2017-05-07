figure
subplot(2,1,1)

y=[15 15 16	15	14	15	15	16	15	14	15;16	16	17	16	15	17	16	14	16	17	16; 16	16	17	16	15	17	16	14	16	17	16; 16	16	16	17	17	16	17	17	16	15	16; 16	18	18	15	17	17	18	17	16	18	17]; 
b=bar(y);
b(1).FaceColor='r'
l = cell(1,11);
l{1}='Greedy '; l{2}='Random 2 Interations'; l{3}='Random 4 Interations';
l{4}='Random 8 Interations'; l{5}='Random 16 Interations'; l{6}='Random 32 Interations';
l{7}='Random 64 Interations'; l{8}='Random 128 Interations'; l{9}='Random 256 Interations';
l{10}='Random 512 Interations'; l{11}='Random 1024 Interations'; 
legend(b,l);
axis([0 7 0 24]);
xlabel('Edges');
ylabel('Minimun num. of Color')
title(' Relation between Greedy and Random in Color count using 100 nodes with different edges and Iterations ');

subplot(2,1,2)
y=[18	18	17	18	20	17	19	19	19	19	20; 19	18	19	20	20	20	21	19	18	19	20; 21	21	21	21	20	19	21	20	21	20	19; 22	21	21	20	21	21	22	19	23	21	21; 21	21	21	22	22	23	22	23	21	21	22];
b=bar(y);
b(1).FaceColor='r'
xlabel('Edges');
ylabel('Minimun num. of Color')
axis([0 7 0 24]);