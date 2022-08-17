import 'package:piyasync_mvp/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:dio/dio.dart';

class Repository {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "f9fe0ddc-6101-472b-870d-ab20729fa918";
  var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';
  Dio dio = Dio();

  Repository();

  //for testing only
  Repository.test({required this.dio});

  Future<BigDataModel> getCoins() async {
    try {
      dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await dio.get(currencyListingAPI);
      var result = BigDataModel.fromJson((response.data));

      return result;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BigDataModel.withError("error");
    }
  }
}
