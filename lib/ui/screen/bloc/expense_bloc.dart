import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenso/data/local/db_helper.dart';
import 'package:xpenso/data/model/expense_model.dart';
import 'package:xpenso/data/model/filter_expense_model.dart';

import '../../../data/model/cat_model.dart';
import '../../../domain/app_constants.dart';
import 'expense_event.dart';
import 'expense_state.dart';

void updateBalanceInPrefs(num balance) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble("bal", balance.toDouble());
}


class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  DbHelper dbHelper;

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      bool check = await dbHelper.addExpense(newExp: event.newExp);

      if (check) {
        List<ExpenseModel> allExp = await dbHelper.fetchAllExpense();
        ///filter acc to type
        List<FilterExpenseModel> allFilteredExpenses = AppConstants.filterExpenseByType(allExpenses: allExp, type: 1);

        updateBalanceInPrefs(allExp.last.bal);
        emit(ExpenseLoadedState(allExpense: allFilteredExpenses));

      } else {
        emit(ExpenseErrorState(errorMsg: "Something went wrong"));
      }
    });

    on<GetInitialExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());
      List<ExpenseModel> allExp = await dbHelper.fetchAllExpense();

      ///add filter here
      List<FilterExpenseModel> allFilteredExpenses = AppConstants.filterExpenseByType(allExpenses: allExp, type: event.type);
      updateBalanceInPrefs(allExp.last.bal);
      emit(ExpenseLoadedState(allExpense: allFilteredExpenses));
    });




  }
}
