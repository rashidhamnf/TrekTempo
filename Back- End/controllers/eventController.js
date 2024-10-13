const Event = require('../models/Event');

// Add a new event
exports.addEvent = async (req, res) => {
  const { title, description, date, location, imagePath } = req.body;

  try {
    const newEvent = new Event({ title, description, date, location, imagePath });
    await newEvent.save();
    res.status(201).json({ message: 'Event created successfully', event: newEvent });
  } catch (error) {
    res.status(500).json({ message: 'Error creating event', error });
  }
};

// Fetch all events
exports.getEvents = async (req, res) => {
  try {
    const events = await Event.find();
    res.status(200).json(events);
  } catch (error) {
    res.status(500).json({ message: 'Error fetching events', error });
  }
};
