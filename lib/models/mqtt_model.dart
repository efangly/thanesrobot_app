class MqttData {
  List<Data>? data;

  MqttData({this.data});

  MqttData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? patientname;
  String? prescription;
  String? status;
  String? patient;

  Data({this.patientname, this.prescription, this.status, this.patient});

  Data.fromJson(Map<String, dynamic> json) {
    patientname = json['patientname'];
    prescription = json['prescription'];
    status = json['status'];
    patient = json['patient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientname'] = patientname;
    data['prescription'] = prescription;
    data['status'] = status;
    data['patient'] = patient;
    return data;
  }
}
