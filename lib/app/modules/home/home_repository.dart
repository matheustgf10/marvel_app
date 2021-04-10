import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:marvel_app/app/shared/models/Comics.dart';
import 'package:marvel_app/app/utils/constants.dart';

class HomeRepository {
  final Dio dio;
  Comics comics;
  String queryAPIOrderBy = 'orderBy=title%2C-issueNumber';
  String queryAPI =
      "comics?&ts=1&apikey=$MARVEL_API_KEY&hash=$MARVEL_API_HASH&limit=20&format=comic&orderBy=";

  HomeRepository({this.dio});

  Future<List<Comics>> getComics({String queryAPIOrderBy = ''}) async {
    Response response;
    List<Comics> listComics = [];
    int iterable = 0;

    try {
      response = await dio.get(queryAPI + queryAPIOrderBy);

      List responseList = response.data['data']['results'];
      int responseLength = responseList.length;
      String thumb;

      while (iterable < responseLength) {
        List thumbList = response.data['data']['results'][iterable]['images'];
        String description =
            response.data['data']['results'][iterable]['description'];

        if (thumbList.isEmpty) {
          thumb = THUMBNAIL_COMICS_DEFAULT;
        } else {
          thumb = response.data['data']['results'][iterable]['images'][0]
                  ['path'] +
              "." +
              response.data['data']['results'][iterable]['images'][0]
                  ['extension'];
        }

        thumb = Comics().httpToHttpsConvert(thumb);
        description = (description.runtimeType.toString() != "Null")
            ? Comics().modifyDescription(description)
            : '';

        comics = Comics(
          id: response.data['data']['results'][iterable]['id'],
          title: response.data['data']['results'][iterable]['title'],
          description: description + "...",
          price: response.data['data']['results'][iterable]['price'],
          thumbnailUrl: thumb,
          copyright: response.data['attributionText'],
        );

        listComics.add(comics);
        iterable++;
      }
    } on DioError catch (error) {
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        throw TimeoutException(
            "Server is not reachable. Please verify your internet connection and try again");
      } else if (DioErrorType.response == error.type) {
        // 4xx 5xx response
        // throw exception...
      } else if (DioErrorType.other == error.type) {
        if (error.message.contains('SocketException')) {
          return listComics;
        }
      } else {
        throw Exception("Problem connecting to the server. Please try again.");
      }
    }

    return listComics;
  }

  Comics checkComicsIsEmpty(Comics comics, Response response, int iterable) {
    if (comics.title.isEmpty) {
      comics.title = "";
    }

    if (comics.description.isEmpty) {
      comics.description = "";
    }

    if (comics.thumbnailUrl.isEmpty) {
      comics.thumbnailUrl = THUMBNAIL_COMICS_DEFAULT;
    } else {
      comics.thumbnailUrl = response.data['data']['results'][iterable]
              ['thumbnail'][0]['path'] +
          '.jpg';
    }

    if (comics.price.isEmpty) {
      comics.price = "\$ 00.0";
    }

    return comics;
  }
}
