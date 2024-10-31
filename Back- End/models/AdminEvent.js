const mongoose = require('mongoose');

const EventSchema = new mongoose.Schema({

    title: {
        type: String,
        required: true,
      },
      phone: {
        type: String,
        required: true,
      },
      district: {
        type: String,
        required: true,
      },
      place: {
        type: String,
        required: true,
      },
      location: {
        type: String,
        required: true,
      },
      date: {
        type: Date,
        required: false,
      },
      imageUrl: {
        type: String,
        required: false,
      },
      description: {  // Updated field name
        type: String,
        required: false,
      },
      dateRange: { // For date range
        start: { type: Date },
        end: { type: Date }
      }
});

const event = mongoose.model('event', EventSchema);
module.exports = event;
