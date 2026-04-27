// =============================================
// DART PROGRAMMING LAB 1 - COMPLETE SOLUTION
// =============================================

import 'dart:async';

// ==================== PART 1: FUNCTIONS ====================

void welcomeMessage() {
  print('WELCOME TO SCHOOL SYSTEM ');

}

void createStudent({required String name, required int age}) {
  print('📋 Student Details:');
  print('   👤 Name: $name');
  print('   🎂 Age: $age years old');
  print('   📝 Status: Successfully registered');
}

void createTeacher(String name, [String? subject = null]) {
  print('\n👨‍🏫 Teacher Registration:');
  print('   Name: $name');
  if (subject != null) {
    print('   Subject: $subject');
  } else {
    print('   ⚠️ Subject not assigned');
  }
}

// ==================== PART 2: CLASSES & CONSTRUCTORS ====================

class Student {
  String name;
  int age;

  Student(this.name, this.age);

  void displayInfo() {
    print('Student: $name | Age: $age');
  }
}

// ==================== PART 3: INHERITANCE ====================

class Person {
  String name;

  Person(this.name);

  void introduce() {
    print('Hello, I am $name');
  }
}

class Student2 extends Person {
  int age;

  Student2(String name, this.age) : super(name);

  @override
  void introduce() {
    print('🎓 I am $name, a student aged $age');
  }
}

// ==================== PART 4: INTERFACES ====================

abstract class Registrable {
  void registerCourse(String courseName);
}

class Student3 extends Person implements Registrable {
  int age;
  List<String> courses = [];

  Student3(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    print('✅ $name registered for: $courseName');
    print('   Total courses: ${courses.length}');
  }
}

// ==================== PART 5: MIXINS ====================

mixin AttendanceMixin {
  int _attendanceCount = 0;

  void markAttendance() {
    _attendanceCount++;
    print('📅 Attendance marked! Total: $_attendanceCount');
  }

  int get attendanceCount => _attendanceCount;
}

class Student4 extends Person with AttendanceMixin implements Registrable {
  int age;
  List<String> courses = [];

  Student4(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    print('📚 $name registered for: $courseName');
  }
}

// ==================== PART 6: COLLECTIONS ====================

class Student5 {
  String name;
  String id;
  int age;

  Student5(this.id, this.name, this.age);

  @override
  String toString() => 'ID: $id | Name: $name | Age: $age';
}

// ==================== PART 7: ANONYMOUS & ARROW FUNCTIONS ====================

void printStudentNames(List<Student5> students) {
  print('\n📋 Student List (using anonymous function):');
  students.forEach((student) {
    print('   👤 ${student.name}');
  });
}

String welcomeStudent(String studentName) => '🌟 Welcome, $studentName!';

// ==================== PART 8: ASYNCHRONOUS PROGRAMMING ====================

Future<List<Student5>> loadStudents() async {
  print('\n⏳ Loading student data...');
  await Future.delayed(Duration(seconds: 2));

  return [
    Student5('S001', 'Alice Johnson', 18),
    Student5('S002', 'Bob Smith', 19),
    Student5('S003', 'Charlie Brown', 20),
    Student5('S004', 'Diana Prince', 21),
  ];
}

// ==================== PART 9: INTEGRATION CHALLENGE ====================

mixin NotificationMixin {
  void sendRegistrationNotification(String studentName, String course) {
    print('\n🔔 NOTIFICATION:');
    print('   $studentName has successfully registered for "$course"');
    print('   Confirmation email sent!');
  }
}

class FinalStudent extends Person
    with AttendanceMixin, NotificationMixin
    implements Registrable {
  int age;
  List<String> courses = [];

  FinalStudent(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    sendRegistrationNotification(name, courseName);
    markAttendance();
  }

  void showAllCourses() {
    if (courses.isEmpty) {
      print('   No courses registered yet');
    } else {
      print('   Registered courses: ${courses.join(", ")}');
    }
  }
}

// ==================== MAIN FUNCTION WITH SEPARATE SECTIONS ====================

