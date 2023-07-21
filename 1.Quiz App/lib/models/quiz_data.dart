class QuizQues {
  const QuizQues({
    required this.question,
    required this.options,
  });

  final String question;
  final List<String> options;

  List<String> getShuffledOptions() {
    final shuffledOptions = List.of(options);
    shuffledOptions.shuffle(); 
    return shuffledOptions;
  }
}


