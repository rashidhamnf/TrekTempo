const express = require('express');
const router = express.Router();
const Event = require('../models/Event');

// Create Event
router.post('/createEvent', async (req, res) => {
    const { title, description, date, location, imagePath } = req.body;

    try {
        const newEvent = new Event({
            title,
            description,
            date,
            location,
            imagePath,
        });
        await newEvent.save();
        res.status(201).json({ message: 'Event created successfully!' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Failed to create event' });
    }
});

module.exports = router;
