class Workers {

  final int id;
  final String name;
  final String phoneNo;


  const Workers({required this.id, required this.name, required this.phoneNo});

  factory Workers.fromJson(Map<String,dynamic> json){
    return Workers(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNo: json['phoneNo'] as String,
    );
  }
}
