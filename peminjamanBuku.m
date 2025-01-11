% Input data siswa
jumlahBuku = 5;
keterlambatan = 2;

% Fuzzifikasi jumlah buku
if jumlahBuku <= 3
    buku = 'Sedikit';
elseif jumlahBuku <= 7
    buku = 'Sedang';
else
    buku = 'Banyak';
end

% Fuzzifikasi keterlambatan
if keterlambatan == 0
    terlambat = 'Tepat Waktu';
elseif keterlambatan <= 3
    terlambat = 'Sedikit Terlambat';
else
    terlambat = 'Sangat Terlambat';
end

% Inferensi fuzzy
if strcmp(buku, 'Sedikit') && strcmp(terlambat, 'Tepat Waktu')
    hasil = 'Layak';
elseif strcmp(buku, 'Sedang') && strcmp(terlambat, 'Sedikit Terlambat')
    hasil = 'Dipertimbangkan';
else
    hasil = 'Tidak Layak';
end

% Output hasil
fprintf('Hasil Kelayakan Peminjaman: %s\n', hasil);

% Visualisasi diagram batang hasil fuzzifikasi
kategoriBuku = {'Sedikit', 'Sedang', 'Banyak'};
nilaiBuku = [max(1 - jumlahBuku/3, 0), max(1 - abs(jumlahBuku-5)/2, 0), max((jumlahBuku-7)/3, 0)];

kategoriTerlambat = {'Tepat Waktu', 'Sedikit Terlambat', 'Sangat Terlambat'};
nilaiTerlambat = [max(1 - keterlambatan, 0), max(1 - abs(keterlambatan-2)/1.5, 0), max((keterlambatan-3)/2, 0)];

figure;
subplot(1,2,1);
bar(categorical(kategoriBuku), nilaiBuku);
title('Fuzzifikasi Jumlah Buku');
xlabel('Kategori');
ylabel('Keanggotaan');

subplot(1,2,2);
bar(categorical(kategoriTerlambat), nilaiTerlambat);
title('Fuzzifikasi Tingkat Keterlambatan');
xlabel('Kategori');
ylabel('Keanggotaan');