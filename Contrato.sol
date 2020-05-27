pragma solidity '0.6.6';


contract Contrato{
    
    
    string public compradorNome;
    string public vendedorNome;
    uint public valorDoBem;
    
    address private owner;
    
    constructor( string memory comprador, string memory vendedor, uint valor) public {
        compradorNome = comprador;
        vendedorNome  = vendedor;
        valorDoBem    = valor;
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
    }
    
    function getComprador() public view returns (string memory) {
        return compradorNome;
    }
    
    function getValorDoBem() public view returns (uint) {
        return valorDoBem;
    }

    
    
}
