class UserModel{
  String? uid;
  String? name;
  String? phonenumber;
  String? email;
  String? telephonenumber;
  String? country;
  String? state;
  String? city;
  String? address;
  String? password;
  String? bloodgroup;
  String? pincode;
  String? aadhar;

  UserModel({this.uid,this.name,this.phonenumber,this.email,this.telephonenumber,this.country,this.state,this.city,this.address,this.password,this.bloodgroup,this.pincode,this.aadhar});

  //receiving data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      name:map['name'],
      phonenumber: map['phonenumber'],
      email: map['email'],
      telephonenumber: map['telephonenumber'],
      country: map['country'],
      state: map['state'],
      city: map['city'],
      address: map['address'],
      password: map['password'],
      bloodgroup: map['bloodgroup'],
      pincode: map['pincode'],
      aadhar: map['aadhar'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap(){
    return{
      'uid':uid,
      'name':name,
      'phonenumber':phonenumber,
      'email':email,
      'telephonenumber':telephonenumber,
      'country':country,
      'state':state,
      'city':city,
      'address':address,
      'password':password,
      'bloodgroup':bloodgroup,
      'pincode':pincode,
      'aadhar':aadhar,
    };
  }

}