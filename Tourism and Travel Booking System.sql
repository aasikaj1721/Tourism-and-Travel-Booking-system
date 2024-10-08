create database travel;

use travel;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(200)
);

CREATE TABLE Destinations (
    destination_id INT PRIMARY KEY AUTO_INCREMENT,
    destination_name VARCHAR(40),
    description TEXT,
    country VARCHAR(40)
);

CREATE TABLE Tours (
    tour_id INT PRIMARY KEY AUTO_INCREMENT,
    destination_id INT,
    tour_name VARCHAR(100),
    tour_description TEXT,
    price DECIMAL(10,2),
    FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tour_id INT,
    booking_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tour_id) REFERENCES Tours(tour_id)
);



CREATE TABLE Transport (
    transport_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    transport_type VARCHAR(50),
    departure_date DATE,
    return_date DATE,
    cost DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Accommodation (
    accommodation_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    hotel_name VARCHAR(100),
    check_in_date DATE,
    check_out_date DATE,
    room_cost DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Tour_Schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    tour_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (tour_id) REFERENCES Tours(tour_id)
);

INSERT INTO Users VALUES 
(1001,'John Doe', 'johndoe@example.com', '1234567890', '123 Main St'),
(1002,'Aasika','aasika17@gmail.com','0987654321','11-A new street'),
(1003,'Britto','britto21@gmail.com','1234509876','12-B Extension street'),
(1004,'Rahul','rahul34@gmail.com','0987612345','2nd cross street'),
(1005,'Liya','liyazyra@gmail.com','9952345678','23 selva nagar'),
(1006,'Aleena','aleena@gmail.com','8870193019','26 shanmuga nagar'),
(1007,'Jain kumar','jainkumar@gmail.com','7708714042','13-B rainbow avenue'),
(1008,'Prashanth','prashanth@gmail.com','9952504600','21-A vgp nagar'),
(1009,'Swetha','swetha@gmail.com','8870192009','11-A goldevn avenue'),
(1010,'thara','thara@gmail.com','63822273009','12-G grapees');

  
INSERT INTO Destinations (destination_name, description, country) VALUES
 ('Paris', 'The City of Lights', 'France'),
('Tokyo', 'A bustling metropolis with a mix of modern architecture and traditional temples', 'Japan'),
('New York', 'The city that never sleeps, known for Times Square, Central Park, and Broadway', 'USA'),
 ('Sydney', 'Famous for the Sydney Opera House, Harbor Bridge, and its beautiful beaches', 'Australia'),
 ('Cape Town', 'A coastal city beneath Table Mountain, known for its stunning landscapes', 'South Africa'),
 ('Rio de Janeiro', 'Famous for its carnival, Sugarloaf Mountain, and Christ the Redeemer statue', 'Brazil'),
 ('Rome', 'An ancient city known for the Colosseum, Vatican City, and centuries of history', 'Italy'),
 ('Bali', 'A tropical island paradise known for its beaches, coral reefs, and volcanic mountains', 'Indonesia'),
 ('London', 'The capital of England, known for its history, the British Museum, and the Tower of London', 'UK'),
 ('Dubai', 'A modern city known for its futuristic skyline, luxury shopping, and the Burj Khalifa', 'UAE');

INSERT INTO Tours (destination_id, tour_name, tour_description, price) VALUES 
(1, 'Paris ', 'A 5-day  tour in Paris', 1500.00),
(2,'Tokyo Cultural Experience', 'Explore the modern and traditional aspects of Tokyo, with visits to temples, gardens, and futuristic districts.', 2200.00),
(3, 'New York City Highlights', 'A 3-day whirlwind tour of New York City, covering Times Square, Central Park, and the Statue of Liberty.', 1500.00),
(4, 'Rome Ancient Wonders', 'A 7-day tour exploring the ancient ruins of Rome, including the Colosseum, the Roman Forum, and Vatican City.', 2500.00),
(5, 'Sydney Adventure Package', 'An exciting 6-day tour in Sydney, featuring the Opera House, Sydney Harbour, and Bondi Beach.', 1700.00),
(6, 'Cape Town Safari and Beaches', 'A 5-day safari tour in Cape Town, South Africa, including wildlife viewing and beach relaxation.', 2400.00),
(7, 'Bali Island Retreat', 'A 6-day retreat to Bali, featuring beach resorts, cultural experiences, and visits to temples and rice terraces.', 1300.00),
(8, 'Rio Carnival Special', 'A 4-day tour in Rio de Janeiro during the world-famous Carnival, featuring parade and beach events.', 2800.00),
(9,'London History and Landmarks', 'A 5-day tour of London, visiting iconic sites such as the Tower of London, Westminster Abbey, and the British Museum.', 1900.00),
(10,'Dubai Luxury Experience', 'A 7-day luxury tour of Dubai, featuring stays in 5-star hotels, shopping, and visits to the Burj Khalifa and Palm Jumeirah.', 3500.00);

INSERT INTO Bookings (user_id, tour_id, booking_date, status) VALUES
(1001, 1, '2024-10-01', 'Confirmed'),
(1002, 2, '2024-11-15', 'Pending'),
(1003, 3, '2024-09-20', 'Confirmed'),
(1004, 4, '2024-12-05', 'Cancelled'),
(1005, 5, '2024-08-10', 'Confirmed'),
(1006, 6, '2024-07-22', 'Confirmed'),
(1007, 7, '2024-11-30', 'Pending'),
(1008, 8, '2024-02-25', 'Confirmed'),
(1009, 9, '2024-03-18', 'Pending'),
(1010, 10, '2024-04-05', 'Confirmed');

INSERT INTO Transport (booking_id, transport_type, departure_date, return_date, cost)
VALUES 
(1, 'Flight', '2024-10-10', '2024-10-20', 500.00),
(2, 'Train', '2024-11-18', '2024-11-25', 200.00),
(3, 'Bus', '2024-09-22', '2024-09-29', 100.00),
(4, 'Flight', '2024-12-07', '2024-12-15', 600.00),
(5, 'Rental Car', '2024-08-11', '2024-08-18', 300.00),
(6, 'Cruise', '2024-07-23', '2024-07-30', 800.00),
(7, 'Flight', '2024-12-01', '2024-12-07', 450.00),
(8, 'Train', '2024-02-26', '2024-03-05', 150.00),
(9, 'Bus', '2024-03-19', '2024-03-25', 120.00),
(10, 'Flight', '2024-04-06', '2024-04-12', 550.00);

INSERT INTO Accommodation (booking_id, hotel_name, check_in_date, check_out_date, room_cost)
VALUES
(1, 'Grand Hotel Paris', '2024-10-10', '2024-10-20', 1500.00),
(2, 'Shibuya Hotel Tokyo', '2024-11-18', '2024-11-25', 1200.00),
(3, 'New York Palace', '2024-09-22', '2024-09-29', 1800.00),
(4, 'Rome Holiday Inn', '2024-12-07', '2024-12-15', 1400.00),
(5, 'Sydney Waterfront Hotel', '2024-08-11', '2024-08-18', 1600.00),
(6, 'Cape Town Beach Resort', '2024-07-23', '2024-07-30', 2000.00),
(7, 'Bali Island Villas', '2024-12-01', '2024-12-07', 1300.00),
(8, 'Rio Carnival Suites', '2024-02-26', '2024-03-05', 1700.00),
(9, 'London Grand Plaza', '2024-03-19', '2024-03-25', 1100.00),
(10, 'Dubai Marina Hotel', '2024-04-06', '2024-04-12', 1900.00);

INSERT INTO Tour_Schedule (tour_id, start_date, end_date)
VALUES
(1, '2024-10-01', '2024-10-10'),
(2, '2024-11-15', '2024-11-22'),
(3, '2024-09-20', '2024-09-28'),
(4, '2024-12-05', '2024-12-12'),
(5, '2024-08-10', '2024-08-18'),
(6, '2024-07-22', '2024-07-30'),
(7, '2024-11-30', '2024-12-07'),
(8, '2024-02-25', '2024-03-03'),
(9, '2024-03-18', '2024-03-25'),
(10, '2024-04-05', '2024-04-12');

UPDATE Bookings
SET status = 'Cancelled'
WHERE booking_id = 1;

Select*from Bookings;

UPDATE Tours
SET price = 1300.00
WHERE tour_id = 1;

Select*from Tours;

SELECT t.tour_name, t.tour_description, t.price, d.destination_name
FROM Tours t
JOIN Destinations d ON t.destination_id = d.destination_id;

SELECT b.booking_id, t.tour_name, b.booking_date, b.status
FROM Bookings b
JOIN Tours t ON b.tour_id = t.tour_id
WHERE b.user_id = 1;

SELECT t.tour_name, t.price, d.destination_name
FROM Tours t
JOIN Destinations d ON t.destination_id = d.destination_id
WHERE d.destination_name = 'Bali';

SELECT t.tour_name, COUNT(b.booking_id) AS number_of_bookings
FROM Bookings b
JOIN Tours t ON b.tour_id = t.tour_id
GROUP BY t.tour_name
ORDER BY number_of_bookings DESC;

SELECT b.booking_id, SUM(a.room_cost) AS total_accommodation_cost
FROM Accommodation a
JOIN Bookings b ON a.booking_id = b.booking_id
GROUP BY b.booking_id;

SELECT t.tour_name, ts.start_date, ts.end_date
FROM Tour_Schedule ts
JOIN Tours t ON ts.tour_id = t.tour_id
WHERE ts.start_date BETWEEN '2024-01-01' AND '2024-12-31';

DELIMITER $$

CREATE PROCEDURE InsertTourSchedule(
    IN p_tour_id INT,
    IN p_start_date DATE,
    IN p_end_date DATE
)
BEGIN
    INSERT INTO Tour_Schedule (tour_id, start_date, end_date)
    VALUES (p_tour_id, p_start_date, p_end_date);
END $$

DELIMITER ;



