// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleFaucet {
    constructor() payable {}

    receive() external payable {}

    function sendTo(address payable _to, uint _amount) public {
        require(address(this).balance >= _amount, "Pas assez de fonds dans le faucet");
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Echec du transfert ETH");
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
