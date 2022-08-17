import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';

class RepositoryGaming {
  Future<BigDataModelSector> getCoins() async {
    return RepositorySector()
        .getCoins({"symbol": "APE,MANA,SAND,AXS,GMT,ENJ,GALA,BORA,WAXP,RNDR"});
  }
}
