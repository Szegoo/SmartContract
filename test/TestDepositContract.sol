pragma solidity ^0.7.6;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/DepositContract.sol";

contract TestDepositContract {
    DepositContract mycontract;

    function beforeEach() public {
        mycontract = DepositContract(DeployedAddresses.DepositContract());
    }

    function testBuying() public {
        address adresa = address(mycontract);
        uint256 balance = adresa.balance;
        Assert.equal(balance, uint256(0), "Balanse je nula");
    }
}
