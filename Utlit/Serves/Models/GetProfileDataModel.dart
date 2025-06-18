class GetProfileDataModel {
  int id;
  String avatar;
  String cover;
  String first_name;
  String last_name;
  String user_name;
  int following_count;
  int follower_count;
  String about_you;
  String country;
  bool is_following;
  String email;
  String gender;
  String website;
  final user;

  GetProfileDataModel({
    required this.website,
    required this.gender,
    required this.email,
    required this.user,
    required this.is_following,
    required this.first_name,
    required this.avatar,
    required this.last_name,
    required this.about_you,
    required this.id,
    required this.cover,
    required this.user_name,
    required this.country,
    required this.following_count,
    required this.follower_count,
  });

  factory GetProfileDataModel.fromJson(Map<String, dynamic> map) =>
      GetProfileDataModel(
          gender: ModelString(map: map, title: 'gender'),
          email: ModelString(map: map, title: 'email'),
          user: map['user'] == null ? '' : map['user'],
          is_following: ModeBool(map: map, title: 'is_following'),
          country: ModelString(map: map, title: 'country'),
          about_you: ModelString(map: map, title: 'about_you'),
          avatar: ModelString(map: map, title: 'avatar'),
          cover: ModelString(map: map, title: 'cover'),
          id: Modelint(map: map, title: 'id'),
          last_name: ModelString(map: map, title: 'last_name'),
          first_name: ModelString(map: map, title: 'first_name'),
          user_name: ModelString(map: map, title: 'user_name'),
          following_count: Modelint(map: map, title: 'following_count'),
          follower_count: Modelint(map: map, title: 'follower_count'),
          website: ModelString(map: map, title: 'website'));
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
