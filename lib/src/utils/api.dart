import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart' as dio;

// Quick Type - https://quicktype.io/

class Api {
  static var _accessToken = "";
  static var _notificationId = "";
  static const url = "https://www.lindle.me";

  static void setAccessToken(String a) => _accessToken = a;
  static void setNotificationId(String a) => _notificationId = a;

  static Future<dynamic>? get(String subroute) async {
    try {
      var uri = "$url$subroute";

      // Await the http get response, then decode the json-formatted response.
      var response = await dio.Dio().get(uri,
          options: dio.Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $_accessToken',
            'Content-Type': 'application/json',
            'androidnotificationid': _notificationId,
          }));
      if (response.statusCode! >= 200 && response.statusCode! <= 400) {
        return response.data;
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
        }
        //var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return response;
      }
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e.response);
      }
      return e.response?.data ??
          {"result": false, "message": "Something went wrong."};
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<dynamic>? post(String subroute, body) async {
    var uri = "$url$subroute"; //Uri.parse("$url$subroute");

    // Await the http get response, then decode the json-formatted response.
    //var client = http.Client();
    //var response = await client.post(uri, body: convert.jsonDecode(source) body);
    try {
      var response = await dio.Dio().post(uri,
          data: body,
          options: dio.Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $_accessToken',
            'Content-Type': 'application/json'
          }));
      if (response.statusCode! >= 200 && response.statusCode! <= 400) {
        return response.data;
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
        }
        //var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return response;
      }
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e.response);
      }
      return e.response?.data ??
          {"result": false, "message": "Something went wrong."};
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<dynamic>? patch(String subroute, body) async {
    var uri = "$url$subroute"; //Uri.parse("$url$subroute");

    // Await the http get response, then decode the json-formatted response.
    //var client = http.Client();
    //var response = await client.post(uri, body: convert.jsonDecode(source) body);
    try {
      var response = await dio.Dio().patch(uri,
          data: body,
          options: dio.Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $_accessToken',
            'Content-Type': 'application/json'
          }));
      if (response.statusCode! >= 200 && response.statusCode! <= 400) {
        return response.data;
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
        }
        //var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return response;
      }
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e.response);
      }
      return e.response?.data ??
          {"result": false, "message": "Something went wrong."};
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<dynamic>? delete(String subroute) async {
    try {
      var uri = "$url$subroute";

      // Await the http get response, then decode the json-formatted response.
      var response = await dio.Dio().delete(uri,
          options: dio.Options(headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $_accessToken',
            'Content-Type': 'application/json'
          }));
      if (response.statusCode! >= 200 && response.statusCode! <= 400) {
        return response.data;
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
        }
        //var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return response;
      }
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e.response);
      }
      return e.response?.data ??
          {"result": false, "message": "Something went wrong."};
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
