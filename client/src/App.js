
import Newgame from './Newgame'
import GameContainer from './GameContainer'
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
     {game ? <GameContainer data={response.data} /> : <Newgame handleStart={handleStart} />}
    </>
  )

}

