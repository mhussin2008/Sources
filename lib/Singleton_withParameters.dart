import 'dart:convert';

class Person {
  // final fields
  final String name;

  // private constructor
  Person._internal(this.name);

  // static _cache field
  static final Map<String, Person> _cache = <String, Person>{};

  // factory constructor
  factory Person(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final person = Person._internal(name);
      _cache[name] = person;
      return person;
    }
  }


  factory Person.fromJson(String json){
    final decodedJson= jsonDecode(json);

    return Person(decodedJson['name']);
  }
  //get Cashes=>_cache as Map<String,Person>;

}

void main() {
  final person1 = Person('John');
  final person2 = Person('Harry');
  final person3 = Person('John');
  final person4=Person.fromJson('''{"name":"ahmed"}''');
  final person5 = Person('ahmed');

  // hashcode of person1 and person3 are same
  print("Person1 name is : ${person1.name} with hashcode ${person1.hashCode}");
  print("Person2 name is : ${person2.name} with hashcode ${person2.hashCode}");
  print("Person3 name is : ${person3.name} with hashcode ${person3.hashCode}");
  print("Person4 name is : ${person4.name} with hashcode ${person4.hashCode}");
  print("Person5 name is : ${person5.name} with hashcode ${person5.hashCode}");
  //person1.Cashes.





}