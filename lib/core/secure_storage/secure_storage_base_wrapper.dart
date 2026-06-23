abstract interface class SecureStorageBase<T> {
  Future<T> get();
  Future<void> set(T data);
  Future<void> delete();
}
