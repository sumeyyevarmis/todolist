import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Anasayfa(),
    );
  }
}
class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  TextEditingController t1 = TextEditingController();
  List liste = [];
  int listenum=0;
  elemanEkle(){
    setState(() {
      // bu fonk ile state in durumu deðiþebilsin
      liste.add(t1.text);
      t1.clear(); // text field alaný temizlenir
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.white,
        centerTitle: true,title: Text("To-Do List",style: TextStyle(color: Colors.black)),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:<Widget>[
              Flexible(
                child: ListView.builder(
                  itemCount: liste.length,
                  itemBuilder: (context, indeksNumarasi) =>Card(
                    color: Colors.white70,
                    child: ListTile(
                      //subtitle: Text("Liste $indeksNumarasi"),
                      leading: const Icon(Icons.check),
                      title: Text(liste[indeksNumarasi]),
                      trailing: IconButton(icon: Icon(Icons.delete),
                        onPressed: (){
                          setState(() {
                            liste.removeAt(indeksNumarasi);
                          },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: t1,
              ), // metin giriþ alaný
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.black,
                onPressed: elemanEkle,
                heroTag: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
