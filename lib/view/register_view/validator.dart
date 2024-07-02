String? validatorRegister(value) {
  if (value == null || value.isEmpty) {
    return 'Bu alan boş geçilemez';
  }
  return null;
}

String? validatorPassword(String? value, String? value2) {
  if (value != value2) {
    return 'Şifreler uyumsuz kontrol ediniz.';
  }
  return null;
}
