class Course {
  String name;

  Course({this.name});

  factory Course.fromJson(Map<String, dynamic> json) => new Course(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };

  @override
  String toString() => 'name: $name';
}
