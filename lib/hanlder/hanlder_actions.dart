import 'package:flutter/services.dart';

class Music {
  static const MethodChannel _channel = MethodChannel('music');

  static Future<bool> isLicensed() async {
    // invokeMethod returns a Future<T> which can be inferred as bool
    // in this context.
    return _channel.invokeMethod('isLicensed');
  }

  static Future<List<Song>> songs() async {
    // invokeMethod here returns a Future<dynamic> that completes to a
    // List<dynamic> with Map<dynamic, dynamic> entries. Post-processing
    // code thus cannot assume e.g. List<Map<String, String>> even though
    // the actual values involved would support such a typed container.
    // The correct type cannot be inferred with any value of `T`.
    final List<dynamic> songs = await _channel.invokeMethod('getSongs');
    return songs.map(Song.fromJson).toList();
  }

  static Future<void> play(Song song, double volume) async {
    // Errors occurring on the platform side cause invokeMethod to throw
    // PlatformExceptions.
    try {
      return _channel.invokeMethod('play', <String, dynamic>{
        'song': song.id,
        'volume': volume,
      });
    } on PlatformException catch (e) {
      throw 'Unable to play ${song.title}: ${e.message}';
    }
  }
}

class Song {
  Song(this.id, this.title, this.artist);

  final String id;
  final String title;
  final String artist;

  static Song fromJson(dynamic json) {
    return Song(json['id'], json['title'], json['artist']);
  }
}