//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract ECRecover {

    using ECDSA for bytes32;

    function verify(string memory message, bytes memory signature) public pure returns (address) {
        bytes32 ethHashMessage = ECDSA.toEthSignedMessageHash(bytes(message));
        return ethHashMessage.recover(signature);
    }
}