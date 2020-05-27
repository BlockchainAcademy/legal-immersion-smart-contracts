pragma solidity '0.6.6';

contract MeuSmartContract2{
    
    string private compradorNome;

    string private vendedorNome;
    
    string private nomeDoBem;

    uint private valorDoBem;
    
    address payable private owner;
    
    bool public estaAVenda = false;
    
    constructor(string memory donoAtual, uint valor, string memory nomedoBem) public {
        vendedorNome  = donoAtual;
        valorDoBem    = valor;
        nomeDoBem     = "Ainda nao informado";
        owner         = msg.sender; // quem esta fazendo o deploy do smart contract
        nomeDoBem = nomedoBem;
    }
    
    function comprar(string memory novoComprador) public payable {
        require(estaAVenda);
        require(msg.value == 1 ether);
        uint256 amount = msg.value;
        owner.transfer(amount);
        
        vendedorNome  = compradorNome;
        compradorNome = novoComprador;
        owner = msg.sender;
        estaAVenda = false;
    }
    
    function colocarAVenda() public {
        estaAVenda = true;
    }

    
    function getComprador() public view returns (string memory){
        if(msg.sender == owner){
            return compradorNome;
        }else{
            return "Voce nao tem permisao";
        }
    }
    
    function getVendedor() public view returns (string memory){
       if(msg.sender == owner){
            return vendedorNome;
        }else{
            return "Voce nao tem permisao";
        }
    }
    
    function getValor() public view returns (uint){
        if(msg.sender == owner){
            return valorDoBem;
        }else{
            return 0;
        }
    }
    
    function getNomeDoBem() public view returns (string memory){
        return nomeDoBem;
    }

    
}
