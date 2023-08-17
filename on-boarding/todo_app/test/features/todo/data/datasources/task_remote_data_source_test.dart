import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:todo_app/features/todo/data/datasources/task_remote_data_source.dart';

import 'task_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){

    TaskRemoteDataSourceImpl dataSource;
    MockClient mockClient;

    setUp((){
      mockClient = MockClient();
      dataSource = TaskRemoteDataSourceImpl(client: mockClient);
    });


}