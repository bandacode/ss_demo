import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ss_test/network/models/models.dart';
import 'package:ss_test/utils/utils.dart';

import '../config.dart';

/// {@template network_api}
/// An API providing access to the network.
/// {@endtemplate}
class NetworkApi {
  /// {@macro network_api}
  NetworkApi._create(String baseUrl) : _baseUrl = baseUrl;

  /// Public factory
  static NetworkApi init({required String baseUrl}) {
    return NetworkApi._create(baseUrl).._init();
  }

  late Dio _client;

  void _init() {
    final options = BaseOptions(
      baseUrl: _baseUrl,
      followRedirects: true,
      receiveDataWhenStatusError: true,
      headers: <String, String>{
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        return (status ?? 501) < 501;
      },
    );
    _client = Dio(options);
    (_client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => host == kBaseIP;
      return client;
    };
  }

  final String _baseUrl;

  Future<NetResponse> get(String route) async {
    final response = await _client.get<JsonMap>(route);
    log(response.data.toString());
    return NetResponse.fromJson(response.data!);
  }
}
