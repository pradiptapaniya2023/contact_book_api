class PostContactdata {
  String? status;
  String? message;
  Data? data;

  PostContactdata({this.status, this.message, this.data});

  PostContactdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  int? mobileNo;
  String? email;
  String? nickName;
  String? sId;
  int? iV;

  Data(
      {this.firstName,
        this.lastName,
        this.mobileNo,
        this.email,
        this.nickName,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    nickName = json['nickName'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['nickName'] = this.nickName;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
