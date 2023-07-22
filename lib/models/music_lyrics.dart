class MusicLyrics {
  final Message message;

  MusicLyrics({required this.message});

  factory MusicLyrics.fromJson(Map<String, dynamic> json) {
    return MusicLyrics(
    message: Message.fromJson(json['message'])
      );


  }

  Map<String, dynamic> toJson() {

    return{
      'message': message.toJson()
    };
  }
}

class Message {
  final Header header;
  final Body body;

  Message({required this.header, required this.body});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      header: Header.fromJson(json['header']),
      body: Body.fromJson(json['body'])
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'header':header.toJson(),
      'body': body.toJson()
    };
  }
}

class Header {
  final int statusCode;
  final double executeTime;

  Header({required this.statusCode, required this.executeTime});

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      statusCode:json['status_code'],
      executeTime:json['execute_time']
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'status_code':statusCode,
      'execute_time':executeTime
    };
  }
}

class Body {
  final Lyrics lyrics;

  Body({required this.lyrics});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      lyrics:Lyrics.fromJson(json['lyrics'])
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'lyrics':lyrics.toJson()
    };
  }
}

class Lyrics {
  final int lyricsId;
  final int explicit;
  final String lyricsBody;
  final String scriptTrackingUrl;
  final String pixelTrackingUrl;
  final String lyricsCopyright;
  final String updatedTime;

  Lyrics(
      {required this.lyricsId,
      required this.explicit,
      required this.lyricsBody,
      required this.scriptTrackingUrl,
      required this.pixelTrackingUrl,
      required this.lyricsCopyright,
      required this.updatedTime});

  factory Lyrics.fromJson(Map<String, dynamic> json) {
    return Lyrics(
      lyricsId:json['lyrics_id'],
      explicit : json['explicit'],
      lyricsBody :json['lyrics_body'],
      scriptTrackingUrl :json['script_tracking_url'],
      pixelTrackingUrl : json['pixel_tracking_url'],
      lyricsCopyright : json['lyrics_copyright'],
      updatedTime : json['updated_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'lyrics_id':lyricsId,
      'explicit':explicit,
      'lyrics_body':lyricsBody,
      'script_tracking_url':scriptTrackingUrl,
      'pixel_tracking_url':pixelTrackingUrl,
      'lyrics_copyright':lyricsCopyright,
      'updated_time':updatedTime
    };
  }
}
