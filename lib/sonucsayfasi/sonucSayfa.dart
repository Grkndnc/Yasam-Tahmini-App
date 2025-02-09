import 'package:flutter/material.dart';
import 'package:yasam_beklenti/User_Data.dart';
import 'package:yasam_beklenti/sonucsayfasi/hesap.dart';

class sonuc_Sayfa extends StatelessWidget {
  final User_Data _user_data;
  sonuc_Sayfa(this._user_data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç Sayfası'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                Hesap(_user_data).hesaplama()!.round().toString(),
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Geri Dön',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
