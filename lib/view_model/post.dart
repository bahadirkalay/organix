import 'package:flutter/material.dart';
import 'package:organix/models/post_model.dart';

class PostViewModel extends ChangeNotifier {
  List<PostModel> _postModel = [];

  List<PostModel> get postModel => _postModel;

  set postModel(List<PostModel> postModel) {
    _postModel = postModel;
    notifyListeners();
  }
}
