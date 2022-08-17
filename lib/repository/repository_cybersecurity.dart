import 'package:piyasync_mvp/models/fetchCoins_models/big_data_model_sector.dart';
import 'package:piyasync_mvp/repository/repository_sector.dart';

class RepositoryCybersecurity {
  Future<BigDataModelSector> getCoins() async {
    return RepositorySector()
        .getCoins({"symbol": "CTK,UTK,NCT,QSP,VIDT,LSS,HAI,HAPI,DDOS,REM"});
  }
}
