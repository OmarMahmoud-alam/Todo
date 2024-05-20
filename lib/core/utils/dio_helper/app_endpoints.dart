abstract class EndPoints {
  //------------------------------------------------------------------------//

  static const String baseUrl = 'https://dummyjson.com/';

  //------------------------------------------------------------------------//

  //---------------------------Login---------------------------------------//
  static const String login = 'auth/login';
  static const String getuserdata = 'auth/me';
  static const String refreshtoken = 'auth/refresh';

  //------------------------------------------------------------------------//

  //---------------------------todo-----------------------------------------//

  static const String getTodoList = 'todos';
  static const String addTodoitem = 'todos/add';
  static const String updateTodoitem = 'todos';
  static const String deleteTodoitem = 'todos';
}
