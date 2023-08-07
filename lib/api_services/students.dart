class student {
  String id;
  String username;
  String firstName;

  student({
    required this.id,
    required this.username,
    required this.firstName,
  });

  factory student.fromJson(Map<String, dynamic> json) {
    return student(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      firstName: json['firstName'] ?? '',
    );
  }
}


// class ProgramData {
//   String id;
//   String programName;
//   String deptName;

  

//   ProgramData({
//     required this.id,
//     required this.programName,
//     required this.deptName,
 
//   });

//   factory ProgramData.fromJson(Map<String, dynamic> json) {
//     return ProgramData(
//       id: json['id'] ?? '',
//       programName: json['programName'] ?? '',
//       deptName: json['deptName'] ?? '',
//     );
//   }
// }