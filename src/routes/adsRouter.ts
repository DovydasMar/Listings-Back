import express from 'express';
import dbQueryWithData from '../helpers/helper';
import { AdsObjType } from '../helpers/types';

const adsRouter = express.Router();

adsRouter.get('/ads', async (_req, res) => {
  const sql = `SELECT 
  ads.*, 
  ads_pic.ad_pic_1, 
  ads_pic.ad_pic_2, 
  ads_pic.ad_pic_3, 
  ads_pic.ad_pic_4, 
  ads_pic.ad_pic_5, 
  towns.name AS town, 
  categories.name AS category
FROM 
  ads
LEFT JOIN 
  towns ON ads.town_id = towns.id
LEFT JOIN 
  categories ON ads.category_id = categories.id
LEFT JOIN 
  ads_pic ON ads.id = ads_pic.ad_id
WHERE 
  is_published = 1;`;
  const [adsArr, error] = await dbQueryWithData<AdsObjType[]>(sql);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  return res.status(200).json(adsArr);
});

adsRouter.get('/ads/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `SELECT 
    ads.*, 
    ads_pic.ad_pic_1 as pic1, 
    ads_pic.ad_pic_2 as pic2, 
    ads_pic.ad_pic_3 as pic3, 
    ads_pic.ad_pic_4 as pic4, 
    ads_pic.ad_pic_5 as pic5, 
    towns.name AS town, 
    categories.name AS category
FROM 
    ads
LEFT JOIN 
    towns ON ads.town_id = towns.id
LEFT JOIN 
    categories ON ads.category_id = categories.id
LEFT JOIN 
    ads_pic ON ads.id = ads_pic.ad_id
WHERE 
    ads.id = ? AND
    is_published = 1`;
  const [singleAd, error] = await dbQueryWithData<AdsObjType[]>(sql, [id]);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  if (singleAd.length === 0) {
    return res.status(404).json({ error: 'Ad not found' });
  }
  return res.status(200).json(singleAd[0]);
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
  console.log('user_id ===', user_id);
  if (user_id === 0) {
    return res.status(400).json({ error: 'turite buti prisijungęs, kad sukurti skelbimą' });
  }
  const sql =
    'INSERT INTO ads (title, main_img_url, description, price, phone, type, town_id, user_id, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)';
  const [newAd, error] = await dbQueryWithData<AdsObjType>(sql, argArr);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  return res.status(201).json(newAd);
});
adsRouter.get('/ads/town/:town_id', async (req, res) => {
  const { town_id } = req.params;
  const sql = `SELECT ads.id, ads.title, ads.main_img_url, ads.description, ads.price, ads.phone, ads.type, ads.town_id, ads.user_id, ads.category_id, ads.created_at , towns.name as town, categories.name as category
  FROM ads
  left join towns on ads.town_id = towns.id
  left join categories on ads.category_id = categories.id
  where ads.town_id = ? and is_published = 1`;
  const [adsArr, error] = await dbQueryWithData<AdsObjType[]>(sql, [town_id]);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  return res.status(200).json(adsArr);
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

adsRouter.get('/ads/user/:user_id', async (req, res) => {
  const { user_id } = req.params;
  const sql = `
  SELECT ads.id, ads.title, ads.main_img_url, ads.description, ads.price, ads.phone, ads.type, ads.town_id, ads.user_id, ads.category_id, ads.created_at , towns.name as town, categories.name as category 
  From ads 
  left JOIN towns 
  ON towns.id = ads.town_id 
  left JOIN categories 
  on categories.id = ads.category_id 
  where ads.user_id = ? and ads.is_published = 1`;
  const [adsArr, error] = await dbQueryWithData<AdsObjType[]>(sql, [user_id]);
  if (error) {
    return res.status(500).json({ error: 'Internal Server Error' });
  }
  res.status(200).json(adsArr);
});
export default adsRouter;
