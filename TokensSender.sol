pragma solidity ^0.4.24;

// clipped version of Ownable contract
contract Ownable {
    address public owner;

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

// ZOO token interface, we need only transfer function
contract ERC20RewardToken {
  function transfer(address to, uint256 value) public returns (bool);
}

// just list of receivers
contract Receivers {
    
    address[250] public receivers = [
    // there need to place up to 250 addresses of receivers
0x097Ff7E2DEce4d62a190f8a3bCC039981bE31de4
    ];
}

// main functions of sender
contract TokensSender is Receivers, Ownable {
    
    // link to ZOO token
    ERC20RewardToken public token;
    
    // counters
    uint8 public receiversLimit = 250;
    uint8 public receiversCount = 0;
    
    constructor() public {
        // setting default ZOO Token address
        token = ERC20RewardToken(0xe31515fe3023e715650eb2307379244c40cdbc95);
    }
    
    // send function, available for all
    // data uses from contract and there no sense to do an owner check
    function sendTokens(uint8 _count) external {
        
        for(uint8 i = 0; i < _count; i++)
        {
            if(receiversCount >= receiversLimit)
                continue;
            
            // sending to current address in queue 2 ZOO Tokens
            // 2 * 10**6 = 2000000
            token.transfer(receivers[receiversCount], 2000000);
            receiversCount++;
        }
    }
    
    // emergency changing token address
    function setRewardToken(address _tokenAddr) onlyOwner external {
        token = ERC20RewardToken(_tokenAddr);
    }
    
    // emergency withdraw
    function withdraw(uint256 _value) onlyOwner external {
        token.transfer(msg.sender, _value);
    }
}
