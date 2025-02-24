use Employeeprojects

CREATE TABLE Client
(
  Client_ID INT NOT NULL,
  Client_FName VARCHAR(25) NOT NULL,
  Client_LName VARCHAR(25) NOT NULL,
  C_Email VARCHAR(25) NOT NULL,
  C_City VARCHAR(50) NOT NULL,
  C_Zipcode INT NOT NULL,
  C_StreetAddress VARCHAR(25) NOT NULL,
  C_State VARCHAR(2) NOT NULL,
  Payment_ID INT NOT NULL,
  Payment_Amount INT NOT NULL,
  PRIMARY KEY (Client_ID),
  UNIQUE (Payment_ID)
);

CREATE TABLE Projects
(
  Project_ID INT NOT NULL,
  P_Name VARCHAR(50) NOT NULL,
  Start_date DATE,
  End_date DATE,
  Project_Info VARCHAR(50) NOT NULL,
  Teamleader VARCHAR(20) NOT NULL,
  Client_ID INT NOT NULL,
   Status VARCHAR(20) NOT NULL,
  Budget INT NOT NULL,
  PRIMARY KEY (Project_ID),
  FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID)
);

CREATE TABLE Employee
(
  Emp_ID INT NOT NULL,
  F_Name VARCHAR(50) NOT NULL,
  L_Name VARCHAR(50) NOT NULL,
  Emp_Title VARCHAR(50) NOT NULL,
  Emp_Phn INT NOT NULL,
  Emp_Email VARCHAR(25) NOT NULL,
  Emp_City VARCHAR(25) NOT NULL,
  Emp_StreetAddress VARCHAR(25) NOT NULL,
  Emp_Zipcode INT NOT NULL,
  Emp_State VARCHAR(50) NOT NULL,
  Hourly_Rate INT NOT NULL,
  PRIMARY KEY (Emp_ID)
);

CREATE TABLE Environment
(
  Interface_ID INT NOT NULL,
  Interface VARCHAR(25) NOT NULL,
  Description VARCHAR(100) NOT NULL,
  PRIMARY KEY (Interface_ID)
);

CREATE TABLE Skill
(
  Skill_ID INT NOT NULL,
  Skill_description VARCHAR(100) NOT NULL,
  PRIMARY KEY (Skill_ID)
);

CREATE TABLE Task
(
  Task_ID INT NOT NULL,
  TStart_Date DATE,
  TCompleted_Date DATE,
  Task_Status VARCHAR(100) NOT NULL,
  Task_Desc VARCHAR(100) NOT NULL,
  Project_ID INT NOT NULL,
  PRIMARY KEY (Task_ID),
  FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);

CREATE TABLE Employee_skill
(
  Emp_ID INT NOT NULL,
  Skill_ID INT NOT NULL,
  PRIMARY KEY (Emp_ID, Skill_ID),
  FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
  FOREIGN KEY (Skill_ID) REFERENCES Skill(Skill_ID)
);

CREATE TABLE Sub_Task
(
  Sub_ID INT NOT NULL,
  SStartdate DATE,
  CompletedDate DATE,
  Hrs_Allocated INT NOT NULL,
  Sub_Status VARCHAR(100) NOT NULL,
  ST_Description VARCHAR(100) NOT NULL,
  Task_ID INT NOT NULL,
  Interface_ID INT NOT NULL,
  PRIMARY KEY (Sub_ID),
  FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID),
  FOREIGN KEY (Interface_ID) REFERENCES Environment(Interface_ID)
);

CREATE TABLE E_task
(
  Emp_ID INT NOT NULL,
  Sub_ID INT NOT NULL,
  PRIMARY KEY (Emp_ID, Sub_ID),
  FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
  FOREIGN KEY (Sub_ID) REFERENCES Sub_Task(Sub_ID)
);

INSERT INTO Client (Client_ID, Client_FName, Client_LName, C_Email, C_City, C_Zipcode, C_StreetAddress, C_State, Payment_ID, Payment_Amount)
VALUES
(1, 'John', 'Doe', 'john@example.com', 'New York', 12345, '123 Main St', 'NY', 1, 100),
(2, 'Jane', 'Smith', 'jane@example.com', 'Los Angeles', 54321, '456 Elm St', 'CA', 2, 150),
(3, 'Alice', 'Johnson', 'alice@example.com', 'Chicago', 67890, '789 Oak St', 'IL', 3, 200),
(4, 'Michael', 'Brown', 'michael@example.com', 'Houston', 77001, '101 Pine St', 'TX', 4, 120),
(5, 'Emily', 'Davis', 'emily@example.com', 'Miami', 33101, '202 Cedar St', 'FL', 5, 180);

