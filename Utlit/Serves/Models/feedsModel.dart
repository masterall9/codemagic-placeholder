import 'package:colibricmflutter/Utlit/Serves/Models/GetChatModel.dart';

class feedsModel {
  int id;
  int user_id;
  int thread_id;
  final media;
  String type;
  int offset_id;
  bool is_repost;
  bool is_reposter;
  String avatar;
  final poll;
  bool has_saved;
  String name;
  String username;
  String text;
  String time;
  String likes_count;
  String reposts_count;
  String replys_count;
  String reposter_username;
  String reposter_name;
  String og_image;
  String verified;
  bool has_liked;
  int donation_raised_percent;
  bool is_owner;
  String is_donation_post;
  String donation_amount;
  String donation_raised;
  final owner;
  int donations_total;
  final next;
  CommentPost datapost;

  feedsModel({
    required this.thread_id,
    required this.datapost,
    required this.next,
    required this.donation_raised_percent,
    required this.donation_raised,
    required this.donation_amount,
    required this.is_donation_post,
    required this.has_saved,
    required this.is_owner,
    required this.donations_total,
    required this.owner,
    required this.has_liked,
    required this.media,
    required this.likes_count,
    required this.og_image,
    required this.reposter_name,
    required this.text,
    required this.reposter_username,
    required this.replys_count,
    required this.reposts_count,
    required this.poll,
    required this.id,
    required this.is_repost,
    required this.user_id,
    required this.type,
    required this.offset_id,
    required this.is_reposter,
    required this.avatar,
    required this.time,
    required this.name,
    required this.username,
    required this.verified,
  });

  factory feedsModel.fromJson(Map<String, dynamic> map) => feedsModel(
        thread_id: Modelint(map: map, title: 'thread_id'),
        datapost: map['post'] == null
            ? CommentPost.fromJson(map)
            : CommentPost.fromJson(map['post']),
        next: map['next'] == null ? '' : map['next'],
        donation_raised_percent:
            Modelint(map: map, title: 'donation_raised_percent'),
        donations_total: Modelint(map: map, title: 'donations_total'),
        donation_raised: ModelString(map: map, title: 'donation_raised'),
        donation_amount: ModelString(map: map, title: 'donation_amount'),
        is_donation_post: ModelString(map: map, title: 'is_donation_post'),
        has_saved: map['has_saved'] == null ? false : map['has_saved'],
        owner: map['owner'] == null ? '' : map['owner'],
        is_owner: map['is_owner'] == null ? false : map['is_owner'],
        poll: map['poll'] == null ? '' : map['poll'],
        media: map['media'] == null ? '' : map['media'],
        has_liked: map['has_liked'] == null ? false : map['has_liked'],
        og_image: map['og_image'] == null ? '' : map['og_image'],
        reposter_name: map['reposter'] == null ? '' : map['reposter']['name'],
        reposter_username:
            map['reposter'] == null ? '' : map['reposter']['username'],
        reposts_count:
            map['reposts_count'] == null ? '0' : map['reposts_count'],
        replys_count: map['replys_count'] == null ? '0' : map['replys_count'],
        likes_count: map['likes_count'] == null ? '' : map['likes_count'],
        time: map['time'] == null ? '' : map['time'],
        id: map['id'] == null ? 0 : map['id'],
        user_id: map['user_id'] == null ? 0 : map['user_id'],
        type: map['type'] == null ? '' : map['type'],
        offset_id: map['offset_id'] == null ? 0 : map['offset_id'],
        is_repost: map['is_repost'] == null ? false : map['is_repost'],
        is_reposter: map['is_reposter'] == null ? false : map['is_reposter'],
        avatar: map['owner'] == null ? '' : map['owner']['avatar'],
        verified: map['owner'] == null ? '' : map['owner']['verified'],
        name: map['owner'] == null ? '' : map['owner']['name'],
        username: map['owner'] == null ? '' : map['owner']['username'],
        text: map['text'] == null ? '' : map['text'],
      );
}

class PinPostModel {
  int id;
  int user_id;
  final media;
  String type;
  int offset_id;
  bool is_repost;
  bool is_reposter;
  String avatar;
  final poll;
  String name;
  String username;
  String text;
  String time;
  int likes_count;
  int reposts_count;
  int replys_count;
  String reposter_username;
  String reposter_name;
  String og_image;
  String verified;
  bool has_liked;
  bool is_owner;

