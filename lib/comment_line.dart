// ^(.*\/{2,}\s*)(\-+|\=+|\*+)?(\s*)([^\r\n]*)$

class CommentLine
{
  static final commentReg = RegExp(r'^(.*\/{2,}\s*)(\-+|\=+|\*+|\~+)?(\s*)([^\r\n]*)$');

  String linePrefix = '';
  String lineDecoration = '';
  String lineTranslateText = '';
  bool canTranslate = false;

  CommentLine(String text)
  {
    final match = commentReg.firstMatch(text);

    if (match != null)
    {
      linePrefix = match.group(1) ?? '';
      final d = match.group(2) ?? '';
      if (d.isNotEmpty)
      {
        lineDecoration = d + (match.group(3) ?? '');
      }
      lineTranslateText = match.group(4)?.trim() ?? '';
      canTranslate = lineTranslateText.isNotEmpty;
    }
  }

  @override
  String toString()
  {
    return linePrefix + lineDecoration + lineTranslateText;
  }
}