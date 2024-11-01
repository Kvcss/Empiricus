import 'dart:async';
import 'package:empiricus_app/repositories/entities/list_entity.dart';
import 'package:empiricus_app/repositories/list_repository.dart';

abstract class IHomeBloc {
  Stream<ListEntity> get listStream;
  Future<void> getList();
}

class HomeBloc implements IHomeBloc {
  final IListRepository _listRepository;
  final StreamController<ListEntity> _listController = StreamController<ListEntity>.broadcast();

  HomeBloc(this._listRepository);

  @override
  Stream<ListEntity> get listStream => _listController.stream;

  @override
  Future<void> getList() async {
    try {
      ListEntity listData = await _listRepository.getList();
      _listController.sink.add(listData);
    } catch (e) {
      _listController.sink.addError('Falha ao carregar a lista de grupos');
    }
  }

  void dispose() {
    _listController.close();
  }
}
