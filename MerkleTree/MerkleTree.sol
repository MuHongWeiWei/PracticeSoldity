// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MerkleTree {

    bytes32 public merkleRoot = 0xc1debb20929b90b627d0bb16671b9d9edd2a58c05f27e749843d9a6b95030ccc;

    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    // ["0x999bf57501565dbd2fdcea36efa2b9aef8340a8901e3459f4a4c926275d36cdb","0x4726e4102af77216b09ccd94f40daa10531c87c4d60bba7f3b3faf5ff9f19b3c","0x2531a3b78850c6d8e81453107c37b85cc2ce315faf4369e04d5f43556cd4dd0d"]
    function verify(bytes32[] calldata _merkleProof) public view returns (bool) {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        return MerkleProof.verify(_merkleProof, merkleRoot, leaf);
    }

    function setMerkleRoot(bytes32 _merkleRoot) public {
        merkleRoot = _merkleRoot;
    }

}
