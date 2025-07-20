import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String jobTitle;
  final String address;
  final String gender;

  HomePage({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.jobTitle = '',
    this.address = '',
    this.gender = '',
  });

  @override
  State<HomePage> createState() => _HomePageP();
}

class _HomePageP extends State<HomePage> {
  int currentIndex = 0;
  List<String> tasks = [];
  List<String> completedTasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    if (taskController.text.trim().isEmpty) return;
    setState(() {
      tasks.add(taskController.text.trim());
      taskController.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void completeTask(int index) {
    setState(() {
      completedTasks.add(tasks[index]);
      tasks.removeAt(index);
    });
  }

  void logout() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      homeTab(),
      tasksTab(),
      profileTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: const Color.fromARGB(255, 52, 123, 247),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 1),
              builder: (context, value, child) {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.blue],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: value,
                        child: Opacity(
                          opacity: value,
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                              "https://i.ibb.co/RpwwYkbc/IMG-20250714-WA0004.jpg",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Opacity(
                        opacity: value,
                        child: Text(
                          "Ahmed Hany El-Sayed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Icon(Icons.task),
                title: Text("Task"),
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                }),
            ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                }),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: logout,
            ),
          ],
        ),
      ),
      body:
      tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget homeTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome, ${widget.firstName} ${widget.lastName}!",
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 40),
          Container(
            height: 125,
            width: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                'https://i.ibb.co/RpwwYkbc/IMG-20250714-WA0004.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    child: Center(child: Text("Image failed")),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tasksTab() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: InputDecoration(
              labelText: 'New Task',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: addTask,
            child: Text("Add Task"),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(tasks[index]),
                    subtitle: Text(
                        "Created by: ${widget.firstName} ${widget.lastName}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () => completeTask(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTask(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget profileTab() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 700),
        child: ListView(
          children: [
            Text(
              "First Name: ${widget.firstName}",
            ),
            Text("Last Name: ${widget.lastName}"),
            Text("Email: ${widget.email}"),
            Text("Job Title: ${widget.jobTitle}"),
            Text("Address: ${widget.address}"),
            Text("Gender: ${widget.gender}"),
            SizedBox(height: 20),
            Text(
              "Completed Tasks:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...completedTasks.map((task) => ListTile(
                  title: Text(task,
                      style: TextStyle(decoration: TextDecoration.lineThrough)),
                ))
          ],
        ),
      ),
    );
  }
}
