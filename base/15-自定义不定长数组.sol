pragma solidity >=0.8.x <0.9.0;


contract Test {
    //1. 定义时直接初始化
    
    uint256[] public numbers = [1,2,3];
    
    function setValue(uint256 _num) public {
        numbers.push(_num);
    }
    
    function getNumbers() public view returns(uint256[]) {
        return numbers;
    }
    
    
    //2. 定义时不赋值，使用new进行分配空间
    uint256[] public values;
    
    function setValues1() public {
        // values = new uint256[](10);
        values.length = 50;
        values[5] = 40;
    }
    
    function getValues() public view returns(uint256[]) {
        return values;
    }
    
    
    function setValues2() public {
        uint256[] memory localvalues = new uint256[](10);
        // localvalues.length = 20;
    }
    
    
} 