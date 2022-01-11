const express = require('express');
const router = express.Router();
const prisma = require('../prisma/client');

router.get('/:id', async function(req, res, next) {
  const id = Number(req.params.id);
  const person = await prisma.person.findUnique(
    {
      where: { id },
      include: {
        following: true,
        followers: {
          select: {
            following: true,
            follower: true
          }
        }
      }
  });

  res.json({ data: person });
});

module.exports = router;