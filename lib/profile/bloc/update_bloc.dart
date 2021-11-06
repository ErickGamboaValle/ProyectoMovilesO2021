import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial()) {
    on<UploadImage>(
      (event, emit) async {
        emit(LoadingUpdate());
        bool updated = await _saveImage(event.data, event.img);
        emit(
          updated
              ? UpdatedState()
              : ErrorUpdate(errorMsg: "Error al cargar la imagen"),
        );
      },
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  //guardar en firebase/firestore
  Future<bool> _saveImage(
    Map<String, dynamic> data,
    File? img,
  ) async {
    try {
      //subir la imagen a bucket
      if (img != null) {
        //subir img a bucket
        String _imgURL = await _uploadFile(img);
        if (_imgURL.isNotEmpty) data["picture"] = _imgURL;
      }
      //await FirebaseFirestore.instance.collection("UserProfile").add(data);
      await FirebaseFirestore.instance
          .collection("UserProfile")
          .doc("${auth.currentUser!.uid}")
          .update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> _uploadFile(File? selectedPicture) async {
    try {
      var stamp = DateTime.now();
      if (selectedPicture == null) {
        return "";
      }
      UploadTask task = FirebaseStorage.instance
          .ref("UserImages/imagen_${stamp}.png")
          .putFile(selectedPicture);
      await task;
      return await task.storage
          .ref("UserImages/imagen_${stamp}.png")
          .getDownloadURL();
    } catch (e) {
      print(e.toString());
      return "";
    }
  }
}
