class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  Map<String, dynamic> toJson() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  @override
  String toString() {
    return 'Company{name: $name, catchPhrase: $catchPhrase, bs: $bs}';
  }

  Company copyWith({String? name, String? catchPhrase, String? bs}) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Company &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          catchPhrase == other.catchPhrase &&
          bs == other.bs;

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
}
