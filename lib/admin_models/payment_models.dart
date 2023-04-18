import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  String uuid;
  int recievedPayment;
  String studentname;
  int remainingPayment;

  final dateTime;
  int fees;

  PaymentModel({
    required this.uuid,
    required this.remainingPayment,
    required this.recievedPayment,
    required this.studentname,
    required this.fees,
    required this.dateTime,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'fees': fees,
        'dateTime': dateTime,
        'recievedPayment': recievedPayment,
        'remainingPayment ': remainingPayment,
        'studentname': studentname
      };

  ///
  static PaymentModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return PaymentModel(
      remainingPayment: snapshot['remainingPayment '],
      studentname: snapshot['studentname'],
      uuid: snapshot['uuid'],
      dateTime: snapshot['dateTime'],
      fees: snapshot['fees'],
      recievedPayment: snapshot['recievedPayment'],
    );
  }
}
