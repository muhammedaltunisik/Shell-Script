## Text dosyası bölen shell script programı
-------------
İlk argüman olarak dosya yolunu,ikinci argüman olarak kaç parçaya ayrılıcağını alır. Ana dosyayı bulunduğu klasörün altında, girilen değer kadar alt dosyalara böler.


**Örnek:** 70 satırlı bir dosyayı 6 alt dosyaya [12, 12, 12, 12, 11, 11] şeklinde parçalanır.

**Örnek:** 100 satırlı bir dosya 5 alt dosyaya [20, 20, 20, 20, 20] şeklinde parçalanır.

#### Kullanım:
```shell
    ./dosyaParcalama.sh <dosyaYolu> <parçaSayısı>

    veya

    bash /dosyaParcalama.sh <dosyaYolu> <ParçarSayısı>
```

#### Örnek Kullanım:
```shell
    ./dosyaParcalama.sh ~/Masaüstü/parcalanacak.txt 15
```

