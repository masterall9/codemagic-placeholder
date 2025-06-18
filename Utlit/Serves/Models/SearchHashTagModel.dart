class SearchHashTagModel {
  int id;
  int posts;
  String tag;
  String time;
  String hashtag;
  String total;

  SearchHashTagModel({
    required this.total,
    required this.hashtag,
    required this.time,
    required this.tag,
    required this.id,
    required this.posts,
  });

  factory SearchHashTagModel.fromJson(Map<String, dynamic> map) =>
      SearchHashTagModel(
        total: ModelString(map: map, title: 'total'),
        hashtag: ModelString(map: map, title: 'hashtag'),
        time: ModelString(map: map, title: 'time'),
        tag: ModelString(map: map, title: 'tag'),
        posts: Modelint(map: map, title: 'posts'),
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
