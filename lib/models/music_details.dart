import 'music_list.dart';

class MusicDetails {
  final Message message;

  MusicDetails({required this.message});

  factory MusicDetails.fromJson(Map<String, dynamic> json) {
    return MusicDetails(message: Message.fromJson(json['message']));
  }

  Map<String, dynamic> toJson() {
    return {'message': message.toJson()};
  }
}

class Message {
  final Header header;
  final Body body;

  Message({required this.header, required this.body});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        header: Header.fromJson(json['header']),
        body: Body.fromJson(json['body']));
  }

  Map<String, dynamic> toJson() {
    return {'header': header.toJson(), 'body': body.toJson()};
  }
}

class Header {
  final int statusCode;
  final double executeTime;

  Header({required this.statusCode, required this.executeTime});

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
        statusCode: json['status_code'], executeTime: json['execute_time']);
  }

  Map<String, dynamic> toJson() {
    return {'status_code': statusCode, 'execute_time': executeTime};
  }
}

class Body {
  final Track track;

  Body({required this.track});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(track: Track.fromJson(json['track']));
  }

  Map<String, dynamic> toJson() {
    return {'track': track.toJson()};
  }
}
