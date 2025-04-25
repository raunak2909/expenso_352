import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpenso/data/local/db_helper.dart';
import 'package:xpenso/data/model/expense_model.dart';

import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  DbHelper dbHelper;

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      bool check = await dbHelper.addExpense(newExp: event.newExp);

      if (check) {
        List<ExpenseModel> allExp = await dbHelper.fetchAllExpense();
        emit(ExpenseLoadedState(allExpense: allExp));
      } else {
        emit(ExpenseErrorState(errorMsg: "Something went wrong"));
      }
    });

    on<GetInitialExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());
      List<ExpenseModel> allExp = await dbHelper.fetchAllExpense();
      emit(ExpenseLoadedState(allExpense: allExp));
    });
  }
}
