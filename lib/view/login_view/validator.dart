String? validatorPassword(value) {
  if (value == null || value.isEmpty) {
    return 'Bu alan boş geçilemez';
  }
  return null;
}

String? validatorUsername(value) {
  if (value == null || value.isEmpty) {
    return 'Bu alan boş geçilemez';
  }
  return null;
}
