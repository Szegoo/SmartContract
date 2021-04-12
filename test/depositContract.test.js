const DepositContract = artifacts.require('DepositContract');

contract('DepositContract', (accounts) => {
    it('Should deploy the smart contract', async() => {
        const depositContract = await DepositContract.deployed();
        assert(depositContract.address !== '');
    });
    it('Proverava da li balance vraca 0', async() => {
        const depositContract = await DepositContract.deployed();
        const result = await depositContract.balance({from: accounts[0]});
        assert.equal(result, 0);
    });
    it('Proverava kupovinu', async() => {
        const depositContract = await DepositContract.deployed();
        await depositContract.buyToken({from: accounts[0], value: web3.utils.toWei("1", "ether")});
        const balance = await depositContract.balance({from: accounts[0]});
        assert.equal(balance, 10);
    })
})