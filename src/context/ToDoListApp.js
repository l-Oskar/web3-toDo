"use client";
import { useState, createContext } from "react";
import { toDoListAddress, toDoListABI } from "./constants";
import { ethers } from "ethers";

const fetchContract = (signerOrProvider) =>
  new ethers.Contract(toDoListAddress, toDoListABI, signerOrProvider);

export const ToDoListContext = createContext();

export const ToDoListProvider = ({ children }) => {
  const [currentAccount, setCurrentAccount] = useState("");
  const [error, setError] = useState("");
  const [allToDoList, setAllToDoList] = useState([]);
  const [myList, setMyList] = useState("");

  const [allAddress, setAllAddress] = useState([]);

  const checkIfWalletsIsConnected = async () => {
    if (!window.ethereum) return setError("Please install MetaMask");

    const account = await window.ethereum.request({
      method: "eth_requestAccounts",
    });

    if (account.length) {
      setCurrentAccount(account[0]);
      console.log(account[0]);
    } else {
      setError("Please Install MetaMask & connect, reload");
    }
  };

  // useEffect(() => {
  //   checkIfWalletsIsConnected();
  // }, []);

  return (
    <ToDoListContext.Provider value={{ checkIfWalletsIsConnected }}>
      {children}
    </ToDoListContext.Provider>
  );
};
