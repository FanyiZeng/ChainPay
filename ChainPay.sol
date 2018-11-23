pragma solidity ^0.4.24;

import "./ERC20Basic.sol";


/**
 * @title ERC20 Contract Pay
 * @dev see https://github.com/FanyiZeng/ChainPay
 */
contract ChainPay {
    
    address public _belonger;
    
    constructor() public {
        _belonger = msg.sender;
    }
    
    function pay(address token,uint256 value,address to) public returns (address) {
        require(tx.origin == _belonger);
        ERC20Basic(token).transfer(to,value);
        return msg.sender;
    }
}

contract Demo {
    constructor() public {
        
    }
    
    function recive(address chainpay,address token, uint256 value) public returns (uint256){
        ChainPay(chainpay).pay(token,value,address(this));
        return ERC20Basic(token).balanceOf(address(this));
    }
}
