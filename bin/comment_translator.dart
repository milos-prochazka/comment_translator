import 'dart:convert';

import 'package:comment_translator/comment_line.dart';
import 'package:comment_translator/comment_translator.dart' as comment_translator;
import 'package:comment_translator/translate_base.dart';
import 'package:http/http.dart' as http;

const text = r'''
import 'dart:convert';

import 'package:comment_translator/comment_line.dart';
import 'package:comment_translator/comment_translator.dart' as comment_translator;
import 'package:comment_translator/translate_base.dart';
/// dldlsdlsdlsldsldslsl
''';

void main(List<String> arguments) async
{
  /*var url = Uri.parse('https://api-free.deepl.com/v2/translate');
  var response = await http.post(url, body: {'auth_key': 'a1b66257-44e8-d72a-a7f3-e3a6bfee7c54:fx', 'text': 'kočka', 'target_lang' : 'en'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');*/

  final t = TranslateLanguage();
  t.destLanguage = 'en';
  t.sourceLanguage = 'cs';
  t.translate['mama'] = 'tata';
  t.translate['jaja'] = 'paja';
  final tr = Translator();
  tr.add(t);
  tr.add(TranslateLanguage.reverse(t));

  var jx = tr.toJson();
  pp(jx);
  final js = jsonEncode(jx);
  print(js);
  final t1 = Translator.fromJson(json.decode(js));
  print(json.encode(t1.toJson()));

  t1.writeToFile('data.json');
  final t2 = Translator.fromFile('data.json');
  print(json.encode(t2.toJson()));
}