const express = require('express');
const router = express.Router();


const resultController = require('../controllers/result');


router.post('/',  resultController.getResult);
router.get('/',  resultController.getResult);


module.exports = router;