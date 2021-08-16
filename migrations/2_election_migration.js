const Election = artifacts.require("Election.sol");

module.exports = function (deployer, network, accounts) {
  const userAddress = accounts[0];
  deployer.deploy(Election,userAddress);
};
