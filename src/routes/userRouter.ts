import express from 'express';
import dbQueryWithData from '../helpers/helper';
import { UserObjTypeNoPass } from '../helpers/types';

const userRouter = express.Router();

userRouter.get('/users/:user_id', async (req, res) => {
  const { user_id } = req.params;
  const sql = 'SELECT id, name, email, avatar_url, created_at FROM users where id = ?';
  const [user, error] = await dbQueryWithData<UserObjTypeNoPass[]>(sql, [user_id]);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  return res.status(200).json(user[0]);
});

export default userRouter;
