import 'package:odev_7/entity/yapilacak.dart';
import 'package:odev_7/sqlite/veritabani_yardimcisi.dart';

class YapilacaklarDaoRepository {
  Future<void> yapilacaklarKayit(String yapilacak_is) async{
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.insert("yapilacaklar", bilgiler);
  }
  Future<void> yapilacaklarGuncelle(int yapilacak_id,String yapilacak_is) async{
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;
    await db.update("yapilacaklar", bilgiler,where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }
  Future<void> yapilacaklarSil(int yapilacak_id) async{
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    await db.delete("yapilacaklar",where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }
  Future<List<Yapilacak>> yapilacaklariAl() async{
   var db = await VeriTabaniYardimcisi.veritabaniErisim();
   List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");
   return List.generate(maps.length, (index){ var satir = maps[index];
     return Yapilacak(yapilacak_is: satir["yapilacak_is"], yapilacak_id: satir["yapilacak_id"]);
   });
  }
  Future<List<Yapilacak>> gorevAra(String aramaKelimesi) async{
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps =
    await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$aramaKelimesi%'");
    return List.generate(maps.length, (index) {var satir = maps[index];
    return Yapilacak(yapilacak_is: satir["yapilacak_is"], yapilacak_id: satir["yapilacak_id"]);});
  }
}