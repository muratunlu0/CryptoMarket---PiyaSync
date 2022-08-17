import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

class RepositorySector {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v2/";
  final String apiKey = "f9fe0ddc-6101-472b-870d-ab20729fa918";
  var currencyListingAPI = '${mainUrl}cryptocurrency/quotes/latest';
  Dio dio = Dio();

  RepositorySector();

  //for testing only
  RepositorySector.test({required this.dio});

  Future<BigDataModelSector> getCoins(Map<String, String> Parameters) async {
    try {
      dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      dio.options.queryParameters = Parameters;

      Response response = await dio.get(currencyListingAPI);

      var result = BigDataModelSector.fromJson((response.data));

      // print(result.dataModel[0].symbol);
      // print(result.dataModel[0].name);
      // print(result.dataModel[0].quoteModel.usdModel.price);
      // print(result.dataModel[0].quoteModel.usdModel.percentChange_24h);

      // print(result.dataModel[1].symbol);
      // print(result.dataModel[1].name);
      // print(result.dataModel[1].quoteModel.usdModel.price);
      // print(result.dataModel[1].quoteModel.usdModel.percentChange_24h);

      // print(result.dataModel[2].symbol);
      // print(result.dataModel[2].name);
      // print(result.dataModel[2].quoteModel.usdModel.price);
      // print(result.dataModel[2].quoteModel.usdModel.percentChange_24h);

      // print('#####################');

      return result;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");

      return BigDataModelSector.withError("error");
    }
  }
}
