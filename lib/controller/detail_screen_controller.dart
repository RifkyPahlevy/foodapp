import 'package:url_launcher/url_launcher.dart';

class DetailScreenController {
  bool isMini = true; // harga tetap
  bool isSedang = false; // harga sedang + 2000

  bool isBesar = false; // harga besar + 4000
  bool isSuperBesar = false; // harga superbesar + 6000

  int jumlah = 1;

  int harga = 0;
  int hargaPromo = 0;

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void minus(int dataPrice, int dataPricePromo) {
    if (jumlah > 1) {
      jumlah--;
      if (isMini == true) {
        harga = dataPrice * jumlah;
        hargaPromo = dataPricePromo * jumlah;
      } else if (isSedang == true) {
        harga = (dataPrice + 2000) * jumlah;
        hargaPromo = (dataPricePromo + 2000) * jumlah;
      } else if (isBesar == true) {
        harga = (dataPrice + 4000) * jumlah;
        hargaPromo = (dataPricePromo + 4000) * jumlah;
      } else if (isSuperBesar == true) {
        harga = (dataPrice + 6000) * jumlah;
        hargaPromo = (dataPricePromo + 6000) * jumlah;
      }
    }
  }

  void plus(int dataPrice, int dataPricePromo) {
    jumlah++;

    if (isMini == true) {
      harga = dataPrice * jumlah;
      hargaPromo = dataPricePromo * jumlah;
    } else if (isSedang == true) {
      harga = (dataPrice + 2000) * jumlah;
      hargaPromo = (dataPricePromo + 2000) * jumlah;
    } else if (isBesar == true) {
      harga = (dataPrice + 4000) * jumlah;
      hargaPromo = (dataPricePromo + 4000) * jumlah;
    } else if (isSuperBesar == true) {
      harga = (dataPrice + 6000) * jumlah;
      hargaPromo = (dataPricePromo + 6000) * jumlah;
    }
  }

  void isMiniPrees(int dataPrice, int dataPricePromo) {
    if (isMini == true) {
      harga = dataPrice * jumlah;
      hargaPromo = dataPricePromo * jumlah;
      isSedang = false;
      isBesar = false;
      isSuperBesar = false;
    }
  }

  void isSedangPrees(int dataPrice, int dataPricePromo) {
    if (isSedang == true) {
      harga = (dataPrice + 2000) * jumlah;
      hargaPromo = (dataPricePromo + 2000) * jumlah;
      isMini = false;
      isBesar = false;
      isSuperBesar = false;
    }
  }

  void isBesarPress(int dataPrice, int dataPricePromo) {
    if (isBesar == true) {
      harga = (dataPrice + 4000) * jumlah;
      hargaPromo = (dataPricePromo + 4000) * jumlah;
      isMini = false;
      isSedang = false;
      isSuperBesar = false;
    }
  }

  void isSuperBesarPress(int dataPrice, int dataPricePromo) {
    if (isSuperBesar == true) {
      harga = (dataPrice + 6000) * jumlah;
      hargaPromo = (dataPricePromo + 6000) * jumlah;
      isMini = false;
      isSedang = false;
      isBesar = false;
    }
  }
}
