import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kycbscore/data/models/customer.dart';
import 'package:kycbscore/data/repository/main_repo.dart';

part 'check_customer_state.dart';

class CheckCustomerCubit extends Cubit<CheckCustomerState> {
  CheckCustomerCubit() : super(CheckCustomerInitial());

  Future<void> getCustomerData(Map query) async {
    emit(CheckCustomerLoading());

    final response = await MainRepo.getCustomerData(query);
    if(response['status'] == "404"){
      emit(const CheckCustomerError("NOT FOUND"));      
    } else if(response['status'] == "400"){
      emit(const CheckCustomerError("Some Error"));
    } else{
      Customer customerData = Customer.fromMap(response);
      emit(CheckCustomerLoaded(customerData));
    }
    
  }
}
