import 'package:flutter/material.dart';
import 'package:tasarim_odevi/yemekler.dart';

class YemeklerDetaySayfa extends StatefulWidget {
  Yemekler yemek;
  YemeklerDetaySayfa({required this.yemek});

  @override
  _YemeklerDetaySayfaState createState() => _YemeklerDetaySayfaState();
}

class _YemeklerDetaySayfaState extends State<YemeklerDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    var y =  widget.yemek;
    return Scaffold(
        appBar: AppBar(title: Text(y.yemekAdi),backgroundColor: Colors.orange,),
        body:Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("resimler/${y.yemekResimAdi}"),
              SizedBox(width: 200,height: 50,
                child: ElevatedButton(onPressed: (){
                  print("${y.yemekAdi} sipariş verildi");
                }, child: const Text("SİPARİŞ VER", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                ),
              ),
            ],
          ),
        )

    );;
  }
}
