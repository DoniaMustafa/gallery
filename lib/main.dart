import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/core/dependency_injection/di.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/screens/home/bloc/gallery/gallery_cubit.dart';
import 'package:gellary/presentation/screens/home/bloc/upload/upload_cubit.dart';
import 'package:gellary/presentation/screens/login/blocs/login_cubit.dart';
import 'package:gellary/presentation/screens/login/login_screen.dart';
import 'presentation/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  token =await gettoken();
  name=await getname();
  runApp( DevicePreview(
    builder: (context) =>MyApp(),
    enabled: !kReleaseMode,
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => di<GalleryCubit>()..getGallery('eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTE3MTBmNTA4MzFmY2NiNDYwNGExMzY0ODJmNDFiZjU5OTEzY2JkY2ZhZmU2ZDY1OWJmZmQ5OGVkODE1MDk5MTRmNTRmMjZmZDA2NGZjZDIiLCJpYXQiOjE2NjcyODk3ODUuMDMzMTk5LCJuYmYiOjE2NjcyODk3ODUuMDMzMjAzLCJleHAiOjE2OTg4MjU3ODUuMDI2MzI0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.bWImC0xkzNQe8iKxL1Scg0tGGZGUy3vWsiX1vBzj1gLvynIMJcOqVkEVZc2C3MgSaCHjyqGkN7zWyqYVqLasAaKKFmj9JiQgXozvPcHJPoJCGQQvogt-gnM0DPeFMF-g_CVJPNZ3nUkXpOLl3Os5DhvW53OVT1n5pisoNyvsrEJURWTXxt1EIxwnmoj0An8y9kq2WSX4Zn2RoVGKe3QnL-KOGKksfv2ahj7hG-ZNwVYazI6TXCIxZBCYGoZtfvq9CjTrVUcCBSiGgdyaJzAZi0lNR2c2zcZxWGbBQ_QvfTFDZmmPyogScE5cgy4MGsnYe4Sw7qLmHIrSsrMaJxRgQ_b7xobq9ob1vDhw9O-VcPpiCllEFyjMkdKOFC8UffoYZB3bafp9KZB6Dr3tS7fo6f4ojAKnj-b8g6AigjuFb4FAYlC0vxT76mtvvYFm8MjH1kH2QmJ0HzvhBxv45K9Cdtuvr3DdrwyDaoROR4eZ6S-Xp-LYuCkZ-e4UenLJC4mDUu8u6xoyLHKul3FhNlAUMj-oScKZgJxRUYhbVxzXruHwaycKdlX284-Y6cfSAf3AjIvfaXYeB1ajGuuCtYceBVGM5tDxY4i9I7kthk3DNRjaRQPIl5c8GQlYV3I3p-RItB33Y-ECNiG92U2fgB8fAVw5urOuFX7pIZZ0NEc6VAY'),
        ),
        BlocProvider(
          create: (context) => di<UploadCubit>(),
        ),
      ],
      child: const MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
