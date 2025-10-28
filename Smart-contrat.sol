// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleFaucet {
    // Fonction pour recevoir de l'ETH
    receive() external payable {}

    // Fonction pour envoyer de l'ETH à quelqu'un
    function sendTo(address payable _to, uint _amount) public {
        require(address(this).balance >= _amount, "Pas assez de fonds dans le faucet");
        _to.transfer(_amount);
    }

    // Vérifier le solde du contrat
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
