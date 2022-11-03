// import 'package:flutter/material.dart';
//
// class CustomGenerateRouter {
//   static const String signIn = '/signIn';
//   static const String signUp = '/signUp';
//   static const String singleProd = '/singleProd';
//   static const String myProfile = '/myProfile';
//   static const String addProd = '/addProd';
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final Object? org = settings.arguments;
//
//     switch (settings.name) {
//       case signIn:
//         return MaterialPageRoute(builder: (_) => const SignInScreen());
//       case signUp:
//         return MaterialPageRoute(builder: (_) => const SignUpPage());
//       case singleProd:
//         if (org is Data) {
//           return MaterialPageRoute(
//             builder: (_) => SingleProductPage(
//               data: org,
//             ),
//           );
//         } else {
//           return _generateErrorRoute();
//         }
//
//       case myProfile:
//         return MaterialPageRoute(builder: (_) => const MyProfilePage());
//       case addProd:
//         return MaterialPageRoute(builder: (_) =>  AddProductPage());
//
//       default:
//         return MaterialPageRoute(builder: (context) => const HomePage());
//     }
//   }
//
//   static Route<dynamic> _generateErrorRoute() {
//     return MaterialPageRoute(builder: (context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('error'),
//         ),
//         body: Center(
//           child: Text('error'),
//         ),
//       );
//     });
//   }
// }
