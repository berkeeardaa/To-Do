import 'package:flutter/material.dart';
import 'package:odev_7/cubits/yapilacaklar_cubit.dart';
import 'package:odev_7/entity/yapilacak.dart';
import 'package:odev_7/views/yapilacak_is_detay.dart';
import 'package:odev_7/views/yapilacak_is_kayit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Yapilacaklar extends StatefulWidget {
  @override
  _YapilacaklarState createState() => _YapilacaklarState();
}

class _YapilacaklarState extends State<Yapilacaklar> {
  bool aramaYapiliyorMu = false;
  @override
  void initState() {
    super.initState();
    context.read<YapilacaklarCubit>().gorevleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:aramaYapiliyorMu ?
      TextField(onChanged: (aramaSonuc){ context.read<YapilacaklarCubit>().ara(aramaSonuc); },
        decoration: InputDecoration(hintText: "Ara :"),) :
      Text("Yapılacaklar"),
        actions: [
          IconButton(onPressed: (){aramaYapiliyorMu = true;},
              icon: Icon(Icons.account_circle_rounded)),
        IconButton(onPressed: (){aramaYapiliyorMu = true;}, icon: Icon(Icons.settings)),
          aramaYapiliyorMu ?
          IconButton(onPressed: (){context.read<YapilacaklarCubit>().gorevleriYukle();
          setState(() { aramaYapiliyorMu = false;});}, icon: Icon(Icons.cancel)) :
          IconButton(onPressed: (){ setState(() { aramaYapiliyorMu = true;});}, icon: Icon(Icons.search))
        ],
        backgroundColor: Colors.red,),
      body: BlocBuilder<YapilacaklarCubit,List<Yapilacak>>(
        builder: (context,yapilacakListesi){
        if(yapilacakListesi.isNotEmpty){
          return ListView.builder(itemCount: yapilacakListesi.length,
            itemBuilder: (context,indeks){
            var gorev = yapilacakListesi[indeks];
            return GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakIsDetay(gorev: gorev))).then((_) {
                context.read<YapilacaklarCubit>().gorevleriYukle();
              });},
              child: Card(
                child: SizedBox(height: 80,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("${gorev.yapilacak_is}"),
                      ),
                      Spacer(), IconButton(onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${gorev.yapilacak_is} silmek istiyor musun?"),
                          action: SnackBarAction(
                            textColor:Colors.black,label:"Evet",
                            onPressed: (){
                              context.read<YapilacaklarCubit>().sil(gorev.yapilacak_id);},),
                            backgroundColor: Colors.red,
                          ),

                        );
                      },
                          icon: Icon(Icons.delete_sharp,color: Colors.red,))
                    ],
                  ),
                ),
              ),
            );
            },
          );
        }else{
          return Center();
        }},),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakIsKayit())).then((_) {
            context.read<YapilacaklarCubit>().gorevleriYukle();});
          },
        child: Icon(Icons.add), backgroundColor: Colors.red,
      ),
    );
  }
}
