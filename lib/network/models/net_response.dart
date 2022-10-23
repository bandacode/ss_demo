import 'package:flutter/material.dart';
import 'package:ss_test/utils/utils.dart';

part 'net_response.g.dart';

/// A data object used to parse network responses from our API
@immutable
class NetResponse {
  /// {@macro net_response}
  const NetResponse({required this.data, required this.meta, this.error});

  /// The data returned from the network request
  final dynamic data;

  /// Holds pagination data
  final JsonMap meta;

  /// Returns an error if the request failed
  final JsonMap? error;

  /// Deserializes the given [JsonMap] into a [NetResponse].
  static NetResponse fromJson(JsonMap json) => _$NetResponseFromJson(json);

  /// Check whether network request was successful
  bool isSuccessful() {
    return error == null;
  }
}
