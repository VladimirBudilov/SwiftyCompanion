import 'dart:async';
import 'package:http_interceptor/http_interceptor.dart';
import '../services/auth_service.dart';

class AuthInterceptor implements InterceptorContract {
  final AuthService _authService;

  AuthInterceptor(this._authService);

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final token = await _authService.getAccessToken();
    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }
    request.headers['Content-Type'] = 'application/json';
    print('Request: ${request.url}, Headers: ${request.headers}');
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    if (response.statusCode == 401) {
      print('Unauthorized request. Refreshing token...');
      final newToken = await _authService.refreshToken();
      if (newToken != null) {
        final retryRequest = (response.request as Request);
        retryRequest.headers['Authorization'] = 'Bearer $newToken';
        final client = Client();
        final retriedResponse = await client.send(retryRequest);
        return Response.fromStream(retriedResponse);
      }
    }
    print('Response: ${response.statusCode}');
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;}
}
