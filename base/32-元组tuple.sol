pragma solidity >=0.8.x <0.9.0;

contract Test {
    
    struct Student {
        string name;
        uint age;
    }
    
    //两种赋值方式
    Student public stu1 = Student("lily", 18);
    Student public stu2 = Student({name:"Jim", age:20});

    Student[] public Students;
    
    function assign() public {
        Students.push(stu1);
        Students.push(stu2);
        
        stu1.name = "Lily";
    }
    
    //返回数组长度
    function getStudentCounts() public view returns(uint256) {
        return Students.length;
    }
    
    //根据索引，返回具体的学生信息
    function getStudent(uint256 _index) public view returns(string, uint256) {
        
        require(_index <= Students.length - 1);
        
        Student memory stu = Students[_index];
        return (stu.name, stu.age);
    }
    
    
    function test(uint256 _index) public view returns(string,string, string,string,string,string,string,string){
        return ("11", "11", "11", "11", "11", "11", "11", "11");
    }
}