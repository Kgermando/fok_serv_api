bool checkCorrectPassword(String password) {
  if (password.length < 5) {
    return false;
  }
  if (int.tryParse(password) != null) {
    return false;
  }
  if (password.contains(' ')) {
    return false;
  }
  if (["passwordHash", "qwerty"].contains(password)) {
    return false;
  }
  if (int.tryParse(password) != null) {
    return false;
  }

  return true;
}
