class ScoreFormatter {
  static String format(int score) {
    return score.toString().padLeft(2, '0').trim();
  }
}
