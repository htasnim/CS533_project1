figure
subplot(2,1,1)
y =[8	8	7	7	7	7	7	8	7	7	8; 8	8	7	9	8	9	8	8	8	8	9 ; 8	9	8	9	8	8	9	8	8	9	9; 10	9	10	10	10	9	9	9	9	9	9; 10	10	9	10	11	11	11	9	10	11	9] 
%x=[500; 600; 700; 800; 900; 1000];
b=bar(y);
b(1).FaceColor='r'
l = cell(1,11);
l{1}='Greedy '; l{2}='Random 2 Interations'; l{3}='Random 4 Interations';
l{4}='Random 8 Interations'; l{5}='Random 16 Interations'; l{6}='Random 32 Interations';
l{7}='Random 64 Interations'; l{8}='Random 128 Interations'; l{9}='Random 256 Interations';
l{10}='Random 512 Interations'; l{11}='Random 1024 Interations'; 
legend(b,l);
axis([0 7 0 23]);
xlabel('Edges');
ylabel('Minimun num. of Color')
title(' Relation between Greedy and Random in Color count using 100 nodes with different edges and Iterations ');
subplot(2,1,2);
y=[11	11	10	11	12	11	11	12	10	10	11; 12	12	12	12	11	13	11	11	12	12	12;12	12	12	12	12	13	14	11	12	12	12;13	13	13	14	13	12	13	12	13	12	14; 14	13	15	13	16	14	14	13	14	14	13; 15	14	15	15	14	14	15	14	15	14	13]; 
b=bar(y);
b(1).FaceColor='r'
xlabel('Edges');
ylabel('Minimun num. of Color')
axis([0 7 0 23]);



