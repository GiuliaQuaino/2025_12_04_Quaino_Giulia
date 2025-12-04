class Exercise {
  final String name;
  final int score;
  final DateTime submittedAt;

  Exercise({
    required this.name,
    required this.score,
    required this.submittedAt,
  });

   bool get isPassed{
    return score >= 60;
  }

  List<Exercise> passedOnly(List<Exercise> exercises)
  {
    List<Exercise> newList = [];
    for(var e in exercises){
      if(e.score >= 60){
        newList.add(e);
    }
    }
    
    return newList;
  }

  double averageScore(List<Exercise> exercises){
    int sum = 0;
    double avg = 0;
    for (var e in exercises){
      sum = sum + e.score;
    }
    avg = sum /exercises.length;
    return avg;
  }
  

  String bestStudent(List<Exercise> exercises) {
  var bestSt = exercises[0];
  for (var e in exercises) {
    if(e.score > bestSt.score){
      bestSt = e;
    }
  }
  return bestSt.name;
}
}