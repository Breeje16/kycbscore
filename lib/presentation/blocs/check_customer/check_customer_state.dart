part of 'check_customer_cubit.dart';

abstract class CheckCustomerState extends Equatable {
  const CheckCustomerState();

  @override
  List<Object> get props => [];
}

class CheckCustomerInitial extends CheckCustomerState {}

class CheckCustomerLoaded extends CheckCustomerState {
  final Customer customer;
  const CheckCustomerLoaded(this.customer);

  @override
  List<Object> get props => [customer];
}

class CheckCustomerLoading extends CheckCustomerState {}

class CheckCustomerError extends CheckCustomerState {
  final String messege;

  const CheckCustomerError(this.messege);

  @override
  List<Object> get props => [messege];
}
