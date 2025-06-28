import '../../resources/constants_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
@singleton
class APIManager{
 late Dio dio;
APIManager(){
  dio=Dio(BaseOptions(
    baseUrl:AppConstants.baseurl,
    validateStatus: (statuscode){
      if((statuscode!>=200&&statuscode<300)||statuscode==409||statuscode==401||statuscode==400){
        return true;
      }
       return false;
    }

  ));
}
Future<Response>getRequest({required String path,Map<String,dynamic>?params,
  Map<String,dynamic>? headers}){
  return dio.get(path,queryParameters:params ,options: Options(headers:headers));
}
Future<Response>postRequestFromData({required String path,
  required Map<String,dynamic>data,required Map<String,dynamic>?headers}){
  return dio.post(path,data:FormData.fromMap(data),options: Options(headers: headers));
}//
Future<Response>postRequestRaw({required String path,
   Map<String,dynamic>?headers, Map<String,dynamic>?data,}){
  return dio.post(path,data:data,options: Options(headers: headers));
}
Future<Response>deleteRequest({required String Path}){
  return dio.delete(Path);
}//,Options(headers: headers
}

