// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Deposit {
    mapping(address => uint) public depositors;
    uint counter;

    function deposit() public payable {
        require(msg.value >= 1 ether,"The minimum amount entered should be 1 ether");
        depositors[msg.sender] += msg.value;
    }

    function withdrawal() public {
        require(depositors[msg.sender] > 0,"You have not deposited any amount of ether");
        if (counter == 0) {
            payable(msg.sender).transfer(depositors[msg.sender] - ((depositors[msg.sender] / 100) * 10));
        }
        else if(counter == 1) {
            payable(msg.sender).transfer(depositors[msg.sender] - ((depositors[msg.sender] / 100) * 20));
        }
        else if(counter == 2) {
            payable(msg.sender).transfer(depositors[msg.sender] - ((depositors[msg.sender] / 100) * 30));
        }
        else {
            payable(msg.sender).transfer(depositors[msg.sender]);
        }
        depositors[msg.sender] = 0;
        counter += 1;
    }
}