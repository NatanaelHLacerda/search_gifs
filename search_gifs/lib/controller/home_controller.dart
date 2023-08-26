import 'dart:convert';

import 'package:search_gifs_flutter/model/gif_model.dart';
import 'package:http/http.dart' as http;

class HomeController {

  Future<List<GitModel>> getGifs(String? search) async{
    String url = search == null
    ? 'https://api.giphy.com/v1/gifs/trending?api_key=lEfUAjzRp3l8FuorXtSoawPoSekvibUH&limit=25&rating=g'
    : 'https://api.giphy.com/v1/gifs/search?api_key=PlZolrTlOobahOvXILOMUDkOjejD4sBN&q=$search&limit=19&offset=50&rating=g&lang=en';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map mapBody = jsonDecode(response.body);

      List listMap = mapBody['data'];

      return listMap.map((e) => GitModel.fromMap(e)).toList();
    }
    return [];
  }
}