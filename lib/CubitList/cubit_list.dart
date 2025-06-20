import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_state.dart';

class ListCubit extends Cubit<ListState>{
  ListCubit() : super(ListState(mList: []));

  /// event work
  addMap(Map<String,dynamic>map){
    List<Map<String,dynamic>> currentStateValue=state.mList;
    currentStateValue.add(map);
    emit(ListState(mList: currentStateValue));
  }

  updateMap(Map<String,dynamic>updateMap,int index){
    List<Map<String,dynamic>> currentStateValue=state.mList;
    currentStateValue[index]=updateMap;
    emit(ListState(mList: currentStateValue));
  }

  deleteMap(int index){
    List<Map<String,dynamic>> currentStateValue=state.mList;
    currentStateValue.removeAt(index);
    emit(ListState(mList: currentStateValue));
  }
}