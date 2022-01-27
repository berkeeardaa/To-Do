import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7/repository/yapilacaklardao_repository.dart';

class YapilacakIsKayitCubit extends Cubit<void> {
  YapilacakIsKayitCubit():super(0);
  var yrepo = YapilacaklarDaoRepository();
  Future<void> kayit(String yapilacak_is) async{
    await yrepo.yapilacaklarKayit(yapilacak_is);
  }
}