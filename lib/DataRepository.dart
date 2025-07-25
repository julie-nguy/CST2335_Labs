class DataRepository {
  static String login = "";

  static String loadData() {
    return login;
  }

  static void saveData(String info) {
    login = info;
  }
}