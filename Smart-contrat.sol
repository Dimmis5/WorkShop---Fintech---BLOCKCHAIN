// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleFaucet {
    
    // Event pour tracer les transferts
    event Sent(address indexed to, uint amount);

    // Constructeur pouvant recevoir des ETH à la création
    constructor() payable {}

    // Recevoir des ETH directement
    receive() external payable {}

    // Fonction pour envoyer des ETH depuis le faucet
    function sendTo(address payable _to, uint _amount) public {
        require(address(this).balance >= _amount, "Pas assez de fonds dans le faucet");
        
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Echec du transfert ETH");

        // Émettre l'event pour tracer le transfert
        emit Sent(_to, _amount);
    }

    // Vérifier le solde du contrat
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
