class UserDetailsInfo {
  UserDetailsInfo({
    this.name,
    this.address,
    this.mobile,
  });

  UserDetailsInfo.fromJson(dynamic json) {
    name = json['name'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    mobile = json['mobile'];
  }

  String? name;
  Address? address;
  num? mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['mobile'] = mobile;
    return map;
  }
}

class Address {
  Address({
    this.state,
    this.city,
  });

  Address.fromJson(dynamic json) {
    state = json['state'];
    city = json['city'];
  }

  String? state;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state'] = state;
    map['city'] = city;
    return map;
  }
}
