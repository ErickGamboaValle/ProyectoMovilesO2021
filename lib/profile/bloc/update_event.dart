part of 'update_bloc.dart';

abstract class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends UpdateEvent {
  final File? img;
  final Map<String, dynamic> data;

  UploadImage({required this.img, required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
