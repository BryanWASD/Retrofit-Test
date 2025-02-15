import 'package:myapp/models/photos_model.dart';
import 'package:myapp/models/post_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';


@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService{
  factory ApiService(Dio dio) = _ApiService;

  @GET('posts')
  Future<List<PostModel>> getPosts();
  
  @GET('photos')
  Future<List<PhotosModel>> getPhotos();
}