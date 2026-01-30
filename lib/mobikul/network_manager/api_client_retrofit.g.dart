// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ApiClientRetrofit implements ApiClientRetrofit {
  _ApiClientRetrofit(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://mrxksa.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GooglePlaceModel> getGooglePlace(String endPoint) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GooglePlaceModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'place/textsearch/json?query=${endPoint}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GooglePlaceModel _value;
    try {
      _value = GooglePlaceModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseModel> getUpdateToken(
    String userId,
    String username,
    String avatar,
    String token,
    String accountType,
    String os,
    String sellerId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'userId': userId,
      'name': username,
      'avatar': avatar,
      'token': token,
      'accountType': accountType,
      'os': os,
      'sellerId': sellerId,
    };
    final _options = _setStreamType<BaseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
        .compose(
          _dio.options,
          '/updateTokenToDataBase',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseModel _value;
    try {
      _value = BaseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
