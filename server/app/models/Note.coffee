mongoose = require 'mongoose'

# Create model schema
NoteSchema = new mongoose.Schema(
		title:
			type: String
			required: true
		message: 
			type: String
			required: true
	)

# Export the model schema
module.exports = NoteSchema

