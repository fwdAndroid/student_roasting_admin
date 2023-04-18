import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_roasting_admin/admin_models/student_model.dart';
import 'package:student_roasting_admin/admin_models/teacher_models.dart';

import 'package:uuid/uuid.dart';

class DatabaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //UUuid mean FIreabase AuthID
  //bussiness Manager
  Future<String> addTeachers({
    required String teachername,
    required String teacheremail,
    required String teacherpassword,
    required String teacherqualification,
    required String teachersubjects,
    required String assignedclass,
    required String cpassword,
    required final time,
    required bool blocked,
  }) async {
    String res = 'Some error occured';

    try {
      if (teacheremail.isNotEmpty || teacherpassword.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: teacheremail, password: teacherpassword);
        //Add User to the database with modal

        TeacherModels userModel = TeacherModels(
          teacher_name: teachername,
          teacher_class: teachername,
          teacher_qualification: teacherqualification,
          teacher_subjects: teachersubjects,
          dateTime: time,
          confrim_password: cpassword,
          uuid: cred.user!.uid,
          email: teacheremail,
          password: teacherpassword,
          blocked: blocked,
        );
        await firebaseFirestore
            .collection('teachers')
            .doc(cred.user!.uid)
            .set(userModel.toJson());

        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //add Studntds
  Future<String> addStudents(
      {required String parentemail,
      required String parentmobile,
      required String parentname,
      required String studentclass,
      required String studentStatus,
      required String studentname,
      required int fees,
      required String addressStudent,
      required final dateTime,
      required String subject}) async {
    String res = 'Some error occured';

    try {
      //Add User to the database with modal

      try {
        //Add User to the database with modal
        String postId = Uuid().v1();

        StudentModel userModel = StudentModel(
            subject: subject,
            dateTime: dateTime,
            addressStudent: addressStudent,
            fees: fees,
            studentStatus: studentStatus,
            studentname: studentname,
            parentemail: parentemail,
            parentmobile: parentmobile,
            uuid: postId,
            parentname: parentname,
            studentclass: studentclass);
        await FirebaseFirestore.instance
            .collection('students')
            .doc(postId)
            .set(userModel.toJson());

        res = 'success';
      } catch (e) {
        res = e.toString();
      }
      return res;
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Add Product
  // Future<String> addProduct({
  //   required String dimension,
  //   required String uuid,
  //   required String productname,
  //   required String pcs,
  //   required String rate,
  // }) async {
  //   String res = 'Some error occured';

  //   try {
  //     //Add User to the database with modal
  //     String postId = Uuid().v1();

  //     ProductModels userModel = ProductModels(
  //         productname: productname,
  //         pcs: pcs,
  //         uuid: postId,
  //         dimensions: dimension,
  //         rate: rate);
  //     await FirebaseFirestore.instance
  //         .collection('products')
  //         .doc(postId)
  //         .set(userModel.toJson());

  //     res = 'success';
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   return res;
  // }
}
