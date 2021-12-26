pragma solidity >=0.8.x <0.9.0;

contract Test {
    //定义结构之后无分号，与枚举一致
    struct Student {
        string name;
        uint age;
        uint score;
        string sex;
    }

    Student[] public students;
    
        
    //两种赋值方式
    Student public stu1 = Student("lily", 18, 90, "girl");
    Student public stu2 = Student({name:"Jim", age:20, score:80, sex:"boy"});
    
    function assign() public {
        students.push(stu1);
        students.push(stu2);
        
        stu1.name = "Lily";
    }
    
    //tuple元组
    function getStudentByIndex(uint _i) public view returns(string, uint, uint, string){
        Student memory stu = students[_i];
        return (stu.name, stu.age, stu.score, stu.sex);
    }
}