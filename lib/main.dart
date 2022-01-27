import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7/cubits/yapilacak_is_detay_cubit.dart';
import 'package:odev_7/cubits/yapilacak_is_kayit_cubit.dart';
import 'package:odev_7/cubits/yapilacaklar_cubit.dart';
import 'package:odev_7/views/yapilacaklar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => YapilacakIsKayitCubit()),
      BlocProvider(create: (context) => YapilacakIsDetayCubit()),
      BlocProvider(create: (context)  => YapilacaklarCubit()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Yapilacaklar(),
      ),
    );
  }
}

