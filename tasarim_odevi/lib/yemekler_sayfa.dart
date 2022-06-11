import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasarim_odevi/yemekler.dart';

class YemeklerSayfa extends StatefulWidget {
  const YemeklerSayfa({Key? key}) : super(key: key);

  @override
  _YemeklerSayfaState createState() => _YemeklerSayfaState();
}

class _YemeklerSayfaState extends State<YemeklerSayfa> {

  Future<List<Yemekler>> yemekleriGetir() async {

    var yemeklerListesi = <Yemekler>[];

    var y1 = Yemekler(yemekId: 1, yemekAdi: "KEBAP", yemekResimAdi: "kebap.png");
    var y2 = Yemekler(yemekId: 2, yemekAdi: "SALATA", yemekResimAdi: "salata.png");
    var y3 = Yemekler(yemekId: 3, yemekAdi: "PİZZA", yemekResimAdi: "pizza1.png");
    var y4 = Yemekler(yemekId: 4, yemekAdi: "BURGER", yemekResimAdi: "burger1.png");
    var y5 = Yemekler(yemekId: 5, yemekAdi: "EV YEMEKLERİ", yemekResimAdi: "evyemekleri1.png");
    var y6 = Yemekler(yemekId: 6, yemekAdi: "BALIK", yemekResimAdi: "balik.png");
    yemeklerListesi.add(y1);
    yemeklerListesi.add(y2);
    yemeklerListesi.add(y3);
    yemeklerListesi.add(y4);
    yemeklerListesi.add(y5);
    yemeklerListesi.add(y6);
    return yemeklerListesi;

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
               TextField(decoration: InputDecoration(hintText: "Restoran, ürün veya mutfak ara"),),
            ],
          ),
          backgroundColor: Colors.white,
          leading: Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: (){
              print("Search Icon tıklandı.");
            },icon: const Icon(Icons.search,color: Colors.orange),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
                child: IconButton(onPressed: (){},
                    icon: const Icon(Icons.tune,color: Colors.orange,))
            ),
          ],
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.orange,
            tabs: const [
              Tab(text: "Trendyol Yemek",),
              Tab(text: "Trendyol Go"),
              Tab(text: "Trendyol Market"),
            ],
            indicatorColor: Colors.orange,
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Yemekler>>(
            future: yemekleriGetir(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                var yemeklerListesi = snapshot.data;
                return GridView.builder(
                  itemCount: yemeklerListesi!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/0.75),
                  itemBuilder: (context,indeks){
                    var yemek = yemeklerListesi[indeks];
                    return Container(
                      child: Card(
                        margin: const EdgeInsets.all(5),
                        elevation:20,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Padding(
                               padding: const EdgeInsets.only(left: 1,right: 1),
                               child: Image.asset("resimler/${yemek.yemekResimAdi}"),
                              ),
                              Text(yemek.yemekAdi,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          ),
                      ),
                    );
                  },
                );
              }else{
                return const Center(
                );
              }
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.orange,
          selectedItemColor: Colors.orange,
          currentIndex: 1,
          selectedFontSize:16,
          unselectedFontSize: 15,
          iconSize: 26,
          backgroundColor: Colors.orange,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Anasayfa"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Kategoriler"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorilerim"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Sepetim"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Hesabım"),
          ],
        ),
      ),
    );
  }
}
