pragma solidity ^0.4.20;


contract test {
    //id -> name
    mapping(uint => string) id_names;
    
    constructor()  public{
        id_names[1] = "lily";
        id_names[2] = "Jim";
        id_names[2] = "Lily";
    }
    
    function getNameById(uint id)  public view returns (string){
        //加上storage如何赋值？
        string storage name = id_names[id];
        return name;
    }
    
    function setNameById(uint id)  public returns (string){
        // mapping(uint => string) memory id_name = id_names;
        // var ids = id_names;
        id_names[id] = "Hello";
    } 
    
    
    // function getMapLength() public returns (uint){
    //     return id_names.length;
    // }
    
}