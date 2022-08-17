import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';

class RepositoryEnergy {
  Future<BigDataModelSector> getCoins() async {
    return RepositorySector()
        .getCoins({"symbol": "POWR,EWT,WOZX,GRID,SNC,ELEC,TSL,EVDC,LITH,ROX"});
  }
}
