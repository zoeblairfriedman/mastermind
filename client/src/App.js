
import Newgame from './Newgame'
import Game from './Game'
import React, { useState } from 'react';

export default function App() {

  const [game, startGame] = useState(false);
  const [response, setResponse] = useState(null)


  const handleStart = (response) => {
    setResponse(response)
    startGame(true)
  }


  return (
    <>
      {game ? <Game data={response.data} /> : <Newgame handleStart={handleStart} />}
    </>
  )

}

