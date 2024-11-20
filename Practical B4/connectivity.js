const mongoose = require('mongoose');

// Define a schema
const userSchema = new mongoose.Schema({
    name: String,
    email: String
});

// Create a model based on the schema
const User = mongoose.model('User', userSchema);

// Connect to MongoDB
mongoose.connect("mongodb://127.0.0.1:27017/test")
    .then(async () => {
        console.log("Connected to MongoDB!");

        // 1. Insert a single record
        const newUser = new User({ name: 'John Doe', email: 'john@example.com' });
        const savedUser = await newUser.save();
        console.log('Document inserted:', savedUser);

        // 2. Display the inserted record
        const fetchedUser = await User.findOne({ name: 'John Doe' });
        console.log('Fetched document:', fetchedUser);

        // 3. Update the record
        const updatedUser = await User.findOneAndUpdate(
            { name: 'John Doe' },
            { email: 'john.doe@newdomain.com' },
            { new: true }  // Return the updated document
        );
        console.log('Updated document:', updatedUser);

        // 4. Delete the record
        const deletedUser = await User.deleteOne({ name: 'John Doe' });
        console.log('Record deleted:', deletedUser.deletedCount > 0);
    })
    .catch(err => {
        console.error('Connection or operation error:', err);
    })
    .finally(() => {
        mongoose.connection.close();
    });
