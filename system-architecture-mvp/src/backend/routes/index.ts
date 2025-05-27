import { Router } from 'express';
import { exampleController } from '../controllers/index';

const router = Router();

// Define API endpoints
router.get('/example', exampleController.getExample);
router.post('/example', exampleController.createExample);

// Add more routes as needed

export default router;