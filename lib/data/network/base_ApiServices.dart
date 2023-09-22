abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url, {headers});
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
