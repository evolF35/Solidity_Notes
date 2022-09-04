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



// Variables
// 3 types:
// local - declared inside a function, not stored on blockchain
// states - declared outside a function, stored on the blockchain
//global - provides information about the blockchain



contract Variables {

    //stored on the blockchain
    string public text = "Hello";
    uint256 public num = 123;
    
    function doSomething() public{
        // local variables are not saved to the blockchain
        uint i = 1;


        uint timestamp = block.timestamp; // current block timestamp
        address sender = msg.sender; // address of the caller
    }
}

contract Constants {

    // variables that cannot be modified
    //value is hard coded, can save gas cost
    // for constants the convention is all uppercase
    

    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;

    uint public constant MY_UINT = 123;

}

contract Immutable {
    address public immutable ADDRESS_MY;
    uint public immutable UINT_MY;

    constructor(uint _myUint){
        UINT_MY = _myUint;
        ADDRESS_MY = msg.sender;
    }
}
//immutable variables are like constants
// except they can be set inside the constructor but
// cannot be modified afterwards

// to write or update a state variable you need to send a transaction
// on the other hand you can read state variables for free without a transaction fee

contract SimpleStorage {
    uint public num;

    function set(uint _num) public {
        num = _num;
    }

    function get() public view returns (uint) {
        return num;
    }
}


contract EtherUnits {
    uint public oneWei = 1 wei;
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    bool public isOneEther = 1 ether == 1e18;
}


//How much gas do you need to pay for a transaction?
// gas_spent * gas_price
//gas is a unit of computation
//gas_spent is total amount of gas used in a transaction
// gas price is how much ether you are willing to pay per gas

// transactions with a higher gas price have a higher priority to be included
// in a block

// unspent gas will be refunded


contract Gas {
    uint public i = 0;

    function foeva() public {
        while(true){
            i += 1;
            //transaction fails because all gas is spent eventually
        }
    }

    // using up all gas causes transaction to fail,
    // state changes are undone
    // gas spent not refunded
}


contract IfElse {

    function foo(uint x) public pure returns (uint) {
        if(x < 10){
            return 0;
        }
        else if (x < 20){
            return 1;
        }
        else {
            return 2;
        }
    }

    function ternary(uint _x) public pure returns (uint){
        return(_x < 10 ? 1:2);
    }    
}


contract Loop {
    function loop() public {
        for(uint i = 0; i < 10; i++){
            if(i == 3){
                continue;
            }
            if(i == 5){
                break;
            }
        }

        uint j = 0;
        while(j < 10){
            j++;
        }

    }
}


// Mapping
//syntax : mapping(keyType => valueType)

//keyType can be any built-in value type,bytes, string, or any contract

//valueType can be any type including another mapping or an array

// mappings are not iterable


contract Mapping{

    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        return myMap[_addr];

    //mapping always returns a value
    // if the value was never set, it will return the default value
    }

    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
        // update the value at this address
    }

    function remove(address _addr) public {
        delete myMap[_addr];
        //reset to the default value
    }
}

contract NestedMapping {
    // nested mapping, mapping from address to another mapping

    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool){
        return(nested[_addr1][_i]);
        // you can get values froma  nested mapping
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}











