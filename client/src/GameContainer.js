import React from 'react';
import { useState } from 'react';
import Game from './Game'
import Won from './Won'
import Lost from './Lost'



export default function GameContainer(props) {
  const [won, setWin] = useState(false)
  const [lost, setLoss] = useState(false)
  
  const handleLoss = () => {
    setLoss(true)
  }  

  const handleWin = () => {
    setWin(true)
  }  

  let display;
  if (won) {
    display = <Won />
  } else if (lost) {
    display = <Lost />
  } else {
    display = <Game handleLoss={handleLoss} handleWin={handleWin} data={props.data} />
  }


  return (
    <>
      {display}
    </>
  )
}
