abstract class UseCase<Type> {
  Future<List<Type>> call();
}
