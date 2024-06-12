import 'package:dio/dio.dart';

import 'package:exam_test/model/comments_model.dart';

abstract class CommentsService {
  Dio dio = Dio();
  late Response response;
  String baseUrl = 'https://dummyjson.com/comments';

  Future<List<CommentsModel>> getComments();
}

class CommentsServiceImp extends CommentsService {
  @override
  Future<List<CommentsModel>> getComments() async {
    try {
      response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<CommentsModel> products = List.generate(
            response.data['comments'].length,
            (index) => CommentsModel.fromMap(response.data['comments'][index]));
        return products;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}
