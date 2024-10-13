const mongoose = require('mongoose');

const eventSchema = new mongoose.Schema({
  name: { type: String,
     required: true,},

    district: { type: String, 
      required: true },

      placename: { type: String, 
        required: true },

        eventtype: { type: String, 
          required: true },

          date: { type: Date, 
            required: true },

            daterange: { start: Date, 
              end: Date },

    location: { type: String, 
      required: true },

  description: { type: String,
     required: true },

     phone: {
      type: String,
      required: true,
      match: /^[0-9]{10}$/,  // Ensures phone number has 10 digits
    },

    image: { type: String, 
      required: true },
    
    });
  
  const Event = mongoose.model('Event', eventSchema);
  module.exports = Event;