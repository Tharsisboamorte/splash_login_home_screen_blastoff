import 'package:splash_login_screen/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}