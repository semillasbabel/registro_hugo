// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class Students {
  int id = 0;
  String name;
  int edad;
  String hobbie;
  String nacimiento;

  Students({
    this.id = 0,
    required this.name,
    required this.edad,
    required this.hobbie,
    required this.nacimiento,
  });
}
