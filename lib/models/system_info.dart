import 'package:windows_system_info/models/windows_system_info.dart';

///model for windows system information like manufacturer,model, seriel,uuid etc...
class SystemInfo extends WindowsSystemInformation {
  //must add new properties inside props!!!
  @override
  List<Object?> get props => [
        model,
        uuid,
      ];

  final String model;
  final String uuid;
  
  /// String manufacturer: "Dell ."
  ///
  /// String model: "Modelname Model Number"
  ///
  /// String serial: "unique value"
  ///
  /// String sku: ""
  ///
  /// String uuid: ""
  ///
  /// String version: "0001"
  ///
  SystemInfo({
    required this.manufacturer,
    required this.model,
    required this.serial,
    required this.sku,
    required this.uuid,
    required this.version,
  });
  static SystemInfo fromJson(Map<String, dynamic> json) {
    //must pass enitre json object created.
    //then using system and system sku
    return SystemInfo(
      model: json['model'] ??
              json['system'] != null && json['system']['Name'] != null
          ? json['system']['Name']
          : '',
      uuid: json['uuid'] ??
              json['system'] != null && json['system']['UUID'] != null
          ? json['system']['UUID']
          : '',
    );
  }

  /// to json(Map<String,dynamic>) of model
  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'uuid': uuid,
    };
  }
}
