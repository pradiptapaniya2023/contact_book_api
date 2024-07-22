class GetContactdata {
  String? status;
  String? message;
  List<Data>? data;

  GetContactdata({this.status, this.message, this.data});

  GetContactdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? lastName;
  int? mobileNo;
  String? email;
  String? nickName;
  int? iV;

  Data(
      {this.sId,
        this.firstName,
        this.lastName,
        this.mobileNo,
        this.email,
        this.nickName,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    nickName = json['nickName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['nickName'] = this.nickName;
    data['__v'] = this.iV;
    return data;
  }
}
