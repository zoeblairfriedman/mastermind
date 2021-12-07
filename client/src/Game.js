import React from 'react';
import axios from 'axios'
import { useState } from 'react';



export default function Game(props) {
  const [guess, setGuess] = useState();

  const handleSubmit = (event) => {
    event.preventDefault()
    axios.get(`http://localhost:3001/games/${props.data.game}?guess=${guess}`)
      .then(response => {
        console.log(response)
      })
      .catch(error => console.log('api errors:', error))
  }


  return (
    <div>
      <h2>{props.data.message}</h2>
      <h2>Game ID: {props.data.game}</h2>
      <form onSubmit={handleSubmit}>
        <label>guess:
          <input onChange={e => setGuess(e.target.value)} type="text" name="guess"/>
        </label>
        <input type="submit" value="submit guess" />
      </form>
    </div>
  )
}
