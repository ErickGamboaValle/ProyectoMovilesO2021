import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _cFirestore = FirebaseFirestore.instance;

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(_onRequestData);
  }

  // on data request
  void _onRequestData(HomeEvent event, Emitter emitState) async {
    emitState(LoadingState());
    var examList = await _getExams();
    if (examList == null)
      emitState(NoDataState());
    else
      emitState(ExistingDataState(examsList: examList));
  }

  Future<List<Map<String, dynamic>>?> _getExams() async {
    try {
      var exams = await _cFirestore.collection("examsHome").get();
      return exams.docs
          .map(
            (examDocument) =>
                {"image": examDocument["image"], "name": examDocument["name"]},
          )
          .toList(); 
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
