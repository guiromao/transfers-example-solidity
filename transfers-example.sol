pragma solidity ^0.5.10;

contract TransfersExample {
    
    uint public receivedMoney;
    
    function receiveMoney() public payable {
        receivedMoney += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawMoney() public {
        address payable toAddress = msg.sender;
        toAddress.transfer(this.getBalance());
        receivedMoney = 0;
    }
    
    function withdrawMoneyToAddress(address payable toAddress) public {
        toAddress.transfer(this.getBalance());
        receivedMoney = 0;
    }
    
}