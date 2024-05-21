part of 'fetch_todo_list_cubit.dart';

@immutable
sealed class FetchTodoListState {}

final class FetchTodoListInitial extends FetchTodoListState {}

final class FetchTodoListLoading extends FetchTodoListState {}

final class FetchTodoListSucess extends FetchTodoListState {}

final class FetchTodoListFail extends FetchTodoListState {}

final class FetchTodoListLoadingMore extends FetchTodoListState {}
final class FetchTodoListFailMore extends FetchTodoListState {}

