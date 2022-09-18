// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.13;

// structs:


// can create own type
// useful for grouping together data
// can be declared outside and imported in 
//another contract


contract Todos {
    struct Todo{
        string text;
        bool completed;
    }


    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct

        todos.push(Todo(_text,false));

        todos.push(Todo({text: _text,completed: false}));

        Todo memory todo;
        todo.text = _text;

        todos.push(todo);
    }


    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

}


// Variables are declared either as storage, memory, or calldata

// storage == state variable, stored on the blockchain
// memory == variable is in memory, exists while the function is being called
// calldata == special data location that contains the function arguements


contract DataLocations {
    
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }

    mapping(uint => MyStruct) myStructs;

    function f() public {
        _f(arr,map,myStructs[1]);
        
        MyStruct storage MyStruct = myStructs[1];

        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f( uint[] storage _arr, mapping(uint => address) 
    storage _map, MyStruct storage _myStruct) internal {

    }

    function g(uint[] memory _arr) public returns (uint[] memory) {

    }


    function h(uint[] calldata _arr) external {
        
    }






}


