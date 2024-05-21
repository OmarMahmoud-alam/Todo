import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/core/utils/route/magicroute.dart';
import 'package:todoapp/core/utils/storage/sql_helper.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custom_snackbar.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo.dart';
import 'package:todoapp/feature/home/data/repo/todo_list_repo.dart';

part 'fetch_todo_list_state.dart';

class FetchTodoListCubit extends Cubit<FetchTodoListState> {
  static FetchTodoListCubit of(context) => BlocProvider.of(context);

  FetchTodoListCubit() : super(FetchTodoListInitial());
  late List<Todo> todolist;

  int currentpage = 1;
  late int totalitem ;
  bool islastpage = false;
  bool isgettingmoreblog = false;
  final ScrollController scrollController = ScrollController();
  @override
  Future<void> close() {
    // TODO: implement close
    scrollController.removeListener(onscroll);
    return super.close();
  }

  void resetdata() {
    islastpage = false;
    isgettingmoreblog = false;
    currentpage = 1;
    todolist = [];
  }

  void loaddata(BuildContext context) async {
    emit(FetchTodoListInitial());
    final res = await TodoFetchRepo.fetchtodos();
    res.fold(
      (err) {
        showErrorSnackBar(context, err);
        emit(FetchTodoListFail());
      },
      (res) async {
        todolist = res.todos!;
        totalitem = res.total!;
        print("bloglist${todolist.length}");
        listener();
        emit(FetchTodoListSucess());
      },
    );
  }

  Future<void> loadmoredata(BuildContext context) async {
    if (islastpage || isgettingmoreblog) {
      return;
    }
    emit(FetchTodoListLoadingMore());

    isgettingmoreblog = true;
    currentpage++;
    final res = await TodoFetchRepo.fetchtodos(pagenumber: currentpage);
    res.fold(
      (err) {
        isgettingmoreblog = false;
        currentpage--;
        showErrorSnackBar(context, err);
        emit(FetchTodoListFailMore());
      },
      (res) async {
        isgettingmoreblog = false;
        islastpage = (totalitem <= (currentpage * 10));

        todolist.addAll(res.todos!);
        emit(FetchTodoListSucess());
      },
    );
  }

  void listener() {
    scrollController.addListener(onscroll);
  }

  void onscroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent - 120) {
      // Scroll has reached the end
      print('Scroll reached the end!');
      // Perform your desired action here
      loadmoredata(MagicRouter.currentContext!);
    }
  }
}