INSERT INTO Projects (Project_ID, P_Name, Start_date, End_date, Project_Info, Teamleader, Client_ID, Status, Budget)
VALUES
(1, 'Website Redesign', '2024-04-25', '2024-05-25', 'Redesigning the company website to improve user experience.', 'Jane Smith', 1, 'Active', 10000),
(2, 'Marketing Campaign Launch', '2024-04-26', '2024-05-26', 'Planning and executing a comprehensive marketing campaign to increase brand awareness and attract new customers.', 'Emily Davis', 2, 'Active', 15000),
(3, 'Inventory Management System Implementation', '2024-04-27', '2024-05-27', 'Developing and implementing a new inventory management system to streamline operations and improve inventory tracking accuracy.', 'Emily Davis', 3, 'Inactive', 20000),
(4, 'Mobile App Development', '2024-04-28', '2024-05-28', 'Creating a mobile application to provide customers with convenient access to our services on their smartphones.', 'Jane Smith', 4, 'Active', 12000),
(5, 'Customer Relationship Management', '2024-04-29', '2024-05-29', 'Integrating a CRM system into our existing infrastructure to better manage customer relationships and enhance communication with clients.', 'John Doe', 5, 'Inactive', 18000);

INSERT INTO Employee (Emp_ID, F_Name, L_Name, Emp_Title, Emp_Phn, Emp_Email, Emp_City, Emp_StreetAddress, Emp_Zipcode, Emp_State, Hourly_Rate)
VALUES
(1, 'John', 'Cindy', 'Software Engineer', 1234567890, 'john.doe@gmail.com', 'New York', '123 Main St', 12345, 'NY', 50.00),
(2, 'Jack', 'Smith', 'Marketing Manager', 2345678901, 'jane.smith@gmail.com', 'Los Angeles', '456 Elm St', 54321, 'CA', 45.00),
(3, 'David', 'Johnson', 'HR Specialist', 3456789012, 'alice.johnson@gmail.com', 'Chicago', '789 Oak St', 67890, 'IL', 40.00),
(4, 'Michael', 'Smith', 'Project Manager', 4567890123, 'michael.brown@gmail.com', 'Houston', '101 Pine St', 77001, 'TX', 55.00),
(5, 'Emily', 'Cooper', 'Graphic Designer', 5678901234, 'emily.davis@gmail.com', 'Miami', '202 Cedar St', 33101, 'FL', 35.00);

INSERT INTO Environment (Interface_ID, Interface, Description)
VALUES
(1, 'Ethernet', 'Ethernet interface for LAN connection'),
(2, 'Wi-Fi', 'Wi-Fi interface for wireless connection'),
(3, 'Bluetooth', 'Bluetooth interface for short-range wireless communication'),
(4, 'USB', 'USB interface for connecting peripheral devices'),
(5, 'Serial', 'Serial interface for serial communication between devices');

INSERT INTO Skill (Skill_ID, Skill_description)
VALUES
(1, 'Programming'),
(2, 'Graphic Design'),
(3, 'Data Analysis'),
(4, 'Project Management'),
(5, 'Customer Service');

INSERT INTO Task (Task_ID, TStart_Date, TCompleted_Date, Task_Status, Task_Desc, Project_ID)
VALUES
(1, '2024-04-25', '2024-04-30', 'Completed', 'Design UI Mockups', 1),
(2, '2024-04-26', '2024-05-01', 'Completed', 'Develop Backend Logic', 1),
(3, '2024-04-27', '2024-05-02', 'In Progress', 'Testing and Debugging', 1),
(4, '2024-04-28', NULL, 'Pending', 'Content Creation', 2),
(5, '2024-04-29', NULL, 'Pending', 'Market Research', 2);

INSERT INTO Employee_skill (Emp_ID, Skill_ID)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

INSERT INTO Sub_Task (Sub_ID, SStartdate, CompletedDate, Hrs_Allocated, Sub_Status, ST_Description, Task_ID, Interface_ID)
VALUES
(1, '2024-04-25', NULL, 8, 'In Progress', 'Design UI Components', 1, 1),
(2, '2024-04-26', NULL, 16, 'Pending', 'Backend Development', 2, 2),
(3, '2024-04-27', '2024-04-30', 12, 'Completed', 'Testing and Debugging', 3, 3),
(4, '2024-04-28', NULL, 10, 'In Progress', 'Content Creation', 4, 4),
(5, '2024-04-29', NULL, 20, 'Pending', 'Market Research', 5, 5);

INSERT INTO E_task (Emp_ID, Sub_ID)
VALUES
(1, 5),
(2, 3),
(3, 1),
(4, 4),
(5, 2);



