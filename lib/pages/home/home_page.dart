import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/photos_model.dart';
// import 'package:myapp/models/post_model.dart';
import 'package:myapp/services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF020202),
        title: const Text('Test', style: TextStyle(color: Colors.white
        ),
      ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  FutureBuilder _body(){
    final apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
      future: apiService.getPhotos(), 
      builder: (
        (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        final List<PhotosModel> photos = snapshot.data!;
        return _post(photos);
      } else{
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    } 
    ));
  }

  Widget _post(List<PhotosModel> photos) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder:(context, index) {
        return Container(
        margin: const EdgeInsets.all(16), 
        padding: const EdgeInsets.all(16), 
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black38,width: 2),
        ),
        child: Column(
          children: [
            Text(photos[index].title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            Image.network(photos[index].url, width: 200,),
            // Text(
            //   posts[index].body
            // ),
          ],
        ),
      );
      },
    );
  }
}