enum AsyncValueState{
  loading,
  error,
  success,
}

class Asyncvalue<T>  {
  final T? data;
  final Object? error;
  final AsyncValueState state;
  const Asyncvalue({ this.data, this.error, required this.state});
  
  factory Asyncvalue.loading() {
    return const Asyncvalue(state: AsyncValueState.loading);
  }
  factory Asyncvalue.error(Object error) {
    return Asyncvalue(error: error, state: AsyncValueState.error);
  }
  factory Asyncvalue.success(T data) {
    return Asyncvalue(data: data, state: AsyncValueState.success);
  }
}

  
