import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7/entity/yapilacak.dart';
import 'package:odev_7/repository/yapilacaklardao_repository.dart';

class YapilacaklarCubit extends Cubit<List<Yapilacak>> {
  YapilacaklarCubit():super(<Yapilacak>[]);
  var yrepo = YapilacaklarDaoRepository();
  Future<void> sil(int yapilacak_id) async{
    await yrepo.yapilacaklarSil(yapilacak_id);
    await gorevleriYukle();
  }
  Future<void> gorevleriYukle() async{
    var liste = await yrepo.yapilacaklariAl();
    emit(liste);
  }
  Future<void> ara(String aramaKelimesi) async{
    var liste = await yrepo.gorevAra(aramaKelimesi);
    emit(liste);
  }
}