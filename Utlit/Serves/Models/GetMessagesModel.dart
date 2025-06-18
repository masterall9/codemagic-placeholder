class GetMessagesModel {
  int id;
  int sent_by;
  int sent_to;
  bool owner;
  String message;
  String media_file;
  String audio_record;
  String media_type;
  String seen;
  String time;
  String side;
  String msg_raw;
  String deleted_fs1;

  GetMessagesModel({
    required this.deleted_fs1,
    required this.msg_raw,
    required this.side,
    required this.time,
    required this.seen,
    required this.media_type,
    required this.audio_record,
    required this.media_file,
    required this.message,
    required this.owner,
    required this.sent_to,
    required this.id,
    required this.sent_by,
  });

  factory GetMessagesModel.fromJson(Map<String, dynamic> map) =>
      GetMessagesModel(
        deleted_fs1: ModelString(map: map, title: 'deleted_fs1'),
        msg_raw: ModelString(map: map, title: 'msg_raw'),
        side: ModelString(map: map, title: 'side'),
        time: ModelString(map: map, title: 'time'),
        media_type: ModelString(map: map, title: 'media_type'),
        audio_record: ModelString(map: map, title: 'audio_record'),
        media_file: ModelString(map: map, title: 'media_file'),
        message: ModelString(map: map, title: 'message'),
        owner: ModeBool(map: map, title: 'owner'),
        id: Modelint(map: map, title: 'id'),
        sent_by: Modelint(map: map, title: 'sent_by'),
        sent_to: Modelint(map: map, title: 'sent_to'),
        seen: ModelString(map: map, title: 'seen'),
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
