import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final _cFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  SummaryBloc() : super(SummaryInitial()) {
    on<SummaryEvent>(_onRequestData);
  }

  // on data request
  void _onRequestData(SummaryEvent event, Emitter emitState) async {
    emitState(LoadingState());
    var gradeList = await _getExams();
    if (gradeList == null)
      emitState(NoDataState());
    else
      emitState(ExistingDataState(gradresList: gradeList));
  }

  Future<Map<String, dynamic>?> _getExams() async {
    try {
      var grades = await _cFirestore
          .collection("UserProfile")
          .doc("${auth.currentUser!.uid}")
          .get();
      return grades.get("Grades");
      /*var exams = await _cFirestore.collection("UserProfile").get();
      return exams.docs
          .map(
            (examDocument) =>
                {"image": examDocument["image"], "name": examDocument["name"]},
          )
          .toList(); */
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
