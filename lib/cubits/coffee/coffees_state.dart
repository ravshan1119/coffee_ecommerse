part of 'coffees_cubit.dart';

class CoffeeState extends Equatable {
  final FormStatus status;
  final List<CoffeeModel> coffeeModel;
  final CustomError error;

  factory CoffeeState.initial() {
    return const CoffeeState(
        status: FormStatus.initial, coffeeModel: [], error: CustomError());
  }

  const CoffeeState(
      {required this.status, required this.coffeeModel, required this.error});
  @override
  List<Object?> get props => [status, coffeeModel, error];

  @override
  bool get stringify => true;

  CoffeeState copyWith({
    FormStatus? status,
    List<CoffeeModel>? coffeeModel,
    CustomError? error,
  }) {
    return CoffeeState(
      status: status ?? this.status,
      coffeeModel: coffeeModel ?? this.coffeeModel,
      error: error ?? this.error,
    );
  }
}
