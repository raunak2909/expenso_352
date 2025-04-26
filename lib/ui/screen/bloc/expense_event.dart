import '../../../data/model/expense_model.dart';

abstract class ExpenseEvent{}

class AddExpenseEvent extends ExpenseEvent{
  ExpenseModel newExp;
  AddExpenseEvent({required this.newExp});
}

class GetInitialExpenseEvent extends ExpenseEvent{
  int type;
  GetInitialExpenseEvent({this.type=1});

}