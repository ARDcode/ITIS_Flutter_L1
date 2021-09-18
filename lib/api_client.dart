import 'package:dio/dio.dart';
import 'package:first_project/cat.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.thecatapi.com/v1/images")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/search?breed_ids=beng")
  Future<List<Cat>> getCats();
}
