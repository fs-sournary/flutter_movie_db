abstract class AsyncUseCase<P, R> {
  Future<R> call(P params);
}
