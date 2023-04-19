import 'package:cloud_firestore/cloud_firestore.dart';

class ClassModels {
  String teacherUid;
  String studentName;
  String studentClass;
  String studentSubject;
  String teacher_name;
  String uuid;

  final dateTime;

  ClassModels({
    required this.teacherUid,
    required this.studentName,
    required this.studentClass,
    required this.dateTime,
    required this.studentSubject,
    required this.uuid,
    required this.teacher_name,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'teacherUid': teacherUid,
        'studentClass': studentClass,
        'uuid': uuid,
        'studentName': studentName,
        'studentSubject': studentSubject,
        'teacher_name': teacher_name,
        'dateTime': DateTime.now().millisecondsSinceEpoch.toString(),
      };

  ///
  static ClassModels fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ClassModels(
      studentSubject: snapshot['studentSubject'],
      teacherUid: snapshot['teacherUid'],
      studentClass: snapshot['studentClass'],
      teacher_name: snapshot['teacher_name'],
      studentName: snapshot['studentName'],
      uuid: snapshot['uuid'],
      dateTime: snapshot['dateTime'],
    );
  }
}
