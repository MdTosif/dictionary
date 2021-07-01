import 'package:flutter_application_1/model/Dictionary.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  String word;
  Map<String, String> headerValues = {
    "x-rapidapi-key": "663a382997msh849d3592509ee55p14b2d0jsn003c62774349",
    "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com",
  };

  ApiCall(this.word);

  Future<String> data() async {
    final String url =
        'https://mashape-community-urban-dictionary.p.rapidapi.com/define?term=${this.word}';
    var response = await http.get(Uri.parse(url), headers: headerValues);
    return response.body;
  }

  Future<Dictionary> wordDictionary() async {
    String str = await this.data();
    return dictionaryFromJson(str);
  }
}

// void main() async {
//   ApiCall ffs = ApiCall('ffs');
//   Dictionary data = await ffs.wordDictionary();
//   print(data.list![0].word);
// }
