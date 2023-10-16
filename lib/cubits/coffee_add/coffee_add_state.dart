part of 'coffee_add_cubit.dart';

class CoffeeAddState extends Equatable {
  final FormStatus status;
  final CoffeeModel coffeeModel;
  final CustomError error;

  factory CoffeeAddState.initial() {
    return CoffeeAddState(
        status: FormStatus.initial,
        coffeeModel: CoffeeModel(
          id: "",
          name: "",
          price: 0.0,
          picture: "",
          description: "",
        ),
        error: const CustomError());
  }

  const CoffeeAddState(
      {required this.status, required this.coffeeModel, required this.error});

  @override
  List<Object?> get props => [status, coffeeModel, error];

  @override
  bool get stringify => true;

  CoffeeAddState copyWith({
    FormStatus? status,
    CoffeeModel? coffeeModel,
    CustomError? error,
  }) {
    return CoffeeAddState(
      status: status ?? this.status,
      coffeeModel: coffeeModel ?? this.coffeeModel,
      error: error ?? this.error,
    );
  }
}
