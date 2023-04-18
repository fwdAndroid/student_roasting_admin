import 'package:cloud_firestore/cloud_firestore.dart';

class DateSheetModels {
  String uuid;
  String className;
  String date;
  String studentname;
  final day;
  String subject;
  final dateTime;

  DateSheetModels(
      {required this.uuid,
      required this.className,
      required this.day,
      required this.date,
      required this.studentname,
      required this.dateTime,
      required this.subject});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'subject': subject,
        'dateTime': dateTime,
        'date': date,
        'className': className,
        'day': day,
        'studentname': studentname
      };

  ///
  static DateSheetModels fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return DateSheetModels(
      day: snapshot['day'],
      studentname: snapshot['studentname'],
      uuid: snapshot['uuid'],
      dateTime: snapshot['dateTime'],
      subject: snapshot['subject'],
      date: snapshot['date'],
      className: snapshot['className'],
    );
  }
}