  PinPostModel({
    required this.is_owner,
    required this.has_liked,
    required this.media,
    required this.likes_count,
    required this.og_image,
    required this.reposter_name,
    required this.text,
    required this.reposter_username,
    required this.replys_count,
    required this.reposts_count,
    required this.poll,
    required this.id,
    required this.is_repost,
    required this.user_id,
    required this.type,
    required this.offset_id,
    required this.is_reposter,
    required this.avatar,
    required this.time,
    required this.name,
    required this.username,
    required this.verified,
  });

  factory PinPostModel.fromJson(Map<String, dynamic> map) => PinPostModel(
        is_owner: map['is_owner'] == null ? false : map['is_owner'],
        poll: map['poll'] == null ? '' : map['poll'],
        media: map['media'] == null ? '' : map['media'],
        has_liked: map['has_liked'] == null ? false : map['has_liked'],
        og_image: map['og_image'] == null ? '' : map['og_image'],
        reposter_name: map['reposter'] == null ? '' : map['reposter']['name'],
        reposter_username:
            map['reposter'] == null ? '' : map['reposter']['username'],
        reposts_count: map['reposts_count'] == null ? 0 : map['reposts_count'],
        replys_count: map['replys_count'] == null ? 0 : map['replys_count'],
        likes_count: map['likes_count'] == null ? '' : map['likes_count'],
        time: map['time'] == null ? '' : map['time'],
        id: map['id'] == null ? 0 : map['id'],
        user_id: map['user_id'] == null ? 0 : map['user_id'],
        type: map['type'] == null ? '' : map['type'],
        offset_id: map['offset_id'] == null ? 0 : map['offset_id'],
        is_repost: map['is_repost'] == null ? false : map['is_repost'],
        is_reposter: map['is_reposter'] == null ? false : map['is_reposter'],
        avatar: map['owner'] == null ? '' : map['owner']['avatar'],
        verified: map['owner'] == null ? '' : map['owner']['verified'],
        name: map['owner'] == null ? '' : map['owner']['name'],
        username: map['owner'] == null ? '' : map['owner']['username'],
        text: map['text'] == null ? '' : map['text'],
      );
}

class CommentPost {
  int id;
  int user_id;
  final media;
  String type;
  int offset_id;
  bool is_repost;
  bool is_reposter;
  String avatar;
  final poll;
  bool has_saved;
  String name;
  String username;
  String text;
  String time;
  String likes_count;
  String reposts_count;
  String replys_count;
  String reposter_username;
  String reposter_name;
  String og_image;
  String verified;
  bool has_liked;
  int donation_raised_percent;
  bool is_owner;
  String is_donation_post;
  String donation_amount;
  String donation_raised;
  final owner;
  int donations_total;
  final next;
  final datapost;

  CommentPost({
    required this.datapost,
    required this.next,
    required this.donation_raised_percent,
    required this.donation_raised,
    required this.donation_amount,
    required this.is_donation_post,
    required this.has_saved,
    required this.is_owner,
    required this.donations_total,
    required this.owner,
    required this.has_liked,
    required this.media,
    required this.likes_count,
    required this.og_image,
    required this.reposter_name,
    required this.text,
    required this.reposter_username,
    required this.replys_count,
    required this.reposts_count,
    required this.poll,
    required this.id,
    required this.is_repost,
    required this.user_id,
    required this.type,
    required this.offset_id,
    required this.is_reposter,
    required this.avatar,
    required this.time,
    required this.name,
    required this.username,
    required this.verified,
  });

  factory CommentPost.fromJson(Map<String, dynamic> map) => CommentPost(
        datapost: map['post'] == null ? '' : map['post'],
        next: map['next'] == null ? '' : map['next'],
        donation_raised_percent:
            Modelint(map: map, title: 'donation_raised_percent'),
        donations_total: Modelint(map: map, title: 'donations_total'),
        donation_raised: ModelString(map: map, title: 'donation_raised'),
        donation_amount: ModelString(map: map, title: 'donation_amount'),
        is_donation_post: ModelString(map: map, title: 'is_donation_post'),
        has_saved: map['has_saved'] == null ? false : map['has_saved'],
        owner: map['owner'] == null ? '' : map['owner'],
        is_owner: map['is_owner'] == null ? false : map['is_owner'],
        poll: map['poll'] == null ? '' : map['poll'],
        media: map['media'] == null ? '' : map['media'],
        has_liked: map['has_liked'] == null ? false : map['has_liked'],
        og_image: map['og_image'] == null ? '' : map['og_image'],
        reposter_name: map['reposter'] == null ? '' : map['reposter']['name'],
        reposter_username:
            map['reposter'] == null ? '' : map['reposter']['username'],
        reposts_count:
            map['reposts_count'] == null ? '0' : map['reposts_count'],
        replys_count: map['replys_count'] == null ? '0' : map['replys_count'],
        likes_count: map['likes_count'] == null ? '' : map['likes_count'],
        time: map['time'] == null ? '' : map['time'],
        id: map['id'] == null ? 0 : map['id'],
        user_id: map['user_id'] == null ? 0 : map['user_id'],
        type: map['type'] == null ? '' : map['type'],
        offset_id: map['offset_id'] == null ? 0 : map['offset_id'],
        is_repost: map['is_repost'] == null ? false : map['is_repost'],
        is_reposter: map['is_reposter'] == null ? false : map['is_reposter'],
        avatar: map['owner'] == null ? '' : map['owner']['avatar'],
        verified: map['owner'] == null ? '' : map['owner']['verified'],
        name: map['owner'] == null ? '' : map['owner']['name'],
        username: map['owner'] == null ? '' : map['owner']['username'],
        text: map['text'] == null ? '' : map['text'],
      );
}

