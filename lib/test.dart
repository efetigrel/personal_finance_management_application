/*
void main(List<String> args) {
  Kopek k1 = Kopek('LABRADOR', 'SİYAH');

  Kopek k2 = Kopek.isimliKurucu('GOLDEN', 'KIZIL');

  Kopek k3 = Kopek.isimliKurucu2('MAVİ');
}

class Hayvan {
  String? renk;

  Hayvan(String renkkk) {
    renk = renkkk;
    print('Hayvan sınıfından nesne türetildi - Rengi: $renk');
  }

  Hayvan.isimliKurucu() {}
}

class Kopek extends Hayvan {
  String? cins;
  Kopek(String cinsss, String renk) : super(renk) {
    cins = cinsss;
    print('Kopek sınıfından nesne türetildi - Cinsi: $cins Rengi: $renk');
  }

  Kopek.isimliKurucu(String cinsss, String renk) : super(renk) {
    cins = cinsss;
    print('Kopek sınıfından nesne türetildi - Cinsi: $cins Rengi: $renk');
  }

  Kopek.isimliKurucu2(String renk) : super.isimliKurucu() {
    print(
        'Sadece renk alan ve üst sınıfı parametre almayan kurucu metod tanımlandı');
  }
}
*/

/*
void main(List<String> args) {
  var k1 = Kare();
  k1.en = 4;
  k1.boy = 4;
  print(k1.alanHesapla());

  var d1 = Kare();
  k1.en = 8;
  k1.boy = 12;
  print(k1.cevreHesapla());
}

abstract class Sekil {
  int? en;
  int? boy;

  void mesaj() {
    print('Mesaj');
  }

  void alanHesapla() {}

  void cevreHesapla() {}
}

class Dikdortgen extends Sekil {
  @override
  void mesaj() {
    super.mesaj();
  }

  @override
  int alanHesapla() {
    return en! * boy!;
  }

  @override
  int cevreHesapla() {
    return en! * (en! + boy!);
  }
}

class Kare extends Sekil {
  @override
  int alanHesapla() {
    return en! * boy!;
  }

  @override
  int cevreHesapla() {
    return 2 * (en! + boy!);
  }
}
*/
/*
void main(List<String> args) {}

class Kumanda {
  void sesAc() {
    print('Kumanda sınıfı ses aç metodu');
  }

  void sesAzalt() {
    print('Kumanda sınıfı ses azalt metodu');
  }
}

class BirDigerSinif {
  void herhangiBirMethot() {
    print('Herhangi bir metod tetiklendi');
  }
}

class Televizyon implements Kumanda, BirDigerSinif {
  @override
  void herhangiBirMethot() {
    print('Herhangi bir metod tetiklendi');
  }

  @override
  void sesAc() {
    print('Televizyon sınıfı ses aç metodu');
  }

  @override
  void sesAzalt() {
    print('Televizyon sınıfı ses azalt metodu');
  }
}
*/

/*
void main(List<String> args) {
  var emre = Ogrenci();
  emre.ad = 'emre';
  Ogrenci.ogrSayisi++;
  Ogrenci.ogrenciSayisiniYazdir();
  print(
    '${emre.ad} ogrencisi olusturuldu ve okul kodu: ${Ogrenci.okulKodu}',
  );

  var efe = Ogrenci();
  efe.ad = 'efe';
  Ogrenci.ogrSayisi++;
  Ogrenci.ogrenciSayisiniYazdir();
  print(
    '${efe.ad} ogrencisi olusturuldu ve okul kodu: ${Ogrenci.okulKodu}',
  );
}

class Ogrenci {
  String? ad;
  static const int okulKodu = 1452;
  static int ogrSayisi = 0;

  static void ogrenciSayisiniYazdir() {
    print('Toplam ogrenci sayisi: $ogrSayisi');
  }

  void adiniSoyle() {
    print('Benim adim: $ad');
  }
}
*/

// void main(List<String> args) {
//   Function f1 = (int s1, int s2) {
//     int toplam = s1 + s2;
//     print(toplam);
//   };

//   f2(int no) {
//     return no * 2;
//   }

//   f1(5, 7);
//   print(f2(9));
// }

// void sayilariTopla(int? a, int? b) {
//   int toplam = a! + b!;
//   print(toplam);
// }
