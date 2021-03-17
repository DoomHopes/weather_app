import 'package:hive/hive.dart';
import 'package:weather_app/models/api_model.dart';

class DataBaseHive {
  void addModel(ApiModel apiModel) {
    final _modelBox = Hive.box<ApiModel>('modelbox');
    _modelBox.add(apiModel);
  }

  ApiModel getModel() {
    final _modelBox = Hive.box<ApiModel>('modelbox');
    final _model = _modelBox.get(0);
    return _model;
  }

  void deleteHive() {
    final _modelBox = Hive.box<ApiModel>('modelbox');
    _modelBox.deleteFromDisk();
  }
}
