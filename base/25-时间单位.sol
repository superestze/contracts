pragma solidity ^0.4.0;

contract TimeUnit{

    function f1() pure public returns (bool) {
        return 1 == 1 seconds;
    }
    
    function f2() pure public returns (bool) {
        return 1 minutes == 60 seconds;
    }
    
    function f3() pure public returns (bool) {
        return 1 hours == 60 minutes;
    }
    
    function f4() pure public returns (bool) {
        return 1 days == 24 hours;
    }
    
    function f5() pure public returns (bool) {
        return 1 weeks == 7 days;
    }
    
    function f6() pure public returns (bool) {
        return 1 years == 365 days;
    }
}