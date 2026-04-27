// ============================================
// DART SCHOOL LAB - COMPLETE SOLUTION
// All questions in one runnable file
// ============================================

// ========== PART 1: FUNCTIONS ==========

// Q1: Welcome Message Function
void welcomeMessage() {
  print("\n" + "=" * 50);
  print("   WELCOME TO THE SCHOOL MANAGEMENT SYSTEM");
  print("=" * 50);
  print("📚 Your learning journey starts here!");
  print("💡 Empowering education through technology\n");
}

// Q2: Named Parameters Function
void createStudent({required String name, required int age}) {
  print("✓ Student Created:");
  print("   Name: $name");
  print("   Age:  $age years old");
  print("   Status: Active\n");
}

// Q3: Optional Parameters Function
void createTeacher(String name, [String subject = 'Subject not assigned']) {
  print("✓ Teacher Created:");
  print("   Name:    $name");
  print("   Subject: $subject");
  print("   Status:  Active\n");
}

// ========== PART 2: CLASSES AND CONSTRUCTORS ==========

// Q4: Student Class with Constructor
class Student {
  String name;
  int age;
  String? studentId;
  
  // Constructor
  Student(this.name, this.age, [this.studentId]);
  
  void displayInfo() {
    print("📖 Student Details:");
    print("   Name: ${name}");
    print("   Age:  ${age}");
    if (studentId != null) {
      print("   ID:   ${studentId}");
    }
    print("");
  }
  
  String getInfo() => "$name (Age: $age)";
}

// ========== PART 3: INHERITANCE ==========

// Q6: Person Class
class Person {
  String name;
  
  Person(this.name);
  
  void introduce() {
    print("👋 Hello! My name is $name");
  }
}

// Q7: Student inherits from Person
class StudentPerson extends Person {
  int age;
  String? studentId;
  
  StudentPerson(String name, this.age, [this.studentId]) : super(name);
  
  void showStudentInfo() {
    print("🎓 Student Information:");
    print("   Name: $name");
    print("   Age:  $age");
    if (studentId != null) {
      print("   ID:   ${studentId}");
    }
    print("");
  }
}

// ========== PART 4: INTERFACES ==========

// Q8: Abstract class / Interface
abstract class Registrable {
  void registerCourse(String courseName);
}

// Q9: Student implements Registrable
class RegistrableStudent implements Registrable {
  String name;
  int age;
  
  RegistrableStudent(this.name, this.age);
  
  @override
  void registerCourse(String courseName) {
    print("📝 COURSE REGISTRATION:");
    print("   Student: $name");
    print("   Course:  $courseName");
    print("   Status:  ✅ Successfully registered!\n");
  }
}

// ========== PART 5: MIXINS ==========

// Q10: AttendanceMixin
mixin AttendanceMixin {
  int attendanceCount = 0;
  List<String> attendanceDates = [];
  
  void markAttendance([String date = ""]) {
    attendanceCount++;
    String attendanceDate = date.isEmpty ? "Day $attendanceCount" : date;
    attendanceDates.add(attendanceDate);
    print("   ✅ Attendance marked! (Total: $attendanceCount)");
  }
  
  int getAttendanceCount() => attendanceCount;
  
  void showAttendanceSummary() {
    print("\n📊 Attendance Summary:");
    print("   Total Days Present: $attendanceCount");
    print("   Attendance Rate: ${(attendanceCount / 30 * 100).toStringAsFixed(1)}%");
  }
}

// Q11: Student with AttendanceMixin
class AttendingStudent with AttendanceMixin {
  String name;
  int age;
  String studentId;
  
  AttendingStudent(this.name, this.age, this.studentId);
  
  void displayInfo() {
    print("\n👨‍🎓 Student: $name");
    print("   Age: $age");
    print("   ID:  $studentId");
  }
}

// ========== PART 6: COLLECTIONS ==========

// Q12 & Q13: Lists and Maps
class CollectionStudent {
  String name;
  int age;
  int studentId;
  
