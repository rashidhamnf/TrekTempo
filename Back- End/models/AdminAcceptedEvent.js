const mongoose = require('mongoose');

const AcceptedEventSchema = new mongoose.Schema({
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
  description: {  // Ensure this field is present
    type: String,
    required: false,
  },
  dateRange: { // For date range
    start: { type: Date },
    end: { type: Date }
  }
});

const acceptedevent = mongoose.model('acceptedevent', AcceptedEventSchema);

module.exports = acceptedevent;