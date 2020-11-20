class User {
  int id;
  String name;
  String fname;
  String lname;
  String pass;
  String email;
  String gender;
  User(
      {this.id,
      this.name,
      this.email,
      this.pass,
      this.gender,
      this.fname,
      this.lname});
  factory User.fromJson(Map<String, dynamic> user) => User(
      //id: user['id'],
      name: user['username'],
      fname: user['firstname'],
      lname: user['lastname'],
      pass: user['password'],
      email: user['emailadress'],
      gender: user['gender']);
}
