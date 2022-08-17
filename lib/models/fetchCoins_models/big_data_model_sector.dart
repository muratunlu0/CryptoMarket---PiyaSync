import 'package:piyasync_mvp/models/fetchCoins_models/status_model.dart';
import 'data_model.dart';

class BigDataModelSector {
  final StatusModel statusModel;
  final List<DataModel> dataModel;

  BigDataModelSector({
    required this.statusModel,
    required this.dataModel,
  });
  factory BigDataModelSector.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> dataList = List.filled(10, {});
    for (int i = 0; i < 10; i++) {
      dataList[i] = json['data'].values.elementAt(i)[0];
    }
    List<DataModel> dataModelList =
        dataList.map((e) => DataModel.fromJson(e)).toList();
    return BigDataModelSector(
      statusModel: StatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
  BigDataModelSector.withError(String error)
      : statusModel = StatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
}
