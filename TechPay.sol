// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TECHPAY {
    string public name = "TECHPAY";
    string public symbol = "TPAY";
    uint8 public decimals = 18;
    uint256 public totalSupply = 10 * 10 ** uint256(decimals);

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Saldo insuficiente");

        // Transferir tokens
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        return true;
    }

    function approve(address spender, uint256 value) public returns (bool success) {
        allowance[msg.sender][spender] = value;
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(balanceOf[from] >= value, "Saldo insuficiente");
        require(allowance[from][msg.sender] >= value, "Limite de transferencia excedido");

        // Transferir tokens
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;

        return true;
    }
}
