// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Storage} from "../src/Storage.sol";

contract CounterTest is Test {
    Storage public storageContract;

    function setUp() public {
        storageContract = new Storage();
    }

    function test_StoreAndRetrieve() public {
        storageContract.store(50);
        uint256 result = storageContract.retrieve();
        assertEq(result, 50);
    }

    function testFuzz_StoreRetrieve(uint256 x) public {
        storageContract.store(x);
        uint256 result = storageContract.retrieve();
        assertEq(result, x);
    }
}