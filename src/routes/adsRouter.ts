import express from 'express';
import dbQueryWithData from '../helpers/helper';
import { AdsObjType } from '../helpers/types';

const adsRouter = express.Router();

adsRouter.get('/ads', async (_req, res) => {
  const sql = 'SELECT * FROM ads';
  const [adsArr, error] = await dbQueryWithData<AdsObjType[]>(sql);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  return res.status(200).json(adsArr);
});

adsRouter.get('/ads/:id', async (req, res) => {
  const { id } = req.params;
  const sql = 'SELECT * FROM ads WHERE id = ?';
  const [singleAd, error] = await dbQueryWithData<AdsObjType[]>(sql, [id]);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  if (singleAd.length === 0) {
    return res.status(404).json({ error: 'Ad not found' });
  }
  return res.status(200).json(singleAd);
});

adsRouter.post('/ads', async (req, res) => {
  const { title, main_img_url, description, price, phone, type, town_id, user_id, category_id } =
    req.body;
  const argArr = [
    title,
    main_img_url,
    description,
    price,
    phone,
    type,
    town_id,
    user_id,
    category_id,
  ];
  const sql =
    'INSERT INTO ads (title, main_img_url, description, price, phone, type, town_id, user_id, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
  const [newAd, error] = await dbQueryWithData<AdsObjType>(sql, argArr);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  return res.status(201).json(newAd);
});

adsRouter.delete('/ads/:id', async (req, res) => {
  const { id } = req.params;
  const sql = 'UPDATE ads SET is_published = 0 WHERE ads.id = ?';
  const [deletedAd, error] = await dbQueryWithData<AdsObjType[]>(sql, [id]);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  if (deletedAd.length === 0) {
    return res.status(404).json({ error: 'Ad not found' });
  }
  return res.status(200).json(deletedAd);
});
export default adsRouter;
