import 'dotenv/config';
import express from 'express';
import morgan from 'morgan';
import cors from 'cors';

import { PORT } from './config.js';
import testConnection from './helpers/msqlTestRoute.js';
import adsRouter from './routes/adsRouter.js';
import authRouter from './routes/authRouter.js';
import townRouter from './routes/townRouter.js';
import catRouter from './routes/categoryRouter.js';

const app = express();

const port = PORT || 5000;
testConnection();

// middleware

app.use(morgan('dev'));
app.use(cors());
app.use(express.json());

// Routes

app.use('/api', adsRouter);
app.use('/auth', authRouter);
app.use('/api', townRouter);
app.use('/api', catRouter);

app.use('*', (_req, res) => {
  res.status(404).json({ error: 'not found' });
});

app.listen(port, () => {
  console.log(`Server runing on http://localhost:${port}`);
});
