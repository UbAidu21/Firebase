class UserModel {
  
  String? fname;
  String? name;
  String? registrationNo;
  String? department;
  String? semester;
  String? email;
  String? password;
  String? contact;

  UserModel({
    required this.fname,
    required this.registrationNo,
    required this.department,
    required this.semester,
    required this.email,
    required this.contact,
    required this.password,
    
  });

  Map<String, dynamic> toMap(){
    return {
      'Name': fname,      
      'Registration No': registrationNo,
      'Department': department,      
      'Semester' : semester,
      'Email': email,
      'Contact': contact,
      'Password': password
    };
  }
}
