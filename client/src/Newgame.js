import React from 'react';
import axios from 'axios'





export default function Newgame(props) {
  // if logged not in? 

  const handleClick = (event) => {
    event.preventDefault()
    axios.post('http://localhost:3001/games')
      .then(response => {
        props.handleStart(response)
      })
      .catch(error => console.log('api errors:', error))
  }

  return (
    <div>
      <button onClick={handleClick}>new game</button>
    </div>
  )
}