class CommentNext {
  int id;
  int user_id;
  final media;
  String type;
  int offset_id;
  bool is_repost;
  bool is_reposter;
  String avatar;
  final poll;
  bool has_saved;
  String name;
  String username;
  String text;
  String time;
  String likes_count;
  String reposts_count;
  String replys_count;
  String reposter_username;
  String reposter_name;
  String og_image;
  String verified;
  bool has_liked;
  int donation_raised_percent;
  bool is_owner;
  String is_donation_post;
  String donation_amount;
  String donation_raised;
  final owner;
  int donations_total;
  final next;
  final datapost;

  CommentNext({
    required this.datapost,
    required this.next,
    required this.donation_raised_percent,
    required this.donation_raised,
    required this.donation_amount,
    required this.is_donation_post,
    required this.has_saved,
    required this.is_owner,
    required this.donations_total,
    required this.owner,
    required this.has_liked,
    required this.media,
    required this.likes_count,
    required this.og_image,
    required this.reposter_name,
    required this.text,
    required this.reposter_username,
    required this.replys_count,
    required this.reposts_count,
    required this.poll,
    required this.id,
    required this.is_repost,
    required this.user_id,
    required this.type,
    required this.offset_id,
    required this.is_reposter,
    required this.avatar,
    required this.time,
    required this.name,
    required this.username,
    required this.verified,
  });

  factory CommentNext.fromJson(Map<String, dynamic> map) => CommentNext(
        datapost: map['post'] == null ? '' : map['post'],
        next: map['next'] == null ? '' : map['next'],
        donation_raised_percent:
            Modelint(map: map, title: 'donation_raised_percent'),
        donations_total: Modelint(map: map, title: 'donations_total'),
        donation_raised: ModelString(map: map, title: 'donation_raised'),
        donation_amount: ModelString(map: map, title: 'donation_amount'),
        is_donation_post: ModelString(map: map, title: 'is_donation_post'),
        has_saved: map['has_saved'] == null ? false : map['has_saved'],
        owner: map['owner'] == null ? '' : map['owner'],
        is_owner: map['is_owner'] == null ? false : map['is_owner'],
        poll: map['poll'] == null ? '' : map['poll'],
        media: map['media'] == null ? '' : map['media'],
        has_liked: map['has_liked'] == null ? false : map['has_liked'],
        og_image: map['og_image'] == null ? '' : map['og_image'],
        reposter_name: map['reposter'] == null ? '' : map['reposter']['name'],
        reposter_username:
            map['reposter'] == null ? '' : map['reposter']['username'],
        reposts_count:
            map['reposts_count'] == null ? '0' : map['reposts_count'],
        replys_count: map['replys_count'] == null ? '0' : map['replys_count'],
        likes_count: map['likes_count'] == null ? '' : map['likes_count'],
        time: map['time'] == null ? '' : map['time'],
        id: map['id'] == null ? 0 : map['id'],
        user_id: map['user_id'] == null ? 0 : map['user_id'],
        type: map['type'] == null ? '' : map['type'],
        offset_id: map['offset_id'] == null ? 0 : map['offset_id'],
        is_repost: map['is_repost'] == null ? false : map['is_repost'],
        is_reposter: map['is_reposter'] == null ? false : map['is_reposter'],
        avatar: map['owner'] == null ? '' : map['owner']['avatar'],
        verified: map['owner'] == null ? '' : map['owner']['verified'],
        name: map['owner'] == null ? '' : map['owner']['name'],
        username: map['owner'] == null ? '' : map['owner']['username'],
        text: map['text'] == null ? '' : map['text'],
      );
}
