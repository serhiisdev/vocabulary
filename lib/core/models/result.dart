/// Basic result class with only [Ok] or [Err] states.
/// Utility class to wrap result data.
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Err(): {
///     print(result.error);
///   }
/// }
/// ```
sealed class Result<T> {
  const Result();

  /// Creates a successful [BResult], completed with the specified [value].
  const factory Result.ok(T value) = Ok<T>;

  /// Creates an error [BResult], completed with the specified [error].
  factory Result.error(Exception error) = Err<T>;
}

/// Subclass of BResult for values
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Subclass of BResult for errors
final class Err<T> extends Result<T> {
  Err(this.error);

  /// Returned error in result
  final Object error;

  @override
  String toString() => 'Result<$T>.error($error)';
}

extension ResultExt<T> on Result<T> {
  bool isOk() => this is Ok;
  bool isErr() => this is Err;

  Ok<T> asOk() => this as Ok<T>;
  Err<T> asErr() => this as Err<T>;

  T unwrap() => asOk().value;
  T? unwrapOrNull() => isOk() ? unwrap() : null;
  Object unwrapError() => asErr().error;
}