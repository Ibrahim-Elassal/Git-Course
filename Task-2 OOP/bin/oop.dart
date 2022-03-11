void main() {
  Employee e1 = Employee(
    name: 'Mohamed',
    salary: 8000,
    section: 'A',
    age: 20,
    phone: 01164576547,
    isAttend: false,
  );
  Employee e2 = Employee(
    name: 'Ahmed',
    salary: 12000,
    section: 'B',
    age: 30,
    phone: 01076567688,
    isAttend: true,
  );
  Employee e3 = Employee(
    name: 'Ibrahim',
    salary: 20000,
    section: 'V',
    age: 33,
    phone: 01267567677,
    isAttend: false,
  );
  List<Employee> emp = [e1, e2, e3];
  Manager manager = Manager(
    name: 'Alaa',
    age: 35,
    phone: 0125629526,
    salary: 22000,
    isAttend: false,
    section: 'D',
    employees: emp,
  );
  Task goTask = Task(title: 'go', isDelivered: false);
  manager.addTask(emp[0], Task(title: 'play', isDelivered: false));
  manager.addTask(emp[0], Task(title: 'eat', isDelivered: true));
  manager.addTask(emp[1], goTask);
  manager.addTask(emp[1], Task(title: 'watch', isDelivered: true));
  manager.addTask(emp[2], Task(title: 'running', isDelivered: true));

  manager.numberEmployee(emp);
  print("______");
  manager.listEmployee(emp);

  manager.showEmployees(emp);

  print("______________");
  print("All Tasks is :");
  e1.allTasks();
  e2.allTasks();
  e3.allTasks();
  print("______________");
  print("Tasks:");
  e1.showTasks();
  e2.showTasks();
  e3.showTasks();
}

class Person {
  late String? name;
  late int? age;
  late int? phone;
  late int? salary;
  late String? section;
  late bool? isAttend;

  Person({
    this.name,
    this.age,
    this.phone,
    this.salary,
    this.section,
    this.isAttend,
  });
}

class Manager extends Person {
  late List<Employee>? employees;

  Manager({
    this.employees,
    String? name,
    int? age,
    int? phone,
    int? salary,
    String? section,
    bool? isAttend,
  }) : super(
    name: name,
    age: age,
    phone: phone,
    salary: salary,
    section: section,
    isAttend: isAttend,
  );

  void addTask(Employee e, Task task) {
    e.tasks.add(task);
  }

  void numberEmployee(List<Employee> emp) {
    print("Number of Employees is : ${employees?.length} ");
  }

  void listEmployee(List<Employee> emp){
    for (int i = 0; i < emp.length; i++) {
      emp[i].employeeName();
    }
  }

  void showEmployees(List<Employee> emp){
    for (int i = 0; i < emp.length; i++) {
      // emp[i].employeeName();
      emp[i].printEmployee();
    }
  }
}

class Task {
  String title;
  bool isDelivered;

  Task({
    required this.title,
    required this.isDelivered,
  });

  void finishTask() {
    isDelivered = true;
  }
}

class Employee extends Person {
  List<Task> tasks = [];

  Employee({
    required String name,
    required int age,
    required int phone,
    required int salary,
    required String section,
    required bool isAttend,
  }) : super(
    name: name,
    age: age,
    phone: phone,
    salary: salary,
    section: section,
    isAttend: isAttend,
  );

  void printEmployee() {
    print("______");
    print('Name Is :$name');
    print('Age Is :$age');
    print('Phone Is :$phone');
    print('Salary Is :$salary');
    print('Section Is :$section');
    print('IsAttend Is :$isAttend');
    print("Tasks Is :");
    allTasks();
  }
  void employeeName() {
    print('Name Is :$name');

  }
  void allTasks(){
    for (Task task in tasks) {
      task.isDelivered
          ? print('-${task.title} is delivered')
          : print('-${task.title} is not delivered');
    }
  }
  void showTasks(){
    for (Task task in  tasks){
      print(task.title);
    }
  }
}