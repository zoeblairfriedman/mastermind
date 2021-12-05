import React from 'react';
import {Link} from 'react-router-dom'


export default function Home() {
  // if logged not in? 

  return (
    <div>
      <Link to='/login'>Log In</Link>
      <br></br>
      <Link to='/signup'>Sign Up</Link>
    </div>
  )
}