import 'package:colibricmflutter/Utlit/Serves/Models/GetProfileDataModel.dart';

class GetNofication {
  int id;
  int notifier_id;
  int recipient_id;
  int entry_id;
  String status;
  String subject;
  String time;
  String username;
  String avatar;
  String name;

  GetNofication({
    required this.id,
    required this.notifier_id,
    required this.recipient_id,
    required this.status,
    required this.subject,
    required this.entry_id,
    required this.time,
    required this.username,
    required this.avatar,
    required this.name,
  });

  factory GetNofication.fromJson(Map<String, dynamic> map) => GetNofication(
      id: Modelint(map: map, title: 'id'),
      notifier_id: Modelint(map: map, title: 'notifier_id'),
      recipient_id: Modelint(map: map, title: 'recipient_id'),
      status: ModelString(map: map, title: 'status'),
      subject: ModelString(map: map, title: 'subject'),
      entry_id: Modelint(map: map, title: 'entry_id'),
      time: ModelString(map: map, title: 'time'),
      username: ModelString(map: map, title: 'username'),
      avatar: ModelString(map: map, title: 'avatar'),
      name: ModelString(map: map, title: 'name'));
}
