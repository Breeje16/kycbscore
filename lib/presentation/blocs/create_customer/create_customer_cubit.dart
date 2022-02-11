import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kycbscore/data/repository/main_repo.dart';

part 'create_customer_state.dart';

class CreateCustomerCubit extends Cubit<CreateCustomerState> {
  CreateCustomerCubit() : super(CreateCustomerInitial());

  Future<void> createCustomer(Map query) async {
    emit(CreateCustomerLoading());

    final response = await MainRepo.createCustomer(query);
    if(response["success"] != "Customer created successfully"){
      emit(const CreateCustomerLoaded());
    } else {
      emit(const CreateCustomerError("Some Error"));
    }
    
  }
}
