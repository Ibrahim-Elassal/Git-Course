void main() {
  Employee e1 = Employee(
    name: 'Mohamed',
    salary: 8000,
    section: 'a',
    age: 20,
    phone: 01143253753,
    isAttend: false,
  );
  Employee e2 = Employee(
    name: 'Ahmed',
    salary: 2548,
    section: 'b',
    age: 35,
    phone: 01143253451,
    isAttend: true,
  );
  Employee e3 = Employee(
    name: 'Morgan',
    salary: 3652,
    section: 'a',
    age: 24,
    phone: 01043921753,
    isAttend: false,
  );
  List<Employee> emp = [e1, e2, e3];

  Manager manager = Manager(
    name: 'manal',
    age: 42,
    phone: 0125629526,
    salary: 6824,
    isAttend: false,
    section: 'a',
    employees: emp,
  );

  Task goTask = Task(title: 'go', isDelivered: false);
  manager.addTask(emp[0], Task(title: 'play', isDelivered: false));
  manager.addTask(emp[0], Task(title: 'eat', isDelivered: true));
  manager.addTask(emp[1], goTask);
  manager.addTask(emp[1], Task(title: 'watch', isDelivered: true));
  manager.addTask(emp[2], Task(title: 'running', isDelivered: true));


  manager.showAllEmployee(emp);
  print("______");

  for (int i = 0; i < emp.length; i++) {
    emp[i].printEmployee();
  }
  print("All Tasks is :");
  e1.allTasks();
  e2.allTasks();
  e3.allTasks();

  print("Tasks:");
  e1.showTasks();
  e2.showTasks();
  e3.showTasks();


}

// parent class person
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

// sub class Manager
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

  void showAllEmployee(List<Employee> emp) {
    print(employees?.length);
    print(employees);
    for (int i = 0; i < emp.length; i++) {
      emp[i].printEmployee();
    }
  }
}

// task is deliverd or not

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

// sub class employee
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
    print('****');

    print('Name Is :$name');
    print('Age Is :$age');
    print('Phone Is :$phone');
    print('Salary Is :$salary');
    print('Section Is :$section');
    print('IsAttend Is :$isAttend');

    print("Tasks Is :");
    allTasks();
  }

  void allTasks(){
    for (Task task in tasks) {
      task.isDelivered
          ? print('-${task.title} is delivered')
          : print('-${task.title} is not delivered');
    }
  }
  void showTasks(){
    for (var i in  tasks){
      print(i);
    }
  }
}