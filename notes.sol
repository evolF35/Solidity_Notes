// SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.13;

contract HelloWorld{
    string public greet = "Hello Wolrd";
}


contract Counter {
    uint public count;

    function get() public view returns (uint) {
        return(count);
    }

    function inc() public {
        count += 1;
    }
    
    function dec() public {
        count -= 1;
    }
}

contract Primitives {
    bool public boo = true;

    /*
    uint -- unsigned integer
    uint8 --> 0 to 2^8 - 1
    uint256 --> 0 to 2^256 - 1
     */

     uint8 public u8 = 1;
     uint public u256 = 89;
     //uint is alias to uint256

     //negative values are allowed for int types
     // int256 --> -2^255 to 2^255 - 1

     int8 public i8 = -23;
     int public i256 = -89;

    int public min8te = type(int).min; //built in min and type
    int public max8te = type(int).max; 

    address public addrr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    //address --> public address hex

    //data type byte represent a sequence of bytes
    // two types of bytes types
    // fixed-sized byte arrays
    // dynamically-sized byte arrays

    // bytes in solidity represent dynamic array of bytes

    bytes1 a = 0xb5; // 1011 0101
    bytes1 b = 0x56; // 0101 0110


    // default values:

    bool public defbool; //false
    uint public defUint; // 0
    int public defInt; // 0
    address public defAddr; // 0x0000000000000000000000000000000000000000

}

