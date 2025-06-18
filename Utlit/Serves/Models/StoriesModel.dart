class StoriesModel {
  int id;
  String username;
  String fname;
  String lname;
  String avatar;
  final swift;

  StoriesModel({
    required this.swift,
    required this.avatar,
    required this.lname,
    required this.fname,
    required this.username,
    required this.id,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> map) => StoriesModel(
        swift: map['swift'] == null ? '' : map['swift'],
        avatar: ModelString(map: map, title: 'avatar'),
        lname: ModelString(map: map, title: 'lname'),
        fname: ModelString(map: map, title: 'fname'),
        username: ModelString(map: map, title: 'username'),
        id: Modelint(map: map, title: 'id'),
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
