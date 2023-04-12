// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


contract ViewAndPureExampls {
   uint public myStorageVariable;

   function readMyStorgeVariable() public view returns(uint) {
       return myStorageVariable;
   } 


   function updateStorageVariable(uint _newVar) public {
       myStorageVariable = _newVar;
   }


   function calculateFunction(uint a, uint b) public pure returns(uint){
        return a + b;
   }
   
   
   function multiplicationFunction(uint a, uint b) public pure returns(uint) {
       return a*b;
   }


}