  CollectionStudent(this.name, this.age, this.studentId);
  
  String getInfo() => "$name (Age: $age, ID: $studentId)";
}

// ========== PART 7: ANONYMOUS AND ARROW FUNCTIONS ==========

// Q14 & Q15: Functions
void greetStudent(String name) => print("✨ Welcome to school, $name! ✨\n");

// ========== PART 8: ASYNCHRONOUS PROGRAMMING ==========

// Q16 & Q17: Async/Await
Future<List<CollectionStudent>> loadStudents() async {
  print("   ⏳ Loading student data from database...");
  await Future.delayed(Duration(seconds: 2));
  
  return [
    CollectionStudent("Alice Johnson", 20, 101),
    CollectionStudent("Bob Smith", 22, 102),
    CollectionStudent("Charlie Brown", 21, 103),
    CollectionStudent("Diana Prince", 19, 104),
    CollectionStudent("Ethan Hunt", 23, 105),
  ];
}

// ========== PART 9: INTEGRATION CHALLENGE ==========

// Q19: NotificationMixin
mixin NotificationMixin {
  void sendNotification(String title, String message) {
    print("🔔 NOTIFICATION:");
    print("   [${title.toUpperCase()}]");
    print("   ➜ $message");
    print("   Time: ${DateTime.now().toString().substring(0, 19)}\n");
  }
}

// Complete Student class with multiple mixins
class CompleteStudent with AttendanceMixin, NotificationMixin implements Registrable {
  String name;
  int age;
  String studentId;
  
  CompleteStudent(this.name, this.age, this.studentId);
  
  @override
  void registerCourse(String courseName) {
    print("\n📚 COURSE REGISTRATION PROCESS:");
    print("   Student: $name (ID: $studentId)");
    print("   Course:  $courseName");
    sendNotification("Course Registration", "$name has successfully registered for $courseName");
  }
  
  void displayFullInfo() {
    print("\n" + "─" * 40);
    print("🎓 COMPLETE STUDENT PROFILE");
    print("─" * 40);
    print("   Name:      $name");
    print("   Age:       $age");
    print("   Student ID: $studentId");
    print("─" * 40);
  }
}

// ========== MAIN FUNCTION ==========

