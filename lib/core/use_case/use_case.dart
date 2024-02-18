abstract interface class UseCase<Type> {
  Future<List<Type>> call();
}
