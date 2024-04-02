import express from 'express';
import { CategoryObjType } from '../helpers/types';
import dbQueryWithData from '../helpers/helper';

const catRouter = express.Router();

catRouter.get('/categories', async (_req, res) => {
  const sql = 'SELECT * FROM categories';
  const [categories, error] = await dbQueryWithData<CategoryObjType[]>(sql);
  if (error) {
    console.warn('get categories error ===', error);
    return res.status(500).json({ error: 'something went wrong' });
  }
  res.json(categories);
});

export default catRouter;
