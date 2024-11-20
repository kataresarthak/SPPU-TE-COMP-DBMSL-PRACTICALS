const mysql = require('mysql2');

// Create a MySQL connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', // Adjust if your MySQL has a password
    database: 'test_db'
});

// Connect to the database
connection.connect((err) => {
    if (err) {
        return console.error('Error connecting: ' + err.message);
    }
    console.log('Connected to MySQL!');
});

// 1. Insert a new record
const insertQuery = "INSERT INTO users (username, email) VALUES (?, ?)";
const insertValues = ['JohnDoe', 'john@example.com'];

connection.execute(insertQuery, insertValues, (err, result) => {
    if (err) return console.error('Error inserting data: ' + err.message);
    console.log('Record inserted with ID:', result.insertId);

    // 2. Display the record
    const selectQuery = "SELECT * FROM users WHERE username = ?";
    connection.execute(selectQuery, ['JohnDoe'], (err, results) => {
        if (err) return console.error('Error fetching data: ' + err.message);
        console.log('Record fetched:', results);

        // 3. Update the record
        const updateQuery = "UPDATE users SET email = ? WHERE username = ?";
        connection.execute(updateQuery, ['john.doe@newdomain.com', 'JohnDoe'], (err, result) => {
            if (err) return console.error('Error updating data: ' + err.message);
            console.log('Record updated:', result.affectedRows > 0);

            // 4. Delete the record
            const deleteQuery = "DELETE FROM users WHERE username = ?";
            connection.execute(deleteQuery, ['JohnDoe'], (err, result) => {
                if (err) return console.error('Error deleting data: ' + err.message);
                console.log('Record deleted:', result.affectedRows > 0);

                // Close the connection
                connection.end();
            });
        });
    });
});
