import 'package:comment_translator/comment_translator.dart' as comment_translator;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async
{

  var url = Uri.parse('https://api-free.deepl.com/v2/translate');
  var response = await http.post(url, body: {'auth_key': 'a1b66257-44e8-d72a-a7f3-e3a6bfee7c54:fx', 'text': 'kočka', 'target_lang' : 'en'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

}
