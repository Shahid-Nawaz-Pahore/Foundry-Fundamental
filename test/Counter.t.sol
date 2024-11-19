// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);

    }
   
    function test_InitialNumber() public {
        assertEq(counter.getNumber(), 0, "Initial number should be zero");
    }
     
    function test_SetNumber() public {
        uint256 newNumber = 90;
        counter.setNumber(newNumber);
        assertEq(counter.getNumber(), newNumber, "Number should be match the set number");
    }
    function test_Increment() public {
       counter.setNumber(10); // Set an initial number
        counter.increment();
        assertEq(counter.getNumber(), 11, "Number should increment by 1");
    }
    function test_decreament() public{
        counter.setNumber(10); // Set an initial number
        counter.decreament();
        assertEq(counter.getNumber(), 9, "Number should decrement by 1");
    }
        function test_IncrementAndDecrement() public {
        counter.setNumber(5);
        counter.increment();
        counter.decreament();
        assertEq(counter.getNumber(), 5, "Number should remain unchanged");
    }
    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
