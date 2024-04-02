export type AdsObjType = {
  id: number;
  title: string;
  main_img_url: string;
  description: string;
  price: number;
  phone: number;
  type: string;
  town_id: number;
  user_id: number;
  category_id: number;
  created_at: string;
  is_published: number;
};
export type UserObjType = {
  id: number;
  name: string;
  email: string;
  password: string;
  avatar_url: string;
  created_at: string;
};
export type TownObjType = {
  id: number;
  name: string;
  population: number;
  area: number;
};
export type CategoryObjType = {
  id: number;
  name: string;
};
