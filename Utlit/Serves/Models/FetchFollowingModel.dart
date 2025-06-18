class FetchFollowingModel {
  int offset_id;
  int id;
  String avatar;
  String fname;
  String lname;
  bool is_following;

  FetchFollowingModel({
    required this.is_following,
    required this.lname,
    required this.fname,
    required this.avatar,
    required this.offset_id,
    required this.id,
  });

  factory FetchFollowingModel.fromJson(Map<String, dynamic> map) =>
      FetchFollowingModel(
        is_following: ModeBool(map: map, title: 'is_following'),
        lname: ModelString(map: map, title: 'lname'),
        fname: ModelString(map: map, title: 'fname'),
        avatar: ModelString(map: map, title: 'avatar'),
        id: Modelint(map: map, title: 'id'),
        offset_id: Modelint(map: map, title: 'offset_id'),

        //
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
