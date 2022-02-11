part of 'find_customer_cubit.dart';

abstract class FindCustomerState extends Equatable {
  const FindCustomerState();

  @override
  List<Object> get props => [];
}

class FindCustomerInitial extends FindCustomerState {}

class FindCustomerLoaded extends FindCustomerState {
  final Customer customer;
  const FindCustomerLoaded(this.customer);

  @override
  List<Object> get props => [customer];
}

class FindCustomerLoading extends FindCustomerState {}

class FindCustomerError extends FindCustomerState {
  final String messege;

  const FindCustomerError(this.messege);

  @override
  List<Object> get props => [messege];
}