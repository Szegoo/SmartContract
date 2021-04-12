pragma solidity >=0.4.21 <0.8.0;

contract MojContract {
    function sum(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a + _b;
    }

    function sub(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a - _b;
    }
}
