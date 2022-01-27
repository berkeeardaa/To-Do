import 'package:flutter/material.dart';
import 'package:odev_7/cubits/yapilacak_is_detay_cubit.dart';
import 'package:odev_7/entity/yapilacak.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YapilacakIsDetay extends StatefulWidget {
  Yapilacak gorev;
  YapilacakIsDetay({required this.gorev});
  @override
  _YapilacakIsDetayState createState() => _YapilacakIsDetayState();
}

class _YapilacakIsDetayState extends State<YapilacakIsDetay> {
  var tfYapilacakIs = TextEditingController();

  @override
  void initState() {
    super.initState();
    var gorev = widget.gorev;
    tfYapilacakIs.text = gorev.yapilacak_is;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yapılacak İş Detay"),
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
                context.read<YapilacakIsDetayCubit>().guncelle(widget.gorev.yapilacak_id, tfYapilacakIs.text);
              }, child: Text("GÜNCELLE"),
                style: ElevatedButton.styleFrom(primary: Colors.red,textStyle:TextStyle(fontWeight: FontWeight.bold)),)
            ],
          ),
        ),
      ),
    );
  }
}
