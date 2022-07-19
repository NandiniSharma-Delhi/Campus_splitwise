class UserProfile {
  final String Uname;
  final String Phnum;
  final String Uemail;

  UserProfile(this.Uname, this.Phnum, this.Uemail);
  UserProfile.fromJson(Map<dynamic, dynamic> json)
    : Uname = json['Uname'] as String,
    Phnum = json['Phnum'] as String,
    Uemail=json['Uemail'] as String;

Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'Uname': Uname,
      'Phnum' :Phnum,
      'Uemail' :Uemail,
    };
}
