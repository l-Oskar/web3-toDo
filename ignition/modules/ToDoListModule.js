const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("ToDoAppModule", (m) => {
  const myContract = m.contract("ToDoList");

  return { myContract };
});
