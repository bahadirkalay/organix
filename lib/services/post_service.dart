import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:organix/models/post_model.dart';

import 'package:organix/services/const_url.dart';
import 'package:organix/view_model/post.dart';

import 'package:provider/provider.dart';

final dio = Dio();

class PostService {
  Future<List<PostModel>?> postService(BuildContext context) async {
    PostViewModel _pvm = Provider.of<PostViewModel>(context, listen: false);

    try {
      Response response = await dio.get(URLService.post);
      log(response.toString());

      if (response.statusCode == 200 && response.data != null) {
        List<PostModel> postModel = (response.data as List)
            .map((data) => PostModel.fromJson(data))
            .toList();
        _pvm.postModel = postModel;
        return postModel;
      } else {
        throw Exception(
            'HTTP ${response.statusCode}, response data: ${response.data}');
      }
    } catch (e) {
      // Hata durumunda uyarı gösterimi yerine burada loglama yapılabilir veya uygun şekilde kullanıcıya geri bildirim verilebilir
      log('Hata oluştu: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hata"),
            content: Text(
                "Servis veri çekerken bir hata oluştu. Lütfen tekrar deneyin."),
            actions: [
              TextButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return null;
    }
  }
}
