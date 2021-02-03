import 'package:cocuklar_icin_spor_app/models/haftalik.dart';
import 'package:cocuklar_icin_spor_app/utils/program.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProgramSayfasi extends StatelessWidget {
  static List<Haftalik> tumHaftalar;
  @override
  Widget build(BuildContext context) {
    tumHaftalar = verileriHazirla();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Haftalık Spor Programı",
          style: TextStyle(
              color: Colors.blueGrey.shade900, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: listeHazirla(),
    );
  }

  List<Haftalik> verileriHazirla() {
    List<Haftalik> haftalar = [];

    for (int i = 0; i < 4; i++) {
      String resim = Program.PROGRAM_DOSYA[i] + ".png";

      Haftalik eklenecekAdim = Haftalik(
        Program.PROGRAM_AD[i],
        Program.PROGRAM_DOSYA[i],
        Program.PROGRAM_ACIKLAMA[i],
        resim,
      );
      haftalar.add(eklenecekAdim);
    }
    return haftalar;
  }

  Widget listeHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirContainer(context, index);
      },
      itemCount: tumHaftalar.length,
    );
  }

  Widget tekSatirContainer(BuildContext context, int index) {
    Haftalik oAnEklenecek = tumHaftalar[index];

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 5.5,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.red, blurRadius: 1, offset: Offset(0, 5))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/levels/" + oAnEklenecek.haftalikResim,
              width: 130,
              height: 130,
              alignment: Alignment.topCenter,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  oAnEklenecek.haftalikAd + " Seviye",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6, left: 6),
                      child: Icon(
                        Icons.info,
                        size: 13,
                        color: Colors.white,
                      ),
                    ),
                    Text(oAnEklenecek.haftalikAciklama,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w400)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/programDetay/$index");
      },
    );
  }

  // Color renkUret(int index) {
  //   if (index == 0) return Colors.blueGrey.shade400;
  //   if (index == 1) return Colors.blueGrey.shade600;
  //   if (index == 2) return Colors.blueGrey.shade700;
  //   if (index == 3)
  //     return Colors.blueGrey.shade900;
  //   else
  //     return Colors.blueGrey;
  // }
}
