import 'package:flutter/material.dart';
import 'package:odev_7/cubits/yapilacak_is_kayit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YapilacakIsKayit extends StatefulWidget {
  @override
  _YapilacakIsKayitState createState() => _YapilacakIsKayitState();
}

class _YapilacakIsKayitState extends State<YapilacakIsKayit> {
  var tfYapilacakIs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yapılacak İş Kayıt"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),],
        backgroundColor: Colors.red,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 60.0,left: 60.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacakIs,decoration: InputDecoration(hintText: "Yapılacakları yazınız : "),),
              ElevatedButton(onPressed: (){
                context.read<YapilacakIsKayitCubit>().kayit(tfYapilacakIs.text);
              }, child: Text("KAYDET"),
                style: ElevatedButton.styleFrom(primary: Colors.red,textStyle:TextStyle(fontWeight: FontWeight.bold)),)
            ],
          ),
        ),
      ),
    );
  }
}
