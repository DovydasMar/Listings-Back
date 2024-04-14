import express from 'express';
import { TownObjType } from '../helpers/types';
import dbQueryWithData from '../helpers/helper';
import { ResultSetHeader } from 'mysql2';

const townRouter = express.Router();

townRouter.get('/towns', async (_req, res) => {
  const sql = `SELECT towns.id, towns.name , towns.population, towns.area, towns.img_url, COUNT(ads.id) AS kiekis  FROM towns
  LEFT JOIN ads 
  ON towns.id = ads.town_id
  GROUP BY towns.id, towns.name, towns.population, towns.area, towns.img_url
  `;
  const [towns, error] = await dbQueryWithData<TownObjType[]>(sql);
  if (error) {
    console.warn('get towns error ===', error);
    return res.status(500).json({ error: 'something went wrong' });
  }
  res.json(towns);
});

townRouter.get('/towns/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `SELECT towns.id, towns.name , towns.population, towns.area, towns.img_url, towns.img_1, towns.img_2, towns.img_3, towns.description  FROM towns
  where id = ? AND isDeleted= 0`;
  const [towns, error] = await dbQueryWithData<TownObjType[]>(sql, [id]);
  if (error) {
    console.warn('get towns error ===', error);
    return res.status(500).json({ error: 'something went wrong' });
  }
  res.json(towns[0]);
});

townRouter.post('/towns', async (req, res) => {
  const { name, population, area } = req.body;
  const sql = 'INSERT INTO towns (name, population, area) VALUES (?, ?, ?)';
  const [result, error] = await dbQueryWithData<ResultSetHeader>(sql, [name, population, area]);
  if (error) {
    console.warn('insert town error ===', error);
    return res.status(500).json({ error: 'something went wrong' });
  }
  res.json({ success: true, id: result.insertId });
});

townRouter.delete('/towns/:id', async (req, res) => {
  const { id } = req.params;
  const sql = 'UPDATE towns SET isDeleted = 1 WHERE towns.id = ?';
  const [result, error] = await dbQueryWithData<ResultSetHeader>(sql, [id]);
  if (error) {
    console.warn('delete town error ===', error);
    return res.status(500).json({ error: 'something went wrong' });
  }
  if (result.affectedRows === 0) {
    return res.status(400).json({ error: 'town was not deleted' });
  }
  res.json({ success: true });
});
export default townRouter;
