import 'package:gellary/core/dependency_injection/di.dart';
import 'package:gellary/data/datasourse/local/cache_helper.dart';

List img = [
  'assets/2009.png',
  'assets/2010.png',
  'assets/2011.png',
  'assets/2012.png',
  'assets/2013.png',
  'assets/2014.png',
];

String? token;
String? name;
double? height;
double? width;
puttoken(String token) async {
  return await di<CacheHelper>().put('token', token);
}

putname(String name) async {
  return await di<CacheHelper>().put('name', name);
}
Future<dynamic> gettoken() async {
  return await di<CacheHelper>().get('token');
}
Future<dynamic> getname() async {
  return await di<CacheHelper>().get('name');
}
