pragma solidity >=0.8.x <0.9.0;


contract Test {

    function test() public pure returns(uint256, uint256){
        var i = 0;
        uint256 count = 0;
        
        for (; i < 257; i++) {
            count++;
            
            if (count > 260) {
                break;
            } 
        }
        
        return (i, count);
    } 
} 