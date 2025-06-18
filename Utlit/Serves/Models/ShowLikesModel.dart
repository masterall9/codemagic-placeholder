class ShowLikesModel {
  int offset_id;
  int user_id;
  int followers;
  int following;
  int posts;
  String avatar;
  String name;

  ShowLikesModel({
    required this.offset_id,
    required this.user_id,
    required this.followers,
    required this.following,
    required this.posts,
    required this.avatar,
    required this.name,
//
  });

  factory ShowLikesModel.fromJson(Map<String, dynamic> map) => ShowLikesModel(
        offset_id: map['offset_id'] == null ? 0 : map['offset_id'],
        user_id: map['id'] == null ? 0 : map['id'],
        followers: map['followers'] == null ? 0 : map['followers'],
        following: map['following'] == null ? 0 : map['following'],
        posts: map['posts'] == null ? 0 : map['posts'],
        avatar: map['avatar'] == null ? '' : map['avatar'],
        name: map['name'] == null ? '' : map['name'],

        //
      );
}
