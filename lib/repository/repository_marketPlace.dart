import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';

class RepositoryMarketPlace {
  Future<BigDataModelSector> getCoins() async {
    return RepositorySector()
        .getCoins({"symbol": "BNB,LEO,FTT,BCH,HBAR,OKB,KCS,HT,LRC,GT"});
  }
}
