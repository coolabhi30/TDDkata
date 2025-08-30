class NegativeNumbersException implements Exception {
  final List<int> negatives;
  NegativeNumbersException(this.negatives);

  @override
  String toString() => 'negatives not allowed ${negatives.join(",")}';
}

class StringCalculator {
  /// Adds numbers from a comma-separated string.
  ///
  /// Rules:
  /// - Empty string returns 0.
  /// - A single number returns itself.
  /// - Two numbers, comma delimited, returns their sum.
  /// - Unknown amount of numbers allowed.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final parseResult = _parse(numbers);
    final tokens = parseResult.$1;
    final values = <int>[];
    final negatives = <int>[];

    for (final t in tokens) {
      if (t.isEmpty) continue;
      final n = int.parse(t);
      if (n < 0) negatives.add(n);
      if (n <= 1000) values.add(n);
    }

    if (negatives.isNotEmpty) {
      throw NegativeNumbersException(negatives);
    }

    return values.fold(0, (a, b) => a + b);
  }

  /// Returns (tokens, delimiters)
  (List<String>, List<String>) _parse(String input) {
    List<String> delimiters = [',', '\n'];
    String payload = input;

    if (input.startsWith('//')) {
      final nl = input.indexOf('\n');
      final header = input.substring(2, nl);
      payload = input.substring(nl + 1);

      if (header.startsWith('[') && header.endsWith(']')) {
        // one or more [delim] blocks
        final regex = RegExp(r'\[([^\]]+)\]');
        delimiters = [
          for (final m in regex.allMatches(header)) m.group(1)!,
          '\n' // keep newline as valid too (kata: first line is optional; existing scenarios still supported)
        ];
      } else {
        // single-char delimiter like //;
        delimiters = [header, '\n'];
      }
    }

    final splitter = RegExp(_delimitersToPattern(delimiters));
    final tokens = payload.split(splitter);
    return (tokens, delimiters);
  }

  String _delimitersToPattern(List<String> delims) {
    // Escape regex metacharacters for each delimiter and join with alternation
    final escaped = delims.map(_escapeRegex).toList();
    return '(?:${escaped.join("|")})';
  }

  String _escapeRegex(String s) {
    // Characters with special meaning in RegExp
    const specials = r'\^$.|?*+()[]{}';
    final buffer = StringBuffer();
    for (final ch in s.split('')) {
      if (specials.contains(ch)) buffer.write(r'\');
      buffer.write(ch);
    }
    return buffer.toString();
  }
}
