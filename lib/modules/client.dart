import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_dribbble/models/ShotModel.dart';

final String domain = 'https://api.dribbble.com/';
final String accessToken = '858782a9e363c9a5c434f356af378811649a6d376a40ae24c19a561f627b9afa';

Uri getUri (String path, Map<String, dynamic> json) {
  json["access_token"] = accessToken;
  return new Uri(
    scheme: 'https',
    host: 'api.dribbble.com',
    path: path,
    queryParameters: json
  );
}

abstract class Shot {
  static Future<List<ShotModel>> getList({int page = 1, int perPage = 50, String list = '', String sort = '' }) async {
    final Uri uri = getUri('i1/shots', {
      "page": page.toString(),
      "per_page": perPage.toString(),
      "list": list,
      "sort": sort
    });
    print('[Fetch] uri: ' + uri.toString());
    final response = await http.get(uri.toString());
    final List json = JSON.decode(response.body);
    return json.map((shot) => new ShotModel.fromJson(shot)).toList();
  }
}

Map<String, String> getShotsApiParams(String tabTitle) {
  Map<String, String> map = {
    'list': '',
    'sort': ''
  };
  switch (tabTitle) {
    case 'RECENT':
      map['sort'] = 'recent';
      break;
    case 'TEAMS':
      map['list'] = 'teams';
      break;
    case 'POPLUAR':
    default:
      break;
  }

  return map;
}