import express from 'express';
import dbQueryWithData from '../helpers/helper.js';
import bcrypt from 'bcrypt';
import { QueryError, ResultSetHeader } from 'mysql2';
import { UserObjType } from '../helpers/types.js';

const authRouter = express.Router();

authRouter.post('/register', async (req, res) => {
  const sql = 'INSERT INTO users ( name, email, password, avatar_url) VALUES ( ?, ?, ?, ?)';
  // gaunam visas value is fronto
  const { name, email, password, avatar_url } = req.body;

  // password hashinimas
  const hashedPassword = await bcrypt.hash(password, 10);
  // sudedu viska i array
  const argArr = [name, email, hashedPassword, avatar_url];
  const [result, error] = await dbQueryWithData<ResultSetHeader>(sql, argArr);

  if (error) {
    const msqlErr = error as QueryError;
    console.warn('insert user error ===', error);
    console.warn('error ===', error.message);
    // jei emailas jau egzistuoja
    if (msqlErr.code === 'ER_DUP_ENTRY') {
      return res.status(400).json({ error: 'Email already exists' });
    }
    // jei yra erroras nesusijes su email
    return res.status(400).json({ error: 'something went wrong' });
  }
  // jei nesukure userio
  if (result.affectedRows === 0) {
    return res.status(400).json({ error: 'user was not created' });
  }
  console.log('name ===', name);
  // grazina success, email, name ir id
  res.json({ success: true, email, name, id: result.insertId });
});

authRouter.post('/login', async (req, res) => {
  // gaunam email ir password is fronto
  const { email, password } = req.body;

  const sql = 'SELECT * FROM users WHERE email = ?';
  const [users, error] = await dbQueryWithData<UserObjType[]>(sql, [email]);
  // jei yra erroras
  if (error) {
    console.warn('select user error ===', error);
    return res.status(500).json({ error: 'something went wrong' });
  }
  // jei nera userio
  if (users.length === 0) {
    return res.status(400).json({ error: 'User does not exist' });
  }
  const userObj = users[0];
  const isPasswordCorrect = await bcrypt.compare(password, userObj.password);
  // jei passwordas neteisingas
  if (!isPasswordCorrect) {
    return res.status(400).json({ error: 'Email or Password is incorrect (p)' });
  }
  // grazina success, email, name ir id
  res.json({ success: true, email: userObj.email, name: userObj.name, id: userObj.id });
});
export default authRouter;
