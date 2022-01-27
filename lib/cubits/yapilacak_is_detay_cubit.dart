import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7/repository/yapilacaklardao_repository.dart';

class YapilacakIsDetayCubit extends Cubit<void>{
  YapilacakIsDetayCubit(): super(0);
  var yrepo = YapilacaklarDaoRepository();
  Future<void> guncelle(int yapilacak_id,String yapilacak_is) async{
    await yrepo.yapilacaklarGuncelle(yapilacak_id, yapilacak_is);
  }
}