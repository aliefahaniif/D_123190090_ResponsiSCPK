%import data dari data set
opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = [3:5 8];
data = readmatrix('Real estate valuation data set.xlsx',opts);
x = data(1:50,:);

k = [0,0,1,0];
%atribut tiap-tiap kriteria, dimana nilai 1=atribut keuntungan/benefit, dan  0= atribut biaya/cost
w = [3,5,4,1];
%Nilai bobot tiap kriteria (1= sangat rendah, 2=rendah, 3= cukup, 4= tinggi, 5= sangat tinggi) 

[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

for j=1:n,
    if k(j)==0, w(j)=-1*w(j); %saat k(j) bernilai 0 maka akan w(k) akan dikalikan dengan -1
    end;
end;

for i=1:m,
    S(i)=prod(x(i,:).^w); %nilai S(i) didapat dengan memangkatkan x dengan w
end;

V= S/sum(S) %menentukan nilai V dengan membagi S dengan jumlah S


[skor no]=sort(V,'descend'); %mengurutkan 5 teratas

for d=1:5,
    urut=['data ke-', num2str(no(d)), ' dengan V = ',num2str(skor(d))];
    disp(urut)
end;
