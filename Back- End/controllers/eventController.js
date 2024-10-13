const Event = require('../models/Event'); // Import the event model

// Function to create a new event
const createEvent = async (req, res) => {
    try {
        const newEvent = new Event({
            name: req.body.name,
            district: req.body.district,
            placename: req.body.placename,
            eventtype: req.body.eventtype,
            date: req.body.date,
            daterange: req.body.daterange, // Ensure this is an object with start and end dates
            location: req.body.location,
            description: req.body.description,
            phone: req.body.phone,
            imageUrl: req.body.imageUrl
        });
        await newEvent.save();
        res.status(201).json({ message: 'Event added successfully!', event: newEvent });
    } catch (error) {
        console.error('Error adding event:', error);
        res.status(500).json({ error: 'Failed to add event' });
    }
};

// Function to get events by district (optional parameter)
const getEvents = async (req, res) => {
    const { district } = req.params;
    try {
        const events = await Event.find(district ? { district } : {});
        res.status(200).json(events);
    } catch (error) {
        console.error('Error fetching events:', error);
        res.status(500).json({ error: 'Failed to fetch events' });
    }
};

// Function to get all events
const getAllEvents = async (req, res) => {
    try {
        const events = await Event.find();
        res.status(200).json(events);
    } catch (error) {
        console.error('Error fetching all events:', error);
        res.status(500).json({ error: 'Failed to fetch all events' });
    }
};

// Function to get a single event by ID
const getOneEvent = async (req, res) => {
    const { id } = req.params;
    try {
        const event = await Event.findById(id);
        if (!event) {
            return res.status(404).json({ error: 'Event not found' });
        }
        res.status(200).json(event);
    } catch (error) {
        console.error('Error fetching event:', error);
        res.status(500).json({ error: 'Failed to fetch event' });
    }
};

module.exports = {
    createEvent,
    getEvents,
    getAllEvents,
    getOneEvent
};
