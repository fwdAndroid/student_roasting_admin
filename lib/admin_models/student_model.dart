import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String uuid;
  String parentname;
  String parentmobile;
  String studentname;
  String parentemail;
  String studentclass;
  String subject;
  final dateTime;
  String addressStudent;
  int fees;
  String studentStatus;

  StudentModel(
      {required this.uuid,
      required this.parentname,
      required this.parentemail,
      required this.parentmobile,
      required this.studentname,
      required this.addressStudent,
      required this.fees,
      required this.studentclass,
      required this.dateTime,
      required this.studentStatus,
      required this.subject});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'subject': subject,
        'fees': fees,
        'dateTime': dateTime,
        'addressStudent': addressStudent,
        'parentmobile': parentmobile,
        'studentclass': studentclass,
        'parentname': parentname,
        'parentemail': parentemail,
        'studentStatus': studentStatus,
        'studentname': studentname
      };

  ///
  static StudentModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return StudentModel(
        parentemail: snapshot['parentemail'],
        studentclass: snapshot['studentclass'],
        studentname: snapshot['studentname'],
        uuid: snapshot['uuid'],
        dateTime: snapshot['dateTime'],
        fees: snapshot['fees'],
        subject: snapshot['subject'],
        parentmobile: snapshot['parentmobile'],
        parentname: snapshot['parentname'],
        addressStudent: snapshot['addressStudent'],
        studentStatus: snapshot['studentStatus']);
  }
}
