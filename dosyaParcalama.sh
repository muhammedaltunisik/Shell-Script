#!/bin/bash


textDosyasiOlusturma()
{
	dosyaYolu=$1;			
    altAralik=$2;	 
	ustAralik=$3;				 
    dosyaSayisi=$4;

	dosyaTamAdi=`echo $dosyaYolu | grep -o [^/]*$`;
	dosyaUzantisi=`echo $dosyaTamAdi | grep -o '\..*'`;
	dosyaAdi=`echo $dosyaTamAdi | grep -o ".*[^\.$dosyaUzantisi]"`;
	

	dosyaTamAdi="$dosyaAdi-$dosyaSayisi$dosyaUzantisi";
    touch $dosyaTamAdi;

    head -n $ustAralik $dosyaYolu | tail -n $altAralik > $dosyaTamAdi;
	
	# wc -l $dosyaTamAdi; #olusturulan dosyalarin kac satir oldugunu gosterir.
}

if [ $# -ne 2 ] 				 
then
	echo "Eksik veya fazla sayida arguman girisi yaptiniz";

elif [ ! -f $1 ] 				 
then
	echo "Hata: Girilen Dosya Bulunamadi. "
	
elif [ ! -z `echo "$2" | grep -o '\.'` ] 	 
then
	echo "Hata: Girilen deger tam sayi degil";	
	
elif [ $2 -lt 0 ]				 
then 
	echo "Hata: Girilen deger negatif";
	
else
						
	satirSayisi=`cat $1 | wc -l`;		

	if  [ "$satirSayisi" -ge $2 ]		 
	then
		
		kacaBolunecek=$2; 	
        nSatir=0;
        sayac=0;
        fazlalikParcaSayisi=$((satirSayisi%kacaBolunecek));
        tamBolum=$((satirSayisi/kacaBolunecek));

        for (( i=0; i<$fazlalikParcaSayisi; i++))
        do
            ((nSatir+=tamBolum+1));
            ((sayac++));
            textDosyasiOlusturma "$1" $((tamBolum+1)) $nSatir $sayac; 
        done

        for (( i=0; i< $((kacaBolunecek-fazlalikParcaSayisi)); i++ ))
        do
            ((nSatir+=tamBolum));
            ((sayac++));
            textDosyasiOlusturma "$1" $tamBolum $nSatir $sayac; 
        done

	
	elif [ $satirSayisi -lt $2 ]
	then	
		echo "Hata: Dosyanin satir sayisindan daha buyuk bir deger girisi yaptiniz";

	fi 
fi
