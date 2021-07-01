// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

Dictionary dictionaryFromJson(String str) =>
    Dictionary.fromJson(json.decode(str));

String dictionaryToJson(Dictionary data) => json.encode(data.toJson());

class Dictionary {
  Dictionary({
    this.list,
  });

  List<ListElement>? list;

  factory Dictionary.fromJson(Map<String, dynamic> json) => Dictionary(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.definition,
    this.permalink,
    this.thumbsUp,
    this.soundUrls,
    this.author,
    this.word,
    this.defid,
    this.currentVote,
    this.writtenOn,
    this.example,
    this.thumbsDown,
  });

  String? word;
  String? definition;
  String? example;
  String? permalink;
  int? thumbsUp;
  List<dynamic>? soundUrls;
  String? author;
  int? defid;
  String? currentVote;
  DateTime? writtenOn;
  int? thumbsDown;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        definition: json["definition"],
        permalink: json["permalink"],
        thumbsUp: json["thumbs_up"],
        soundUrls: List<dynamic>.from(json["sound_urls"].map((x) => x)),
        author: json["author"],
        word: json["word"],
        defid: json["defid"],
        currentVote: json["current_vote"],
        writtenOn: DateTime.parse(json["written_on"]),
        example: json["example"],
        thumbsDown: json["thumbs_down"],
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "permalink": permalink,
        "thumbs_up": thumbsUp,
        "sound_urls": List<dynamic>.from(soundUrls!.map((x) => x)),
        "author": author,
        "word": word,
        "defid": defid,
        "current_vote": currentVote,
        "written_on": writtenOn!.toIso8601String(),
        "example": example,
        "thumbs_down": thumbsDown,
      };
}
