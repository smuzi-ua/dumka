abstract class GenericType<T> {
  T fromJson(Map<String, dynamic> json);

  List<T> listFromJson(List<dynamic> listOfJson) =>
      listOfJson.map((item) => fromJson(item as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson();
}