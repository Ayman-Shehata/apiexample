class Workrs {
  Workrs({
      this.id, 
      this.serviceID, 
      this.name, 
      this.tel1, 
      this.tel2, 
      this.address, 
      this.places, 
      this.profile, 
      this.services, 
      this.rate,});

  Workrs.fromJson(dynamic json) {
    id = json['id'];
    serviceID = json['serviceID'];
    name = json['name'];
    tel1 = json['tel1'];
    tel2 = json['tel2'];
    address = json['address'];
    places = json['places'];
    profile = json['profile'];
    services = json['services'];
    rate = json['rate'];
  }
  num? id;
  num? serviceID;
  String? name;
  String? tel1;
  String? tel2;
  String? address;
  String? places;
  String? profile;
  String? services;
  num? rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['serviceID'] = serviceID;
    map['name'] = name;
    map['tel1'] = tel1;
    map['tel2'] = tel2;
    map['address'] = address;
    map['places'] = places;
    map['profile'] = profile;
    map['services'] = services;
    map['rate'] = rate;
    return map;
  }

}