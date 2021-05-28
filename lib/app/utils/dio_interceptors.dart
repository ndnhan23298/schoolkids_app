import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:doan/app/utils/endpoints.dart';
// import 'package:doan/app/utils/http_utils.dart';

class DioInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  final _store = GetStorage();
  // final AuthController _authController = AuthController.to;
  DioInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    String accessToken = _store.read(AppStorageKey.ACCESS_TOKEN);
      options.headers
         .addAll({HttpHeaders.authorizationHeader: 'Bearer $accessToken'});
    return super.onRequest(options, handler);
  }

@override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    return super.onResponse(response, handler);
  }


  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    return super.onError(err, handler);
  }
  //
  // @override
  // Future onError(DioError dioError,  ErrorInterceptorHandler handler) async {
  //   String oldAccessToken = _store.read(AppStorageKey.ACCESS_TOKEN);
  //   int responseCode = dioError.response.statusCode;
  //
  //   if (oldAccessToken != null && responseCode == 401) {
  //     print('refresh accessToken');
  //     _dio.interceptors.requestLock.lock();
  //     _dio.interceptors.responseLock.lock();
  //     //
  //     try {
  //       String refreshToken = _store.read(AppStorageKey.REFRESH_TOKEN) ?? '';
  //       final response = await HttpHelper.post('${Endpoints.REFRESH_TOKEN}', {'refreshToken': refreshToken});
  //
  //       final tokenData = RefreshTokenResponse.fromJson(response.body);
  //      await _store.write(AppStorageKey.ACCESS_TOKEN, tokenData.accessToken);
  //       await _store.write(AppStorageKey.REFRESH_TOKEN, tokenData.refreshToken);
  //     } catch (e) {
  //       super.onError(dioError);
  //       _authController.logout();
  //     }
  //     //
  //     RequestOptions options = dioError.response.request;
  //    _dio.interceptors.requestLock.unlock();
  //     _dio.interceptors.responseLock.unlock();
  //     return _dio.request(options.path, options: options);
  //   } else {
  //     super.onError(dioError);
  //   }
  // }
}
