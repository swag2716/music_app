class MusicList {
  final Message ?message;

  MusicList({this.message});

  factory MusicList.fromJson(Map<String, dynamic> json) {
    return MusicList(
    message: json['message'] != null ? Message.fromJson(json['message']) : null
      );


  }

  Map<String, dynamic> toJson() {

    return{
      'message': message!.toJson()
    };
  }
}

class Message {
  final Header ?header;
  final Body ?body;

  Message({this.header, this.body});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      header: json['header'] != null ? Header.fromJson(json['header']) : null,
      body: json['body'] != null ? Body.fromJson(json['body']) : null
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'header':header!.toJson(),
      'body': body!.toJson()
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
  final List<TrackList> trackList;

  Body({required this.trackList});

  factory Body.fromJson(Map<String, dynamic> json) {
    List<TrackList> trackList = [];
    return Body(
      trackList:json['track_list'].forEach((v) {
        trackList.add(TrackList.fromJson(v));
      })
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'track_list':trackList.map((v) => v.toJson()).toList()
    };
  }
}

class TrackList {
  final Track ?track;

  TrackList({this.track});

  factory TrackList.fromJson(Map<String, dynamic> json) {
    return TrackList(
      track:json['track'] != null ? Track.fromJson(json['track']) : null
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'track':track!.toJson()
    };
  }
}

class Track {
  final int trackId;
  final String trackName;
  final int trackRating;
  final int commontrackId;
  final int instrumental;
  final int explicit;
  final int hasLyrics;
  final int hasSubtitles;
  final int hasRichsync;
  final int numFavourite;
  final int albumId;
  final String albumName;
  final int artistId;
  final String artistName;
  final String trackShareUrl;
  final String trackEditUrl;
  final int restricted;
  final String updatedTime;
  final PrimaryGenres ?primaryGenres;

  Track(
      {required this.trackId,
      required this.trackName,
      required this.trackRating,
      required this.commontrackId,
      required this.instrumental,
      required this.explicit,
      required this.hasLyrics,
      required this.hasSubtitles,
      required this.hasRichsync,
      required this.numFavourite,
      required this.albumId,
      required this.albumName,
      required this.artistId,
      required this.artistName,
      required this.trackShareUrl,
      required this.trackEditUrl,
      required this.restricted,
      required this.updatedTime,
      this.primaryGenres});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
    trackId:json['track_id'],
    trackName : json['track_name'],
    trackRating : json['track_rating'],
    commontrackId : json['commontrack_id'],
    instrumental : json['instrumental'],
    explicit : json['explicit'],
    hasLyrics : json['has_lyrics'],
    hasSubtitles : json['has_subtitles'],
    hasRichsync : json['has_richsync'],
    numFavourite : json['num_favourite'],
    albumId : json['album_id'],
    albumName : json['album_name'],
    artistId : json['artist_id'],
    artistName : json['artist_name'],
    trackShareUrl : json['track_share_url'],
    trackEditUrl :json['track_edit_url'],
    restricted :json['restricted'],
    updatedTime :json['updated_time'],
    primaryGenres:json['primary_genres'] != null
        ? PrimaryGenres.fromJson(json['primary_genres'])
        : null
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'track_id':trackId,
      'track_name':trackName,
      'track_rating':trackRating,
      'commontrack_id':commontrackId,
      'instrumental':instrumental,
      'explicit':explicit,
      'has_lyrics':hasLyrics,
      'has_subtitles':hasSubtitles,
      'has_richsync':hasRichsync,
      'num_favourite':numFavourite,
      'album_id':albumId,
      'album_name':albumName,
      'artist_id':artistId,
      'artist_name':artistName,
      'track_share_url':trackShareUrl,
      'track_edit_url':trackEditUrl,
      'restricted':restricted,
      'updated_time':updatedTime,
      'primary_genres':primaryGenres!.toJson()
    };
  }
}

class PrimaryGenres {
  final List<MusicGenreList> ?musicGenreList;

  PrimaryGenres({this.musicGenreList});

  factory PrimaryGenres.fromJson(Map<String, dynamic> json) {
    List<MusicGenreList> musicGenreList = [];
    return PrimaryGenres(
      musicGenreList: json['music_genre_list'].forEach((v) {
        musicGenreList.add(MusicGenreList.fromJson(v));
      })
    );
    }

  Map<String, dynamic> toJson() {
    return{
      'music_genre_list': musicGenreList!.map((v) => v.toJson()).toList()
    };
  }
}

class MusicGenreList {
  final MusicGenre ?musicGenre;

  MusicGenreList({this.musicGenre});

  factory MusicGenreList.fromJson(Map<String, dynamic> json) {
    return MusicGenreList(
      musicGenre:json['music_genre'] != null
          ? MusicGenre.fromJson(json['music_genre'])
          : null
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'music_genre':musicGenre!.toJson()
    };
  }
}

class MusicGenre {
  final int musicGenreId;
  final int musicGenreParentId;
  final String musicGenreName;
  final String musicGenreNameExtended;
  final String musicGenreVanity;

  MusicGenre(
      {required this.musicGenreId,
      required this.musicGenreParentId,
      required this.musicGenreName,
      required this.musicGenreNameExtended,
      required this.musicGenreVanity});

  factory MusicGenre.fromJson(Map<String, dynamic> json) {
    return MusicGenre(
      musicGenreId:json['music_genre_id'],
      musicGenreParentId:json['music_genre_parent_id'],
      musicGenreName:json['music_genre_name'],
      musicGenreNameExtended:json['music_genre_name_extended'],
      musicGenreVanity:json['music_genre_vanity'],
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'music_genre_id':musicGenreId,
      'music_genre_parent_id':musicGenreParentId,
      'music_genre_name': musicGenreName,
      'music_genre_name_extended': musicGenreNameExtended,
      'music_genre_vanity':musicGenreVanity
    };
  }
}