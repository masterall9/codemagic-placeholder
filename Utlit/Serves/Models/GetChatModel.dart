class GetChatModel {
  int chat_id;
  String username;
  String name;
  String avatar;
  String verified;
  int user_id;
  final is_online;
  String time;
  String last_message;
  var new_messages;

  GetChatModel({
    required this.new_messages,
    required this.last_message,
    required this.time,
    required this.user_id,
    required this.is_online,
    required this.verified,
    required this.avatar,
    required this.name,
    required this.chat_id,
    required this.username,
  });

  factory GetChatModel.fromJson(Map<String, dynamic> map) => GetChatModel(
        new_messages: map['new_messages'],
        last_message: ModelString(map: map, title: 'last_message'),
        time: ModelString(map: map, title: 'time'),
        user_id: Modelint(map: map, title: 'user_id'),
        is_online: ModelString(map: map, title: 'is_online'),
        verified: ModelString(map: map, title: 'verified'),
        avatar: ModelString(map: map, title: 'avatar'),
        name: ModelString(map: map, title: 'name'),
        username: ModelString(map: map, title: 'username'),
        chat_id: Modelint(map: map, title: 'chat_id'),
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
