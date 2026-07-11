import 'dart:io';
List<Map<String, dynamic>> students = [];

int counter = 1;
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
    removeStudent();
    break;
    case "3":
    showStudents();
    break;
    case "4":
    findStudent();
    break;
    case "5" :
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
  print("Enter 5 to Stop The System");
  stdout.write("Choose Number: ");
}

void addStudent(){
  stdout.write("Enter Name:");
  String name = stdin.readLineSync() ?? "";

  stdout.write("Enter Level:");
  int? level = int.tryParse(stdin.readLineSync() ?? "")?? 1;

  stdout.write("Enter Department:");
  String department = stdin.readLineSync() ?? "";

  stdout.write("Enter GPA:");
  double? gpa = double.tryParse(stdin.readLineSync() ?? "")?? 0.0;

  students.add({
    "id" : counter++,
    "name" : name,
    "department" : department,
    "level" : level,
    "gpa" : gpa
  });

  print("Add Successful");

}

void removeStudent()
{
  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");

  if(id == null)
  {
    print("invalid");
    return;
  }

  students.removeWhere((student)=>student['id']==id);
  print("Remove Done");


}

void showStudents()
{
  if(students.isEmpty){
    print("The List is Empty");
    return;
  }

  for(var student in students){
    print("ID: ${student['id']} | Name: ${student['name']} | Department: ${student['department']} | Level: ${student['level']} | GPA: ${student['gpa']}");
  }
}

void findStudent()
{
  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");

  if(id == null)
  {
    print("invalid");
    return;
  }

  for(var student in students)
  {
    if(student['id'] == id)
    {
      print("ID: ${student['id']} | Name: ${student['name']} | Department: ${student['department']} | Level: ${student['level']} | GPA: ${student['gpa']}");
      return;
    }
  }
  print("Student Is Not Found");
}