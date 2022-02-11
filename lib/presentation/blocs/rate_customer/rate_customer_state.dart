part of 'rate_customer_cubit.dart';

abstract class RateCustomerState extends Equatable {
  const RateCustomerState();

  @override
  List<Object> get props => [];
}

class RateCustomerInitial extends RateCustomerState {}

class RateCustomerLoaded extends RateCustomerState {
  final Map customer;
  const RateCustomerLoaded(this.customer);

  @override
  List<Object> get props => [customer];
}

class RateCustomerLoading extends RateCustomerState {}

class RateCustomerError extends RateCustomerState {
  final String messege;

  const RateCustomerError(this.messege);

  @override
  List<Object> get props => [messege];
}