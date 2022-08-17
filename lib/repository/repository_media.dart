import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';

class RepositoryMedia {
  Future<BigDataModelSector> getCoins() async {
    return RepositorySector().getCoins(
        {"symbol": "TRX,THETA,ENJ,TFUEL,HIVE,WAXP,RNDR,SNT,STEEM,REEF"});
  }
}
