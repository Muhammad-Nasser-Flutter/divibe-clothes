import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cloth_ecommerce/core/Api/end_points.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'Authorization';
const String defaultLanguage = 'language';

// class TimeoutInterceptor extends Interceptor {
//   final Duration timeoutDuration;

//   TimeoutInterceptor({this.timeoutDuration = const Duration(seconds: 7)});

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // Start a timer to monitor the request duration
//     Timer timer;
//     timer = Timer(
//       timeoutDuration,
//       () {
//         if (options.extra['completed'] != true) {
//           showCustomLoading(
//             message: "Poor Internet Connection".tr(),
//             indicator: Icon(
//               Icons.wifi_off,
//               color: Colors.black,
//               size: 25,
//             ),
//           );
//         }
//       },
//     );

//     // Mark the start of the request
//     options.extra['startTime'] = DateTime.now();
//     options.extra['completed'] = false;
//     options.extra['timer'] = timer;

//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // Mark the request as completed
//     response.requestOptions.extra['completed'] = true;
//     // Cancel the timer if the request completes before the timeout
//     Timer? timer = response.requestOptions.extra['timer'];
//     if (timer != null && timer.isActive) {
//       timer.cancel();
//     }
//     hideLoading();
//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // Mark the request as completed
//     err.requestOptions.extra['completed'] = true;
//     // Cancel the timer if the request fails before the timeout
//     Timer? timer = err.requestOptions.extra['timer'];
//     if (timer != null && timer.isActive) {
//       timer.cancel();
//     }
//     hideLoading();
//     super.onError(err, handler);
//   }
// }

class QuestDio {
  static late Dio dio;

  void init() async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      contentType: applicationJson,
    );
    dio = Dio(baseOptions);
    dio.interceptors.addAll([
      if (kDebugMode) PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true),
    ]);
  }

  Future<Response> get({required String endPoint, data, Map<String, dynamic>? additionalHeaders}) async {
    dio.options.headers = {...?additionalHeaders};
    return await dio.get(endPoint, data: data);
  }

  Future<Response> post({required String endPoint, data, Map<String, dynamic>? additionalHeaders}) async {
    dio.options.headers = {...?additionalHeaders};
    return await dio.post(endPoint, data: data);
  }

  Future<Response> put({required String endPoint, data, Map<String, dynamic>? additionalHeaders}) async {
    dio.options.headers = {...?additionalHeaders};
    return await dio.put(endPoint, data: data);
  }

  Future<Response> delete({required String endPoint, data, Map<String, dynamic>? additionalHeaders}) async {
    dio.options.headers = {...?additionalHeaders};
    return await dio.delete(endPoint, data: data);
  }

  Future<Response> patch({required String endPoint, data, Map<String, dynamic>? additionalHeaders}) async {
    dio.options.headers = {...?additionalHeaders};
    return await dio.patch(endPoint, data: data);
  }
}