void main() async {
  print('==================================================');
  print('         DART LAB 1 - SEPARATE QUESTION RUNS     ');
  print('==================================================\n');

  // ==================== Q1: welcomeMessage ====================
  print('\n' + '=' * 40);
  print('Q1: welcomeMessage Function');
  print('=' * 40);
  welcomeMessage();
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q2: createStudent ====================
  print('\n' + '=' * 40);
  print('Q2: createStudent with Named Parameters');
  print('=' * 40);
  createStudent(name: "John Doe", age: 18);
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q3: createTeacher ====================
  print('\n' + '=' * 40);
  print('Q3: createTeacher with Optional Parameter');
  print('=' * 40);
  createTeacher("Mr. Anderson", "Mathematics");
  print('\n--- Testing without subject ---');
  createTeacher("Ms. Garcia");
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q4: Student Class ====================
  print('\n' + '=' * 40);
  print('Q4: Student Class with Constructor');
  print('=' * 40);
  var studentQ4 = Student("Michael Chen", 17);
  print('Object created: Student("Michael Chen", 17)');
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q5: Object Creation ====================
  print('\n' + '=' * 40);
  print('Q5: Object Creation and Usage');
  print('=' * 40);
  studentQ4.displayInfo();
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q6: Person Class ====================
  print('\n' + '=' * 40);
  print('Q6: Person Base Class');
  print('=' * 40);
  var person = Person("John Smith");
  person.introduce();
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q7: Student Inherits Person ====================
  print('\n' + '=' * 40);
  print('Q7: Student Inherits from Person');
  print('=' * 40);
  var student2 = Student2("Sarah Williams", 16);
  student2.introduce();
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q8: Registrable Interface ====================
  print('\n' + '=' * 40);
  print('Q8: Registrable Abstract Class (Interface)');
  print('=' * 40);
  print('Abstract class Registrable defined with registerCourse method');
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q9: Implementing Interface ====================
  print('\n' + '=' * 40);
  print('Q9: Student Implementing Registrable Interface');
  print('=' * 40);
  var student3 = Student3("Robert Johnson", 18);
  student3.registerCourse("Physics");
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q10: AttendanceMixin ====================
  print('\n' + '=' * 40);
  print('Q10: AttendanceMixin Creation');
  print('=' * 40);
  print('AttendanceMixin created with markAttendance() method');
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q11: Applying Mixin ====================
  print('\n' + '=' * 40);
  print('Q11: Applying AttendanceMixin to Student');
  print('=' * 40);
  var student4 = Student4("Emma Wilson", 17);
  print('Student with AttendanceMixin created: Emma Wilson');
  print('\nMarking attendance 3 times:');
  student4.markAttendance();
  student4.markAttendance();
  student4.markAttendance();
  print('Total attendance: ${student4.attendanceCount}');
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q12: List of Students ====================
  print('\n' + '=' * 40);
  print('Q12: List of Students');
  print('=' * 40);
  List<Student5> studentsList = [
    Student5('S101', 'Alex Turner', 18),
    Student5('S102', 'Bella Swan', 17),
    Student5('S103', 'Chris Evans', 19),
  ];
  print('List created with ${studentsList.length} students:');
  for (var student in studentsList) {
    print('   - ${student.name} (Age: ${student.age})');
  }
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q13: Map of Students ====================
  print('\n' + '=' * 40);
  print('Q13: Map of Students (ID as key)');
  print('=' * 40);
  Map<String, Student5> studentsMap = {
    'S201': Student5('S201', 'David Miller', 20),
    'S202': Student5('S202', 'Elena Gilbert', 21),
    'S203': Student5('S203', 'Frank Ocean', 19),
  };
  print('Map created with ${studentsMap.length} entries:');
  studentsMap.forEach((id, student) {
    print('   $id: ${student.name}');
  });
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q14: Anonymous Function ====================
  print('\n' + '=' * 40);
  print('Q14: Anonymous Function to Print Names');
  print('=' * 40);
  printStudentNames(studentsList);
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q15: Arrow Function ====================
  print('\n' + '=' * 40);
  print('Q15: Arrow Function Example');
  print('=' * 40);
  print(
    'Arrow function: String welcomeStudent(String name) => "Welcome, \$name!"',
  );
  print('Testing arrow function:');
  print('   ${welcomeStudent("John")}');
  print('   ${welcomeStudent("Mary")}');
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q16: Async Function ====================
  print('\n' + '=' * 40);
  print('Q16: Async Function loadStudents()');
  print('=' * 40);
  print('Async function that waits 2 seconds:');
  var loadedStudents = await loadStudents();
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q17: Using await ====================
  print('\n' + '=' * 40);
  print('Q17: Using await with Async Function');
  print('=' * 40);
  print('Loaded ${loadedStudents.length} students:');
  for (var student in loadedStudents) {
    print('   - ${student.name}');
  }
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q19: NotificationMixin ====================
  print('\n' + '=' * 40);
  print('Q19: NotificationMixin Creation');
  print('=' * 40);
  print('NotificationMixin created with sendRegistrationNotification()');
  await Future.delayed(Duration(milliseconds: 500));

  // ==================== Q19 Continued: Using NotificationMixin ====================
  print('\n' + '=' * 40);
  print('Q19: Applying NotificationMixin to Student');
  print('=' * 40);
  var finalStudent = FinalStudent("Taylor Swift", 20);
  finalStudent.registerCourse("Music Theory");
  await Future.delayed(Duration(milliseconds: 500));

}
