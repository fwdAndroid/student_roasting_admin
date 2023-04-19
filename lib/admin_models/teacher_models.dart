import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherModels {
  String uuid;
  String password;
  String email;
  String confrim_password;
  String teacher_qualification;
  String teacher_name;
  String teacher_subjects;
  String teacher_class;
  final dateTime;
  String teacherType;

  TeacherModels({
    required this.uuid,
    required this.teacherType,
    required this.password,
    required this.teacher_qualification,
    required this.email,
    required this.dateTime,
    required this.confrim_password,
    required this.teacher_name,
    required this.teacher_subjects,
    required this.teacher_class,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        "teacher_class": teacher_class,
        'uuid': uuid,
        'teacherType': teacherType,
        'email': email,
        'password': password,
        'teacher_qualification': teacher_qualification,
        'confrim_password': confrim_password,
        'teacher_subjects': teacher_subjects,
        'teacher_name': teacher_name,
        'dateTime': DateTime.now().millisecondsSinceEpoch.toString(),
      };

  ///
  static TeacherModels fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return TeacherModels(
        teacher_qualification: snapshot['teacher_qualification'],
        teacher_class: snapshot['teacher_class'],
        confrim_password: snapshot['confrim_password'],
        uuid: snapshot['uuid'],
        email: snapshot['email'],
        teacher_subjects: snapshot['teacher_subjects'],
        teacher_name: snapshot['teacher_name'],
        password: snapshot['password'],
        dateTime: snapshot['dateTime'],
        teacherType: snapshot['teacherType']);
  }
}
