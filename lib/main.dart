import 'package:cocuklar_icin_spor_app/ui/ana_sayfa.dart';
import 'package:cocuklar_icin_spor_app/ui/program_detay.dart';
import 'package:cocuklar_icin_spor_app/ui/program_sayfasi.dart';
import 'package:cocuklar_icin_spor_app/ui/egzersiz_detay.dart';
import 'package:cocuklar_icin_spor_app/ui/egzersiz_sayfasi.dart';
import 'package:cocuklar_icin_spor_app/ui/giris_sayfasi.dart';
import 'package:cocuklar_icin_spor_app/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import 'models/kisisel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter First App',
      theme: ThemeData(
        fontFamily: "Quicksand",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.black54,
      ),
      home: Splash(),
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        //egzersizDetay/$index
        if (pathElemanlari[1] == "egzersizDetay") {
          return MaterialPageRoute(
              builder: (context) =>
                  EgzersizDetay(int.parse(pathElemanlari[2])));
        }
        if (pathElemanlari[1] == "programDetay") {
          return MaterialPageRoute(
              builder: (context) => ProgramDetay(int.parse(pathElemanlari[2])));
        } else
          return null;
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  DatabaseHelper _databaseHelper;
  List<Kisisel> tumKisiselVerilerListesi;

  @override
  void initState() {
    super.initState();
    tumKisiselVerilerListesi = List<Kisisel>();
    _databaseHelper = DatabaseHelper();
    _databaseHelper.tumKayitlar().then((tumKayitlariTutanMapList) {
      for (Map okunanKayitListesi in tumKayitlariTutanMapList) {
        tumKisiselVerilerListesi
            .add(Kisisel.dbdenOkudugunDegeriObjeyeDonustur(okunanKayitListesi));
      }
      setState(() {});
    }).catchError((hata) => print("Init state hata fonk: " + hata));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: tumKisiselVerilerListesi.length == 0
            ? GirisSayfasi()
            : MyHomePage(),
        title: Text(
          'Fit Child',
          textAlign: TextAlign.end,
          textScaleFactor: 3,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Sansita",
              color: Colors.white),
        ),
        image: Image.asset("assets/images/fitness.png"),
        // loadingText: Text(
        //   // tumKisiselVerilerListesi.length == 0? "Hoşgeldiniz": "Hoşgeldiniz " + tumKisiselVerilerListesi[0].adSoyad,style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        loadingText: Text(
          "Version 0.0.1",
          style: TextStyle(color: Colors.white),
        ),
        photoSize: 50.0,
        useLoader: false,
        backgroundColor: Colors.blueGrey.shade900);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenBarItem = 1;
  List<Widget> tumSayfalar;
  AnaSayfa sayfaAna;
  EgzersizSayfasi sayfaEgzersiz;
  ProgramSayfasi sayfaProgram;

  @override
  void initState() {
    super.initState();
    sayfaAna = AnaSayfa();
    sayfaEgzersiz = EgzersizSayfasi();
    sayfaProgram = ProgramSayfasi();
    tumSayfalar = [sayfaEgzersiz, sayfaAna, sayfaProgram];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavMenu(),
      body: tumSayfalar[secilenBarItem],
    );
  }

  Widget bottomNavMenu() {
    return BottomNavigationBar(
      elevation: 4,
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      iconSize: 27,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.fitness_center,
          ),
          label: "Egzersizler",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Ana Sayfa",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.date_range,
          ),
          label: "Program",
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: secilenBarItem,
      onTap: (secilenIndex) {
        setState(() {
          secilenBarItem = secilenIndex;
        });
      },
    );
  }
}
