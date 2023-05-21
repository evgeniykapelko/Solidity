// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Ownable.sol";

abstract contract Balances is Ownable {
    function getBalance() public view onlyOwner returns(uint) {
        return address(this).balance;
    }
    function withdraw(address payable _to) public override virtual onlyOwner {
        _to.transfer(getBalance());
    }
}

contract MyContract is Ownable, Balances {
    constructor(address _owner) Ownable(_owner) {

    }

    function withdraw(address payable _to) public override(Ownable, Balances) virtual onlyOwner {
        //_to.transfer(getBalance());
        //Balances.withdraw(_to);
        require(_to != address(0), "zero address");
        super.withdraw(_to);
    }
}