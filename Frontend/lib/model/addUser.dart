class User {
  int id;
  String name;
  String fname;
  String lname;
  String pass;
  String email;
  String gender;
  bool driverMode;
  int balance;
  String apiKey;
  User(
      {this.id,
      this.name,
      this.email,
      this.pass,
      this.gender,
      this.fname,
      this.lname,
      this.driverMode,
      this.apiKey});
  factory User.fromJson(Map<String, dynamic> user) => User(
      id: user['user_id'],
      name: user['username'],
      fname: user['firstname'],
      lname: user['lastname'],
      pass: user['password'],
      email: user['emailadress'],
      gender: user['gender'],
      driverMode: user['driver_mode'],
      apiKey: user['api_key']);
      
  void setBalnce(int _balance) {
    balance = _balance;
  }
}
