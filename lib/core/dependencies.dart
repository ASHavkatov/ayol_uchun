import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'client.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient(),),
 ];
