// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface TheNaanSpot{
    function name()external  view returns(string memory);
    function symbel()external view returns(string memory);
    function totalSupplu()external view returns(uint);
    function transfer(address _to,uint _amount)external  returns(bool);
    function balanceOf()external view returns(uint);

}
contract Naan is TheNaanSpot{
    string private tokenName;
    string private tsymbol;
    uint private tTotalSupply;
    address private owner;
constructor(string memory _tokenName,string memory _tsymbol,uint _tTotalSupply){
tokenName =_tokenName;
tsymbol=_tsymbol;
tTotalSupply=_tTotalSupply;
balanceof[msg.sender]+= _tTotalSupply;
}

    mapping(address =>uint) public balanceof;
function name()external  view returns(string memory){
    return tokenName;
}

    function symbel()external view returns(string memory){
        return tsymbol;
    }
    function totalSupplu()external view returns(uint){
   return tTotalSupply;
    }
    function transfer(address _to,uint _amount)external returns (bool){
     require(_amount<=balanceof[msg.sender],"balance is low");
        uint oldBalance=balanceof[msg.sender];
        balanceof[msg.sender] -=_amount;
        balanceof [_to] +=_amount;
        if (oldBalance==balanceof[msg.sender]){
            return false;
        }else
        return true;
    }
    function balanceOf()external view returns(uint){
        return balanceof[msg.sender];
    }


}
