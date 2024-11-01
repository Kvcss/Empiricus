import 'package:dio/dio.dart';
import 'package:empiricus_app/repositories/entities/list_entity.dart';


abstract class IListRepository {
  Future<ListEntity> getList();
}

class ListRepository implements IListRepository {
  @override
  Future<ListEntity> getList() async {
    var dio = Dio();

    try {
      Response response = await dio.get(
        'https://empiricus-app.empiricus.com.br/mock/list.json',
      );

      if (response.statusCode == 200) {
        return ListEntity.fromJson(response.data);
      } else {
        throw Exception('Falha ao carregar a lista de grupos');
      }
    } catch (e) {
      throw Exception('Erro ao carregar a lista de grupos: $e');
    }
  }
}
