pragma solidity >=0.8.x <0.9.0;


contract baseA {
    
    function getData() public pure returns(uint256) {
        return 1;
    }
} 


contract baseB {
    
    function getData() public pure returns(uint256) {
        return 2;
    }
} 


contract sonA is baseA, baseB {
    
    function getSonData() public pure returns(uint256){
        return 3;
    }
    
    function getData3() public pure returns(uint256) {
        return baseA.getData();
    }
}