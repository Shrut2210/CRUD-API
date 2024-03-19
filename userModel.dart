class Model {
  String _avatar = "";
  String _name = "";
  String _exp = "";

  String get avatar => _avatar;

  set avatar(String value) {
    _avatar = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get exp => _exp;

  set exp(String value) {
    _exp = value;
  }

  Map<String,dynamic> toMap(){
    return {
      'name':_name,
      'exp':_exp,
      'avatar':_avatar
    };
  }
}