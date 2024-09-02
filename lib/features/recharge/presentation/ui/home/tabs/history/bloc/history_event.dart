part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class GetRechargeHistoryEvent extends HistoryEvent{

  GetRechargeHistoryEvent();
}