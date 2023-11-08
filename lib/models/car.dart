class CarModel {
  String? carID;
  String? number;
  String? capacity;
  String? company;
  String? model;
  String? carName;
  String? linkModel;

  CarModel({
    this.carID,
    this.number,
    this.capacity,
    this.company,
    this.model,
    this.carName,
    this.linkModel,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    carID = json['carID'];
    number = json['number'];
    capacity = json['capacity'];
    company = json['company'];
    model = json['model'];
    carName = json['carName'];
    linkModel = json['linkDoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carID'] = carID;
    data['number'] = number;
    data['capacity'] = capacity;
    data['company'] = company;
    data['model'] = model;
    data['carName'] = carName;
    data['linkDoc'] = linkModel;
    return data;
  }
}
