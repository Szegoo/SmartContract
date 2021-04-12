pragma solidity >=0.4.21 <0.8.0;
import "./MojContract.sol";

contract DepositContract is MojContract {
    uint256 public totalSupply;
    mapping(address => uint256) balances;

    function buyToken() public payable {
        uint256 amount = (msg.value / (10**18)) * 10;
        balances[msg.sender] = amount;
    }

    function TransferToETH(uint256 _amount) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
        uint256 inEth = (_amount * (10**18)) / 10;
        msg.sender.transfer(inEth);
    }

    function Broj(uint256 broj) internal pure returns (uint256) {
        return sum(broj, broj);
    }

    function balance() public view returns (uint256) {
        return uint256(balances[msg.sender]);
    }
}
