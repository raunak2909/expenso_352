import 'package:xpenso/data/model/expense_model.dart';
import 'package:xpenso/data/model/filter_expense_model.dart';

abstract class ExpenseState{}

class ExpenseInitialState extends ExpenseState{}
class ExpenseLoadingState extends ExpenseState{}
class ExpenseLoadedState extends ExpenseState{
  List<FilterExpenseModel> allExpense;
  ExpenseLoadedState({required this.allExpense});
}
class ExpenseErrorState extends ExpenseState{
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}