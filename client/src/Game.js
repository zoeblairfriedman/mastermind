import React from 'react';
import { useState } from 'react';
import axios from 'axios'



export default function Game(props) {

  const [guess, setGuess] = useState();

  const handleSubmit = (event) => {
    event.preventDefault()
    axios.get(`http://localhost:3001/games/${props.data.game}?guess=${guess}`)
      .then(response => {
        handleResponse(response)
      })
      .catch(error => console.log('api errors:', error))
  }

  const handleResponse = (response) => {
    console.log(response)
    if (response.data.won === false) props.handleLoss()
    if (response.data.won === true) props.handleWin()
    let instructions = document.getElementById("instructions")
    instructions.innerText = `${response.data.message}. You have ${response.data.turns} turns left.`
  }

  return (
    <div id="game">
      <h2 id="instructions">{props.data.message}</h2>
      <div id="guesses">
        <h3 className="incorrect" id="0">X</h3>
        <h3 className="incorrect" id="1">X</h3>
        <h3 className="incorrect" id="2">X</h3>
        <h3 className="incorrect" id="3">X</h3>
      </div>
      <form onSubmit={handleSubmit}>
        <label>guess:
          <input onChange={e => setGuess(e.target.value)} type="text" name="guess" />
        </label>
        <input type="submit" value="submit guess" />
      </form>
    </div>
  )
}
