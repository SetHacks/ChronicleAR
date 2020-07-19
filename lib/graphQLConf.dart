import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(uri: '134.209.168.108:3000/graphql');

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: InMemoryCache(),
    )
  );
}

