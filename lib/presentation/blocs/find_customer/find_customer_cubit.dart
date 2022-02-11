import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kycbscore/data/models/customer.dart';
import 'package:kycbscore/data/repository/main_repo.dart';

part 'find_customer_state.dart';

class FindCustomerCubit extends Cubit<FindCustomerState> {
  FindCustomerCubit() : super(FindCustomerInitial());

  Future<void> getCustomerData(Map query) async {
    emit(FindCustomerLoading());

    final response = await MainRepo.getCustomerData(query);
    if(response['status'] == "404"){
      emit(const FindCustomerError("NOT FOUND"));      
    } else if(response['status'] == "400"){
      emit(const FindCustomerError("Some Error"));
    } else{
      Customer customerData = Customer.fromMap(response);
      emit(FindCustomerLoaded(customerData));
    }  
  }
}
