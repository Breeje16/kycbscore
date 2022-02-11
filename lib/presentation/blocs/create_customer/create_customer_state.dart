part of 'create_customer_cubit.dart';

abstract class CreateCustomerState extends Equatable {
  const CreateCustomerState();

  @override
  List<Object> get props => [];
}

class CreateCustomerInitial extends CreateCustomerState {}

class CreateCustomerLoaded extends CreateCustomerState {
  const CreateCustomerLoaded();

  @override
  List<Object> get props => [];
}

class CreateCustomerLoading extends CreateCustomerState {}

class CreateCustomerError extends CreateCustomerState {
  final String messege;

  const CreateCustomerError(this.messege);

  @override
  List<Object> get props => [messege];
}