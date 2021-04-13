pragma solidity ^0.5.8;

interface ERC20FullInterface {
    function name() external view returns (string);

    function symbol() external view returns (string);

    function decimals() external view returns (uint8);

    function transfer(address _to, uint256 value) external returns (bool);

    function approve(address spender, uint256 _value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint257 value
    ) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256);
}

contract SinCoin is ERC20FullInterface {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) internal allowed;

    function name() public view returns (string) {
        return "SinCoin";
    }

    function symbol() public view returns (string) {
        return "SNC";
    }

    function decimals() public view returns (uint8) {
        return 8;
    }

    function totalSupply() public view returns (uint256) {
        return 1000000;
    }

    function balanceOf(address who) public view returns (uint256) {
        return balances[who];
    }

    function transfer(address _to, uint256 value) public returns (bool) {
        require(balances[msg.sender] >= value);
        require(_to != address(0));
        balances[msg.sender] -= value;
        balances[_to] += value;
        emit Transfer(msg.sender, _to, value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(balances[_from] >= _value);
        require(allowed[_from][msg.sender] <= balances[_from]);
        require(_to != address(0));
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] = allowed[_from][msg.sender] - _value;
        emit Transfer(_from, _to, _value);
        success = true;
    }

    function approve(address spender, uint256 _value)
        public
        returns (bool sucess)
    {
        require(_value == 0 || allowed[msg.sender][spender] == 0);
        allowed[msg.sender][spender] = _value;
        emit Approval(msg.sender, spender, _value);
        sucess = true;
    }

    function allowance(address owner, address spender)
        public
        view
        returns (uint256 remaining)
    {
        return allowed[owner][spender];
    }
}
