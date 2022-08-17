import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';

class RepositoryMemes {
  Future<BigDataModelSector> getCoins() async {
    return RepositorySector().getCoins(
        {"symbol": "DOGE,SHIB,ELON,BabyDoge,SAMO,MONA,PIT,QOM,HOGE,ERC20"});
  }
}
