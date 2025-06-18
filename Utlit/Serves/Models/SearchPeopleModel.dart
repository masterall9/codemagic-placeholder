class SearchPeopleModel {
  
  bool is_following;
  String username;
  String fname;
  String avatar;
  String verified;
  int user_id;
  String lname;
  String time;
  String last_message;
  final new_messages;

  SearchPeopleModel({
    required this.new_messages,
    required this.last_message,
    required this.time,
    required this.user_id,
    required this.lname,
    required this.verified,
    required this.avatar,
    required this.fname,
    required this.is_following,
    required this.username,
  });

  factory SearchPeopleModel.fromJson(Map<String, dynamic> map) =>
      SearchPeopleModel(
        new_messages: map['new_messages'],
        last_message: ModelString(map: map, title: 'last_message'),
        time: ModelString(map: map, title: 'time'),
        user_id: Modelint(map: map, title: 'id'),
        lname: ModelString(map: map, title: 'lname'),
        verified: ModelString(map: map, title: 'verified'),
        avatar: ModelString(map: map, title: 'avatar'),
        fname: ModelString(map: map, title: 'fname'),
        username: ModelString(map: map, title: 'username'),
        is_following: ModeBool(map: map, title: 'is_following'),
      );
}

ModelString({required dynamic map, required String title}) {
  return map[title] == null ? '' : map[title];
}

Modelint({required dynamic map, required String title}) {
  return map[title] == null ? 0 : map[title];
}

ModeBool({required dynamic map, required String title}) {
  return map[title] == null ? false : map[title];
}
