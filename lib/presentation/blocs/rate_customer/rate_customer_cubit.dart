import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kycbscore/data/repository/main_repo.dart';

part 'rate_customer_state.dart';

class RateCustomerCubit extends Cubit<RateCustomerState> {
  RateCustomerCubit() : super(RateCustomerInitial());

  Future<void> postCustomerData(Map data) async {
    emit(RateCustomerLoading());

    final response = await MainRepo.addRatingData(data);

    emit(RateCustomerLoaded(response));
  }
}
