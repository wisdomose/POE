// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract ProofOfExistence {
    bytes32[] private store;

    // hash and store in array
    function hash(string memory _string) public {
        bytes32 h = keccak256(abi.encodePacked(_string));
        store.push(h);
    }

    // proof string has been hashed
    function proof(string memory _string) public view returns (bool) {
        bytes32 a = keccak256(abi.encodePacked(_string));
        for (uint256 i = 0; i < store.length; i++) {
            if (store[i] == a) {
                return true;
            }
        }
        return false;
    }
}
