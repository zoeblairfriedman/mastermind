export default function Signup() {


  return (
    <form>
      <label>
        username:
     <input type="text" name="username" />
      </label>
      <label>
        password:
    <input type="text" name="password" />
      </label>
      <label>
        verify password:
    <input type="text" name="verify password" />
      </label>
      <input type="submit" value="Submit" />
    </form>
  )
}