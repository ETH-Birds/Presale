pragma solidity ^0.4.23;

/**
 * Warning! 
 * This is a fake version of gene generator contract. This contract is necessary just to run smart contract of the presale for our developers and for you!
 * The real version of the generator is strictly secret and will not be published.
 */


contract MixGenFake{
    
    address public parent;
    
    constructor(address _nftAddr) public {
        parent = _nftAddr;
    }
 
    bool public isMixGen = true;
 
    function () public payable {
        revert();
    }
    
    function openEgg(uint64 userNumber, uint16 eggQuality) public pure returns (uint256 genes, uint16 quality) {
	  genes = 42120379430592025765448033768736856703739151940001904851365893011+userNumber;
      quality = eggQuality;
    }
	
	function uniquePet(uint64 newPetId) public pure returns (uint256 genes, uint16 quality) {
        genes = 42120379430592025765448033768736856703739151940001904851365893011+newPetId;
		quality = 32223;
    }
}