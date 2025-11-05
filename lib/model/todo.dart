class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Ochtend Gym', isDone: true ),
      ToDo(id: '02', todoText: 'Boodschappen doen', isDone: true ),
      ToDo(id: '03', todoText: 'Emails Checken', ),
      ToDo(id: '04', todoText: 'Team Meeting', ),
      ToDo(id: '05', todoText: 'Naar school', ),
      ToDo(id: '06', todoText: 'Vuil wegbrengen', ),
    ];
  }
}