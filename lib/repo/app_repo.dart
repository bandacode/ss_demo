import 'package:ss_test/config.dart';
import 'package:ss_test/network/network.dart';

class AppRepo {
  final NetworkApi _api;

  AppRepo(this._api);

  Future<NetResponse> getRestaurants({int page = 1}) => _api.get(
        'restaurants?populate=ratings&pagination[page]=$page&pagination[pageSize]=$kDefaultPageSize',
      );
}
