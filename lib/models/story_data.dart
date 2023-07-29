import 'package:meta/meta.dart';


//immutable means that, you can not change the object, ones object created - object can not be changed
@immutable
class StoryData {
  const StoryData({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}
