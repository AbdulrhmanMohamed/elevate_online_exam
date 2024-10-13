sealed class Result<T>{}
class Success<T> implements Result<T>{
  T?data;
  Success(this.data);

}
class Fail<T> implements Result<T>{
  String ? exception;
  Fail(this.exception);
}