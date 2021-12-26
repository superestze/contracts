pragma solidity >=0.8.x <0.9.0;


contract  Test {
    
    //01. string 
    string public str1 = "hello";
    
    function deleteStr() public {
        delete str1;
    }
    
    function setStr(string input) public {
        str1 = input;
    }
    
    //02. array 对于固定长度的数组，会删除每个元素的值，但是数组长度不变
    uint256[10] public arry1 = [1,2,3,4,5];
    
    function deleteFiexedArry() public {
        delete arry1;
    }
    
    //03. array new
    
    uint256[] arry2 ;
    function setArray2() public {
        arry2 = new uint256[](10);
        for (uint256 i = 0; i< arry2.length; i++) {
            arry2[i] = i;
        }
    }
    
    function getArray2() public view returns(uint256[]) {
        return arry2;
    }
    
    function deleteArray2() public {
        delete arry2;
    }
    
    //04. mapping
    
    mapping(uint256 => string) public m1;
    
    function setMap() public {
        m1[0] = "hello";
        m1[1] = "world";
    }
    
    //Mapping不允许直接使用delete，但是可以对mapping的元素进行指定删除
    // function deleteM1() public {
    //     delete m1;
    // }
    
    function deleteMapping(uint256 i) public {
        delete m1[i];
    }
}