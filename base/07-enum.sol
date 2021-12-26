pragma solidity ^0.4.0;

contract test {
   
    enum WeekDays {
        Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    }
    
    WeekDays currentDay;
    WeekDays defaultday = WeekDays.Sunday;
    
    function setDay(WeekDays _day) public {
        currentDay = _day;
    }
    
    function getDay() public view returns(uint256) {
        return uint256(currentDay);
    }
    
    function getDefaultDay() public view returns(uint256) {
        return uint256(defaultday);   
    }
}