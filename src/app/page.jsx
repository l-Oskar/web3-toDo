"use client";
import { useState, useEffect, useContext } from "react";
import { ToDoListContext, ToDoListProvider } from "@/context/ToDoListApp";

const Home = () => {
  const { checkIfWalletsIsConnected } = useContext(ToDoListContext);

  useEffect(() => {
    checkIfWalletsIsConnected();
  }, []);
  return <h1>Hello</h1>;
};

export default Home;
