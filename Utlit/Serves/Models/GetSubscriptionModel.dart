class GetSubscriptionModel {
//
  int id;
  int user_id;
  String subscription_end;
  String subscription_start;
  int followers;
  int following;
  int posts;
  String lname;
  String fname;
  String verified;
  int left_days;
  String name;
  String avatar;
  GetSubscriptionModel({
    required this.avatar,
    required this.name,
    required this.verified,
    required this.fname,
    required this.lname,
    required this.posts,
    required this.following,
    required this.followers,
    required this.user_id,
    required this.id,
    required this.subscription_start,
    required this.subscription_end,
    required this.left_days,
    //
  });

  factory GetSubscriptionModel.fromJson(Map<String, dynamic> map) =>
      GetSubscriptionModel(
        avatar: map['avatar'] == null ? '' : map['avatar'],
        name: map['name'] == null ? '' : map['name'],
        left_days: map['left_days'] == null ? '' : map['left_days'],
        verified: map['verified'] == null ? '' : map['verified'],
        lname: map['lname'] == null ? '' : map['lname'],
        fname: map['fname'] == null ? '' : map['fname'],
        posts: map['posts'] == null ? '' : map['posts'],
        following: map['following'] == null ? 0 : map['following'],
        followers: map['followers'] == null ? 0 : map['followers'],
        user_id: map['user_id'] == null ? 0 : map['user_id'],
        subscription_end:
            map['subscription_end'] == null ? '' : map['subscription_end'],
        id: map['id'] == null ? 0 : map['id'],
        subscription_start:
            map['subscription_start'] == null ? '' : map['subscription_start'],
        //
        //
      );
}
