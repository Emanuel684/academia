const {Router} = require('express');
const router = Router();



router.get('/actores', (req,res) => {
    return res.json([{nombre: 'Emanuel'}])
})

router.get('/actor/:id', (req,res) => {
    
})
router.put('/actor/:id', (req,res) => {
    
})
router.patch('/actor/:id', (req,res) => {
    
})
router.delete('/actor/:id', (req,res) => {
    
})


module.exports = router;