void main() async {
  print("\n" + "=" * 60);
  print("   🎯 DART PROGRAMMING LAB - COMPLETE SOLUTION");
  print("=" * 60);
  
  // ===== Q1: Welcome Message =====
  welcomeMessage();
  
  // ===== Q2: Named Parameters =====
  print("【Q2: Named Parameters Function】");
  createStudent(name: "Emma Watson", age: 20);
  createStudent(name: "Liam Hemsworth", age: 21);
  
  // ===== Q3: Optional Parameters =====
  print("【Q3: Optional Parameters Function】");
  createTeacher("Professor Smith", "Mathematics");
  createTeacher("Ms. Johnson");
  
  // ===== Q4 & Q5: Student Class =====
  print("【Q4 & Q5: Student Class with Constructor】");
  Student student1 = Student("Olivia Chen", 21, "S1001");
  Student student2 = Student("Noah Williams", 22);
  student1.displayInfo();
  student2.displayInfo();
  
  // ===== Q6 & Q7: Inheritance =====
  print("【Q6 & Q7: Inheritance - Person & Student】");
  StudentPerson studentPerson = StudentPerson("Mia Rodriguez", 20, "S1002");
  studentPerson.introduce();
  studentPerson.showStudentInfo();
  
  // ===== Q8 & Q9: Interfaces =====
  print("【Q8 & Q9: Interfaces - Registrable】");
  RegistrableStudent registrableStudent = RegistrableStudent("James Wilson", 22);
  registrableStudent.registerCourse("Flutter Development");
  
  // ===== Q10 & Q11: Mixins =====
  print("【Q10 & Q11: Mixins - AttendanceMixin】");
  AttendingStudent attendingStudent = AttendingStudent("Isabella Martinez", 19, "S1003");
  attendingStudent.displayInfo();
  print("\n   📅 Marking Attendance:");
  attendingStudent.markAttendance("Day 1");
  attendingStudent.markAttendance("Day 2");
  attendingStudent.markAttendance("Day 3");
  attendingStudent.showAttendanceSummary();
  print("");
  
  // ===== Q12: List of Students =====
  print("【Q12: List Collection】");
  List<CollectionStudent> studentList = [
    CollectionStudent("Lucas Anderson", 20, 201),
    CollectionStudent("Amelia Thomas", 21, 202),
    CollectionStudent("Benjamin Moore", 22, 203),
  ];
  
  print("📋 Student List:");
  for (var student in studentList) {
    print("   • ${student.getInfo()}");
  }
  print("");
  
  // ===== Q13: Map of Students =====
  print("【Q13: Map Collection】");
  Map<int, CollectionStudent> studentMap = {
    101: CollectionStudent("Sophia Lee", 20, 101),
    102: CollectionStudent("Jackson Taylor", 21, 102),
    103: CollectionStudent("Ava Brown", 19, 103),
  };
  
  print("🗺️  Student Directory (ID → Student):");
  studentMap.forEach((id, student) {
    print("   ID $id: ${student.getInfo()}");
  });
  print("");
  
  // ===== Q14: Anonymous Function =====
  print("【Q14: Anonymous Function】");
  print("📝 Printing student names using anonymous function:");
  studentList.forEach((student) {
    print("   ✨ Student Name: ${student.name}");
  });
  print("");
  
  // ===== Q15: Arrow Function =====
  print("【Q15: Arrow Function】");
  greetStudent("Diana");
  greetStudent("Ethan");
  
  // ===== Q16 & Q17: Asynchronous Programming =====
  print("【Q16 & Q17: Async/Await】");
  print("   🔄 Starting async student load...");
  List<CollectionStudent> loadedStudents = await loadStudents();
  print("\n   ✅ Student data loaded successfully!");
  print("   📊 Total students loaded: ${loadedStudents.length}");
  print("\n   📋 Loaded Student List:");
  for (var student in loadedStudents) {
    print("      • ${student.name} (Age: ${student.age}, ID: ${student.studentId})");
  }
  print("");
  
  // ===== Q19: NotificationMixin Integration =====
  print("【Q19: NotificationMixin - Complete Integration】");
  CompleteStudent completeStudent = CompleteStudent("Victoria Chen", 22, "S2001");
  completeStudent.displayFullInfo();
  
  print("📝 Registering for courses:");
  completeStudent.registerCourse("Advanced Dart Programming");
  completeStudent.registerCourse("Flutter UI/UX Design");
  
  print("\n📅 Marking Attendance:");
  completeStudent.markAttendance();
  completeStudent.markAttendance();
  completeStudent.markAttendance();
  completeStudent.showAttendanceSummary();
  
  // ===== Q20: Final Summary =====
  print("\n" + "=" * 60);
  print("   ✅ LAB COMPLETED SUCCESSFULLY!");
  print("=" * 60);
  print("\n📌 Summary of Concepts Demonstrated:");
  print("   1. ✓ Functions (Named & Optional Parameters)");
  print("   2. ✓ Classes, Constructors & Objects");
  print("   3. ✓ Inheritance (extends)");
  print("   4. ✓ Interfaces (implements)");
  print("   5. ✓ Mixins (with)");
  print("   6. ✓ Collections (List & Map)");
  print("   7. ✓ Anonymous & Arrow Functions");
  print("   8. ✓ Asynchronous Programming (async/await)");
  print("   9. ✓ Multiple Mixins & Complete Integration");
  print("\n🎉 Great work! All 20 questions completed successfully!\n");
}

// Helper function for visual separation (not required but nice)
String repeat(String s, int times) {
  return List.filled(times, s).join();
}