class QuizQuestion{

  final String text;
  final List<String> answers;

  QuizQuestion(this.text, this.answers);

  List <String> getShuffleAnswers(){
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
  
}