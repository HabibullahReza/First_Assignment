// A. Define an interface named Role
abstract class Role {
     void displayRole();
}

// B. Create a class Person
class Person implements Role {
     late String name;
     late int age;
     late String address;
     late Role role;

     // Constructor
     Person(this.name, this.age, this.address, this.role);

     // Display role using interface method
     @override
     void displayRole() {
          role.displayRole();
     }
}

// C. Create a class Student that extends Person
class Student extends Person {
     late int studentID;
     late String grade;
     late List<int> courseScores = [];

     // Constructor
     Student(String name, int age, String address, this.studentID, this.grade)
         : super(name, age, address, StudentRole());

     // Override displayRole method
     @override
     void displayRole() {
          print("Role: Student");
     }

     // Method to calculate average score
     double calculateAverageScore() {
          if (courseScores.isEmpty) {
               return 0.0;
          }
          return courseScores.reduce((a, b) => a + b) / courseScores.length;
     }
}

// D. Create another class Teacher that extends Person
class Teacher extends Person {
     late int teacherID;
     late List<String> coursesTaught;

     // Constructor
     Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
         : super(name, age, address, TeacherRole());

     // Override displayRole method
     @override
     void displayRole() {
          print("Role: Teacher");
     }

     // Method to display courses taught by the teacher
     void displayCoursesTaught() {
          print("Courses Taught:");
          for (String course in coursesTaught) {
               print("- $course");
          }
     }
}

// E. Create a class StudentManagementSystem
void main() {
     // Create instances of Student and Teacher classes
     var student = Student("John Doe", 20, "123 Main St", 12345, "Grade A")
          ..courseScores.addAll([90, 85, 82]);

     var teacher = Teacher("Mrs. Smith", 35, "456 Oak St", 5678, ["Math", "English", "Bangla"]);

     // Display information using displayRole method
     print("Student Information:");
     student.displayRole();
     print("Name: ${student.name}");
     print("Age: ${student.age}");
     print("Address: ${student.address}");
     print("Average Score: ${student.calculateAverageScore()}");

     print("\nTeacher Information:");
     teacher.displayRole();
     print("Name: ${teacher.name}");
     print("Age: ${teacher.age}");
     print("Address: ${teacher.address}");
     teacher.displayCoursesTaught();
}

// Implement Role interface for Student
class StudentRole implements Role {
     @override
     void displayRole() {
          print("Role: Student");
     }
}

// Implement Role interface for Teacher
class TeacherRole implements Role {
     @override
     void displayRole() {
          print("Role: Teacher");
     }
}
