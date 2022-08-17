import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';

class RepositorySports {
  Future<BigDataModelSector> getCoins() async {
    return RepositorySector()
        .getCoins({"symbol": "CHZ,PSG,PORTO,BAR,CITY,ACM,SOC,INTER,ATM,ASR"});
  }

  Future<BigDataModelSector> get3() async {
    return RepositorySector().getCoins({"symbol": "CHZ,PSG,PORTO"});
  }
}
