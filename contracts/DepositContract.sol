pragma solidity >=0.4.21 <0.8.0;
import "./MojContract.sol";

contract DepositContract is MojContract {
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    function buyToken() public payable {
        uint256 amount = (msg.value / (10**18)) * 10;
        balances[msg.sender] = amount;
    }

    function transferToETH(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "not enough tokens");
        balances[msg.sender] -= _amount;
        uint256 inEth = (_amount * (10**18)) / 10;
        msg.sender.transfer(inEth);
    }

    function broj(uint256 _broj) internal pure returns (uint256) {
        return sum(_broj, _broj);
    }

    function balance() public view returns (uint256) {
        return uint256(balances[msg.sender]);
    }
}
