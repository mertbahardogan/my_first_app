class Gunler {
  String baslik;
  bool expanded;
  String icerik;
  bool gunCheck;
  String hareketResim;

  String get getBaslik => baslik;

  set setBaslik(String baslik) => this.baslik = baslik;

  bool get getExpanded => expanded;

  set setExpanded(bool expanded) => this.expanded = expanded;

  String get getIcerik => icerik;

  set setIcerik(String icerik) => this.icerik = icerik;

  bool get getCheck => gunCheck;

  set setCheck(bool gunCheck) => this.gunCheck = gunCheck;

  String get gethareketResim => hareketResim;

  set sethareketResim(String hareketResim) => this.hareketResim = hareketResim;

  Gunler(this.baslik, this.icerik, this.expanded, this.gunCheck,
      this.hareketResim);
}
