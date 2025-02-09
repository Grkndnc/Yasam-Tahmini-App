import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklenti/ContainerSayfa.dart';
import 'package:yasam_beklenti/User_Data.dart';
import 'package:yasam_beklenti/constants.dart';
import 'package:yasam_beklenti/iconSayfa.dart';
import 'package:yasam_beklenti/sonucsayfasi/sonucSayfa.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? secilibuton;
  double sigaraSayisi = 0.0;
  double sporSayisi = 0.0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: kiloBoyMetodu('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: kiloBoyMetodu('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' Kaç Gün Spor Yapıyorsunuz?',
                    style: ktextstili,
                  ),
                  Text(
                    sporSayisi.round().toString(),
                    style: ksayiStili,
                  ),
                  Slider(
                    min: 0.0,
                    max: 7.0,
                    divisions: 7,
                    value: sporSayisi,
                    onChanged: (double newValue) {
                      setState(() {
                        sporSayisi = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Günde Kaç Sigara İçiyorsunuz?',
                    style: ktextstili,
                  ),
                  Text(
                    sigaraSayisi.round().toString(),
                    style: ksayiStili,
                  ),
                  Slider(
                    min: 0.0,
                    max: 30.0,
                    value: sigaraSayisi,
                    onChanged: (double newValue) {
                      setState(() {
                        sigaraSayisi = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilibuton = 'KADIN';
                      });
                    },
                    renk: secilibuton == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Iconwidget(
                      IconDegisim: FontAwesomeIcons.venus,
                      textDegisim: 'KADIN',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilibuton = 'ERKEK';
                      });
                    },
                    renk: secilibuton == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: Iconwidget(
                      IconDegisim: FontAwesomeIcons.mars,
                      textDegisim: 'ERKEK',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => sonuc_Sayfa(User_Data(
                            boy: boy,
                            kilo: kilo,
                            secilibuton: secilibuton,
                            sigaraSayisi: sigaraSayisi,
                            sporSayisi: sporSayisi))));
              },
              child: Text(
                'Hesapla',
              )),
        ],
      ),
    );
  }

  Row kiloBoyMetodu(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: ktextstili,
          ),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: ksayiStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'BOY' ? boy++ : kilo++;
                });
              },
              child: Icon(
                (FontAwesomeIcons.plus),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'BOY' ? boy-- : kilo--;
                });
              },
              child: Icon(
                (FontAwesomeIcons.minus),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
