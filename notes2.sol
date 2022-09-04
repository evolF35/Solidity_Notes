//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.13;

contract Array {

    //several ways to initialize an array

    uint[] public arr;
    uint[] public arr2 = [1,2,3];

    //fixed sized array, all elements initialize to 0

    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity can return the entire array
    //should be voided for arrays that grow 
    // indefinitely

    function getArr() public view returns (uint[] memory){
        return(arr);
    }


    function push(uint i) public {
        //append to array
        // increase array length by 1
        arr.push(1);
    }

    function pop() public {
        //Remove last element from array
        //decrease array length by 1
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        //Delete does not change array length
        //resets the value of index to default value
        delete arr[index];
    }

    function examples() external {
        // create array in memory, only fixed size can be created
        //uint[] memory a = new uint[][5];
    }
}


contract ArrayRemoveByShifting{ 
    uint[] public arr;
    
    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for(uint i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);

        assert(arr.length == 0);
    }
}


contract ArrayReplaceFromEnd {
    uint[] public arr;

    //deleting an element creates a gap in the array.
    //one trick is to keep the array compact
    //move last element into the place to delete

    function remove(uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() public {
        arr = [1,2,3,4];

        remove(1);
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);

        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);

    }
}


// Solidity supports enumerables and they are useful to model choice and 
//keep track of state
// can be declared outside of a contract

contract Enum {
    enum Status {
        Pending,
        Shipped, 
        Accepted,
        Rejected,
        Canceled
    }



// default value is the first element listed in definition
//in this case uint

Status public status;

function get() public view returns (Status){
    return status;
}

// update status by passing uint into input
function set(Status _status) public {
    status = _status;
}

// update to a specific enum like this
function cancel() public {
    status = Status.Canceled;
}

//resets the enum to its first value, 0
function reset() public{
    delete status;
}





}


import "./EnumDeclaration.sol";
// imports the enum from enumDeclaration.
contract Enum2{
    Status public status;
}




// Structs 

// you can define your own type by creating a struct

//they are useful for grouping together related data

