import 'package:dio/dio.dart';
import 'package:marvel_app/app/modules/home/home_repository.dart';
import 'package:marvel_app/app/shared/models/Comics.dart';
import 'package:marvel_app/app/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeRepository _homeRepository =
      HomeRepository(dio: Dio(BaseOptions(baseUrl: BASE_MARVEL_API_STRING)));

  @observable
  List<Comics> comics;

  // * This var check if the comics has been loaded in the method getComics()
  @observable
  bool isLoaderComics = false;

  @observable
  bool isPressedDropdownOrderBy = false;

  @observable
  bool isReloadedComics = false;

  @observable
  bool isNetworkError = false;

  Future<List<Comics>> getComics({String orderBy}) async {
    comics = await _homeRepository
        .getComics(queryAPIOrderBy: orderBy)
        .asObservable();

    if (comics.length == 0) {
      isNetworkError = true;
    }

    comics = await checkComicsIsEmpty(comics);

    isLoaderComics = (comics.isNotEmpty) ? true : false;

    return comics;
  }

  Future<List<Comics>> getComicsOrderBy(String orderBy) async {
    comics = await getComics(orderBy: orderBy).asObservable();
    isReloadedComics = true;

    return comics;
  }

  Future<List<Comics>> checkComicsIsEmpty(List<Comics> comicsList) async {
    int iterable = 0;

    while (iterable < comicsList.length) {
      if (comicsList[iterable].title == "") {
        comicsList[iterable].title = "teste";
      }

      if (comicsList[iterable].description.runtimeType.toString() == "Null") {
        comicsList[iterable].description = "";
      }

      if (comicsList[iterable].price == "") {
        comicsList[iterable].price = "\$ 00.0";
      }

      iterable++;
    }

    return comicsList;
  }
}
