import 'dart:io';
List<Person> ListOfPersons = [];


abstract class Person{
  static int _counter = 1;
  final int id;
  late String name;
  late String department;
  

  

  Person({required this.id, required this.name, required this.department});
  //Student.Guest() : this.id = 0, this.name = 'Unknown', this.department = 'Unknown', this.level = 1, this._gpa = 0;

  void printDetail();

  static int generateID(){
    return _counter++;
  }

  bool hasID(int personID)
  {
    return this.id == personID;
  }
}


class Student extends Person
{
  late int level;
  late double _gpa;

  double get gpa => _gpa;

  set setGpa(double studentGPA){
    if(studentGPA >= 0 && studentGPA <= 100)
    {
      _gpa = studentGPA;
    }else{
      throw ('GPA must be between 0 and 100');
    }
  }
  //late double studentGPA;

  Student({required super.id, 
           required super.name, 
           required super.department, 
           required this.level, 
           required double studentGPA}){
            this.setGpa = studentGPA;
           }
  

  Student.Guest() :this.level = 1, this._gpa = 0, super(id: 0, name: 'Unknown', department: 'Unknown');

  @override
  void printDetail() {
    print('Student ID: ${super.id} | Name: ${super.name} | Department: ${super.department} | Level: ${this.level} | GPA: ${this._gpa}');
  }
}


class Doctors extends Person
{
  late int salary;

  Doctors({required super.id, required super.name, required super.department, required this.salary});

  @override
  void printDetail() {
    print('Doctor ID: ${super.id} | Name: ${super.name} | Department: ${super.department} | Salary: ${this.salary}');

  }
}

void main(){
  String appName = "Student Management";
  print(appName);
  
  bool work = true;
  while(work){
    showMessage();
  String? number = stdin.readLineSync();
  switch(number){
    case "1" :
    addStudent();
    break;
    case "2":
    removePerson();
    break;
    case "3":
    showPerson();
    break;
    case "4":
    findPerson();
    break;
    case "5" :
    addGuestStudent();
    break;
    case "6":
    addDoctor();
    break;
    case "7" :
    work = false;
    break;
    default:
    print("Invalid Number");
    break;
  }

  }
  
}

void showMessage()
{
  print("Enter 1 to Add Student");
  print("Enter 2 to Remove Student");
  print("Enter 3 to Show Students");
  print("Enter 4 to Find Student");
  print("Enter 5 Add Guest Student");
  print("Enter 6 to Add Doctor");
  print("Enter 7 to Stop The System");
  stdout.write("Choose Number: ");
}

void addStudent(){
  stdout.write("Enter Name:");
  String fullName = stdin.readLineSync() ?? "";

  stdout.write("Enter Level:");
  int? level = int.tryParse(stdin.readLineSync() ?? "")?? 1;

  stdout.write("Enter Department:");
  String department = stdin.readLineSync() ?? "";

  stdout.write("Enter GPA:");
  double? gpa = double.tryParse(stdin.readLineSync() ?? "")?? 0.0;


  //Person student = Student(id: Person.generateID(), name: fullName, department: department, level: level, gpa: gpa);
  //Student student = Student(id: Person.generateID(), name: fullName, department: department, level: level, gpa: gpa);

  try{
  ListOfPersons.add(
    Student(
      id: Person.generateID(), 
      name: fullName, 
      department: department, 
      level: level, 
      studentGPA: gpa));

  print("Student Add Successful");
  }catch(e){
    print(e);
  }

}

void removePerson()
{
  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");

  if(id == null)
  {
    print("invalid");
    return;
  }

  ListOfPersons.removeWhere((person)=>person.hasID(id));
  print("Remove Done");
}

void addDoctor()
{
  stdout.write("Enter Name:");
  String fullName = stdin.readLineSync() ?? "";

  stdout.write("Enter Department:");
  String department = stdin.readLineSync() ?? "";

  stdout.write("Enter Salary:");
  int? salary = int.tryParse(stdin.readLineSync() ?? "")?? 1;


  ListOfPersons.add(
    Doctors(
      id: Person.generateID(), 
      name: fullName, 
      department: department, 
      salary: salary, 
      ));

  print("Doctor Add Successful");

}

void addGuestStudent(){
  ListOfPersons.add(Student.Guest());
  print('Guest Student Add Successful');
}

void showPerson()
{
  if(ListOfPersons.isEmpty){
    print("The List is Empty");
    return;
  }

  for(Person student in ListOfPersons){
    student.printDetail();
  }
}

void findPerson()
{
  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");

  if(id == null)
  {
    print("invalid");
    return;
  }

  for(Person student in ListOfPersons)
  {
    if(student.hasID(id))
    {
      student.printDetail();
      return;
    }
  }
  print("Student Is Not Found");
}