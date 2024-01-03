-- Customers Table

CREATE TABLE supermarket.Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- Orders Table

CREATE TABLE supermarket.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
	Pay_Mode TEXT,
    Invoice VARCHAR(50), 
	constraint orders 
    FOREIGN KEY (CustomerID)
	REFERENCES supermarket.Customers(CustomerID)
);
	
--Category Table	

	Create Table supermarket.Category(
	Category_Id VARCHAR(50) Primary Key,
	Category_Name TEXT
	); 

-- Products Table

CREATE TABLE supermarket.Products (
    ProductID INT PRIMARY KEY,
	OrderID INT,
	Category_Id VARCHAR(50),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Description TEXT,
	constraint products
	FOREIGN KEY (OrderID)
	REFERENCES supermarket.Orders(OrderID),
	constraint category
	FOREIGN KEY (Category_Id)
	REFERENCES supermarket.Category(Category_Id)
);

--Delivery Table

CREATE TABLE supermarket.Delivery (
    Tracking_Id VARCHAR(50) PRIMARY KEY,
    OrderID INT,
    Expected_date DATE,
    Delivered_date DATE,
    constraint delivery
    FOREIGN KEY (OrderID)
    REFERENCES supermarket.Orders(OrderID)
);

-- Create Status Table

CREATE TABLE supermarket.Status (
    OrderId INT,
    Status TEXT,
    constraint Status
    FOREIGN KEY (OrderId)
    REFERENCES supermarket.Orders(OrderID)
);
		
-- Inventory Table

CREATE TABLE supermarket.Inventory (
	ProductID INT,
    Category_Id VARCHAR(50),
    SupplierID INT,
    StockIn INT,
    StockOut INT,
	constraint Inventory_P
    FOREIGN KEY (Category_Id) 
	REFERENCES supermarket.Category(Category_Id),
	constraint Inventory_C
    FOREIGN KEY (Category_Id) 
	REFERENCES supermarket.Category(Category_Id),
	constraint Inventory_S
    FOREIGN KEY (SupplierID) 
	REFERENCES supermarket.Suppliers(SupplierID)
);

--Suppliers Table

CREATE TABLE supermarket.Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- Insert data into Customers table
INSERT INTO supermarket.Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (1, 'Aman', 'Yadav', 'aman@gmail.com', '124-456-7989', '414 Sector 23A, Gurugram'),
    (2, 'Bhavesh', 'Kumar', 'bhavesh@gmail.com', '987-654-3476', '456 Elm Ave, Ghaziabad'),
	(3, 'Deepak', 'Devra', 'deepak@gmail.com', '123-456-7980', '879 Indrapuram, Ghaziabad'),
    (4, 'Sanyam', 'Sehgal', 'sanyamsehgal@gmail.com', '987-654-3213', '897 Mahagun, Ghaziabad'),
	(5, 'Anmol', 'Preet', 'preetan@gmail.com', '123-456-7890', '123 Gaur City, Noida '),
    (6, 'Manjeet', 'Kaur', 'manjeet@gmail.com', '987-654-2314', '9911 Pearl City, Navada'),
	(7, 'Raj', 'Dua', 'duaraj@gmail.com', '123-456-7689', '1141 Sun City, Ghaziabad'),
    (8, 'Aditya', 'Kapoor', 'adipoor@gmail.com', '125-654-3210', '1151 Sohna Road, Gurugram'),
	(9, 'Preet', 'Jhunjhunwala', 'reetjhunjhunwala@gmail.com', '157-456-7890', '021 Sector 22A, Gurugram'),
    (10, 'Junaid', 'Khan', 'jkhan@gmail.com', '947-654-3260', '4711 Sector 23A, Gurugram'),
	(11, 'Jonny', 'Johnas', 'jonnynas@gmail.com', '123-456-7998', '1233 Krishna Chowk, Gurugram'),
    (12, 'James', 'Smith', 'smithes@gmail.com', '987-654-3446', '3422 Kamal Vihar, Hapur'),
	(13, 'Viraj', 'Valmiki', 'virki@gmail.com', '123-456-7678', '2311 Shanti Vihar, Meerut'),
    (14, 'Rajat', 'Raghav', 'rajat@gmail.com', '987-654-1265', '3422 Shakti Nagar, Meerut'),
	(15, 'Neeraj', 'Sangwan', 'sangwanneeraj@gmail.com', '123-456-9856', 'Nuh, Gurugram'),
    (16, 'Tanishq', 'Sharma', 'tanishq@gmail.com', '987-654-8765', '2334 Sector 31, Gurugram'),
	(17, 'Sandeep', 'Shokeen', 'sandeep@gmail.com', '123-456-1209', '9900 Sector 51, Gurugram'),
    (18, 'Suraj', 'Sharma', 'surajsh@gmail.com', '987-876-3210', 'Janakpuri, Delhi'),
	(19, 'Himanshu', 'Saini', 'himanshu@gmail.com', '123-567-7890', 'Uttam Nagar, Delhi'),
    (20, 'Mohit', 'Rao', 'mohit@gmail.com', '987-012-3210', '4565 Farukhnagar, Haryana'),
	(21, 'Naman', 'Gautam', 'naman@gmail.com', '123-141-7890', '9879 Sector 62, Noida'),
    (23, 'Pratham', 'Jain', 'pratham@gmail.com', '987-313-3210', 'Uttam Nagar, Haridwar'),
	(24, 'Rahul', 'Rai', 'rahul@gmail.com', '123-786-7890', '1122 Sector 111, Gurugram'),
    (25, 'Mayank', 'Chawri', 'mayank@gmail.com', '987-981-3210', '1423 Ambience Residencies, Gurugram'),
	(26, 'Aashish', 'Chanchalani', 'aashishch@gmail.com', '123-879-7890', '1231 Sector 54, Noida'),
    (27, 'Priya', 'Garg', 'priya@gmail.com', '987-654-1187', 'Piyush Heights, New Faridabad'),
	(28, 'Divyanshi', 'Dayal', 'divyanshi@gmail.com', '167-456-7890', 'RPS, New Faridabad'),
    (29, 'Mansi', 'Mishra', 'mansi@gmail.com', '987-764-3119', 'Najafgarh, Delhi'),
	(30, 'Aditi', 'Verma', 'aditi@gmail.com', '123-112-1254', 'Nangloi, Delhi'),
    (31, 'Manya', 'Mehta', 'manya@gmail.com', '412-119-3215', 'Narayangarh, Rajasthan'),
	(32, 'Nishtha', 'Agarwal', 'nishtha@gmail.com', '123-456-7896', '1651 Haldwani'),
    (33, 'Prachi', 'Prajapati', 'prachi@gmail.com', '987-654-3217', '6567 Doiwala, Dehradun'),
	(34, 'Ananya', 'Jain', 'ananya@gmail.com', '123-456-7899', '445 Massoorie, Dehradun'),
    (35, 'Sakshi', 'Singh', 'sakshi@gmail.com', '987-654-3211', '235 Rishikesh, Dehradun'),
	(36, 'Gaurangna', 'Batra', 'gaurangna@gmail.com', '143-406-7898', '5455 PSC, Moradabad '),
    (37, 'Anushka', 'Adawni', 'anushka@gmail.com', '807-094-3211', '3409 Arya Nagar, Kanpur'),
	(38, 'Vishakha', 'Srivastava', 'vishakha@gmail.com', '123-123-1123', 'Bihtoor, Kanpur'),
    (39, 'Palak', 'Pakhandi', 'palak@gmail.com', '123-674-3210', '5463 Gautam Buddha Nagar'),
	(40, 'Navdeep', 'Sisodia', 'navdeep@gmail.com', '103-406-7090', 'Jaitra Dhampur, Bijnor'),
    (41, 'Tanvi', 'Goel', 'tanvi@gmail.com', '981-111-1123', 'Prateek City, Noida'),
	(42, 'Aishwarya', 'Dingra', 'aishwarya@gmail.com', '123-471-0098', 'Gaur Yamuna City, Noida'),
    (43, 'Riya', 'Loukrakpam', 'riya@gmail.com', '987-213-2130', '234 Vinod Nagar,Kanpur '),
	(44, 'Abhishek', 'Rajput', 'abhishek@gmail.com', '123-213-091', 'Lahora, Chandigarh'),
    (45, 'Deep', 'Anand', 'deep@gmail.com', '987-120-2131', 'Basti Bhagwanpura, Chandigarh'),
	(46, 'Ayush', 'Kadyan', 'ayush@gmail.com', '123-210-2002', '1224 Janpur, Patna'),
    (47, 'Shashwat', 'Shekhawat', 'shashwat@gmail.com', '987-909-0099', '098 Khagaul, Patna'),
	(48, 'Shanvika', 'Sehrawat', 'shanvika@gmail.com', '191-456-9198', 'Afzalgarh, Bijnor'),
    (49, 'Shagun', 'Bhanot', 'shagun@gmail.com', '914-654-909', 'Jhalu, Bijnor'),
	(50, 'Heer', 'Hansraj', 'heer@gmail.com', '990-090-0909', 'Shastri Puram, Agra')

-- Insert data into Orders table.

INSERT INTO supermarket.Orders (OrderID, CustomerID, OrderDate, TotalAmount, Pay_Mode, Invoice)
VALUES
    (1, 1,   '2023-08-01' , 150.00, 'Credit Card', 'INV12345'),
    (2, 2,   '2023-08-01' , 75.50, 'Cash', 'INV12346'),
    (3, 3,   '2023-08-01', 220.25, 'PayPal', 'INV12347'),
    (4, 4,   '2023-08-01', 50.00, 'Credit Card', 'INV12348'),
    (5, 5,   '2023-08-01', 180.75, 'Cash', 'INV12349'),
    (6, 6,   '2023-08-01', 90.20, 'PayPal', 'INV12350'),
    (7, 1,   '2023-08-02', 120.50, 'Credit Card', 'INV12351'),
    (8, 7,   '2023-08-02', 60.80, 'Cash', 'INV12352'),
    (9, 5,   '2023-08-02', 200.00, 'Credit Card', 'INV12353'),
    (10, 6,  '2023-08-02', 150.75, 'PayPal', 'INV12354'),
	(11, 7,  '2023-08-02', 95.00, 'Cash', 'INV12355'),
    (12, 8,  '2023-08-03', 130.50, 'Credit Card', 'INV12356'),
    (13, 9,  '2023-08-03', 75.25, 'PayPal', 'INV12357'),
    (14, 10, '2023-08-04', 180.00, 'Cash', 'INV12358'),
    (15, 11, '2023-08-04', 210.75, 'Credit Card', 'INV12359'),
    (16, 12, '2023-08-04', 50.20, 'Cash', 'INV12360'),
    (17, 13, '2023-08-04', 120.00, 'PayPal', 'INV12361'),
    (18, 14, '2023-08-04', 70.80, 'Credit Card', 'INV12362'),
    (19, 15, '2023-08-05', 250.00, 'Cash', 'INV12363'),
    (20, 16, '2023-08-05', 150.75, 'PayPal', 'INV12364'),
	(21, 17, '2023-08-05', 120.00, 'Credit Card', 'INV12365'),
    (22, 18, '2023-08-06', 85.50, 'Cash', 'INV12366'),
    (23, 19, '2023-08-06', 175.25, 'PayPal', 'INV12367'),
    (24, 20, '2023-08-06', 65.00, 'Credit Card', 'INV12368'),
    (25, 21, '2023-08-06', 150.75, 'Cash', 'INV12369'),
    (26, 21, '2023-08-06', 95.20, 'PayPal', 'INV12370'),
    (27, 23, '2023-08-07', 135.50, 'Credit Card', 'INV12371'),
    (28, 24, '2023-08-07', 55.80, 'Cash', 'INV12372'),
    (29, 25, '2023-08-07', 180.00, 'Credit Card', 'INV12373'),
    (30, 26, '2023-08-08', 120.75, 'PayPal', 'INV12374'),
    (31, 27, '2023-08-08', 220.00, 'Credit Card', 'INV12375'),
    (32, 28, '2023-08-08', 95.50, 'Cash', 'INV12376'),
    (33, 29, '2023-08-08', 130.25, 'PayPal', 'INV12377'),
    (34, 30, '2023-08-08', 70.00, 'Credit Card', 'INV12378'),
    (35, 31, '2023-08-08', 125.75, 'Cash', 'INV12379'),
    (36, 32, '2023-08-08', 80.20, 'PayPal', 'INV12380'),
    (37, 33, '2023-08-08', 150.50, 'Credit Card', 'INV12381'),
    (38, 34, '2023-08-08', 45.80, 'Cash', 'INV12382'),
    (39, 35, '2023-08-08', 190.00, 'Credit Card', 'INV12383'),
    (40, 36, '2023-08-09', 110.75, 'PayPal', 'INV12384'),
    (41, 37, '2023-08-09', 105.00, 'Cash', 'INV12385'),
    (42, 38, '2023-08-09', 70.50, 'PayPal', 'INV12386'),
    (43, 39, '2023-08-10', 160.25, 'Credit Card', 'INV12387'),
    (44, 40, '2023-08-10', 60.00, 'Cash', 'INV12388'),
    (45, 41, '2023-08-11', 140.75, 'Credit Card', 'INV12389'),
    (46, 42, '2023-08-12', 75.20, 'Cash', 'INV12390'),
    (47, 43, '2023-08-13', 125.50, 'PayPal', 'INV12391'),
    (48, 44, '2023-08-13', 80.80, 'Credit Card', 'INV12392'),
    (49, 45, '2023-08-13', 170.00, 'Cash', 'INV12393'),
    (50, 46, '2023-08-14', 130.75, 'PayPal', 'INV12394'),
	(51, 13, '2023-08-14', 105.00, 'Cash', 'INV12395'),
    (52, 16, '2023-08-15', 120.50, 'Credit Card', 'INV12396'),
    (53, 19, '2023-08-15', 70.25, 'PayPal', 'INV12397'),
    (54, 13, '2023-08-16', 140.00, 'Cash', 'INV12398'),
    (55, 25, '2023-08-16', 180.75, 'Credit Card', 'INV12399'),
    (56, 25, '2023-08-16', 60.20, 'Cash', 'INV12400'),
    (57, 24, '2023-08-16', 135.00, 'PayPal', 'INV12401'),
    (58, 38, '2023-08-17', 65.80, 'Credit Card', 'INV12402'),
    (59, 38, '2023-08-17', 220.00, 'Cash', 'INV12403'),
    (60, 42, '2023-08-18', 110.75, 'PayPal', 'INV12404'),
	(61, 33, '2023-08-19', 95.00, 'Credit Card', 'INV12405'),
    (62, 9,  '2023-08-19', 80.50, 'Cash', 'INV12406'),
    (63, 12, '2023-08-19', 120.25, 'PayPal', 'INV12407'),
    (64, 47, '2023-08-19', 75.00, 'Credit Card', 'INV12408'),
    (65, 45, '2023-08-20', 160.75, 'Cash', 'INV12409'),
    (66, 50, '2023-08-20', 70.20, 'PayPal', 'INV12410'),
    (67, 48, '2023-08-20', 140.50, 'Credit Card', 'INV12411'),
    (68, 49, '2023-08-20', 55.80, 'Cash', 'INV12412'),
    (69, 48, '2023-08-21', 180.00, 'Credit Card', 'INV12413'),
    (70, 49, '2023-08-21', 130.75, 'PayPal', 'INV12414'),
	(71, 17, '2023-08-22', 105.00, 'Cash', 'INV12415'),
    (72, 19, '2023-08-23', 120.50, 'Credit Card', 'INV12416'),
    (73, 24, '2023-08-23', 70.25, 'PayPal', 'INV12417'),
    (74, 36, '2023-08-23', 140.00, 'Cash', 'INV12418'),
    (75, 19, '2023-08-24', 180.75, 'Credit Card', 'INV12419'),
    (76, 24, '2023-08-24', 60.20, 'Cash', 'INV12420'),
    (77, 35, '2023-08-25', 135.00, 'PayPal', 'INV12421'),
    (78, 31, '2023-08-26', 65.80, 'Credit Card', 'INV12422'),
    (79, 36, '2023-08-26', 220.00, 'Cash', 'INV12423'),
    (80, 17, '2023-08-27', 110.75, 'PayPal', 'INV12424'),
	(81, 19, '2023-08-27', 95.00, 'Credit Card', 'INV12425'),
    (82, 11, '2023-08-27', 80.50, 'Cash', 'INV12426'),
    (83, 7,  '2023-08-27', 120.25, 'PayPal', 'INV12427'),
    (84, 11, '2023-08-27', 75.00, 'Credit Card', 'INV12428'),
    (85, 11, '2023-08-28', 160.75, 'Cash', 'INV12429'),
    (86, 17, '2023-08-29', 70.20, 'PayPal', 'INV12430'),
    (87, 11, '2023-08-29', 140.50, 'Credit Card', 'INV12431'),
    (88, 19, '2023-08-29', 55.80, 'Cash', 'INV12432'),
    (89, 36, '2023-08-29', 180.00, 'Credit Card', 'INV12433'),
    (90, 35, '2023-08-29', 130.75, 'PayPal', 'INV12434'),
    (91, 42, '2023-08-29', 95.00, 'Credit Card', 'INV12435'),
    (92, 42, '2023-08-29', 80.50, 'Cash', 'INV12436'),
    (93, 43, '2023-08-29', 120.25, 'PayPal', 'INV12437'),
    (94, 44, '2023-08-30', 75.00, 'Credit Card', 'INV12438'),
    (95, 45, '2023-08-30', 160.75, 'Cash', 'INV12439'),
    (96, 11, '2023-08-31', 70.20, 'PayPal', 'INV12440'),
    (97, 33, '2023-08-31', 140.50, 'Credit Card', 'INV12441'),
    (98, 44, '2023-08-31', 55.80, 'Cash', 'INV12442'),
    (99, 50, '2023-08-31', 180.00, 'Credit Card', 'INV12443'),
    (100, 17,'2023-08-31', 130.75, 'PayPal', 'INV12444');

-- Insert rows into Category Table
INSERT INTO supermarket.Category (Category_Id, Category_Name)
VALUES
    ('CAT001', 'Groceries'),
    ('CAT002', 'Electronics'),
    ('CAT003', 'Clothing'),
    ('CAT004', 'Home and Garden'),
    ('CAT005', 'Beauty and Personal Care');
	

-- Insert rows into Products Table
INSERT INTO supermarket.Products (ProductID, OrderID, Category_Id, ProductName, Category, Price, Description)
VALUES
    (1, 1, 'CAT001', 'Apples', 'Groceries', 1.99, 'Fresh apples from local farms'),
    (2, 2, 'CAT002', 'Smartphone', 'Electronics', 599.99, 'High-end smartphone with advanced features'),
    (3, 3, 'CAT003', 'T-Shirt', 'Clothing', 19.99, 'Comfortable cotton t-shirt in various colors'),
    (4, 4, 'CAT004', 'Lawn Mower', 'Home and Garden', 249.99, 'Gas-powered lawn mower for efficient grass cutting'),
    (5, 5, 'CAT005', 'Shampoo', 'Beauty and Personal Care', 9.99, 'Gentle shampoo for all hair types'),
    (6, 6, 'CAT001', 'Bananas', 'Groceries', 0.99, 'Ripe bananas for a healthy snack'),
    (7, 7, 'CAT002', 'Laptop', 'Electronics', 899.99, 'Powerful laptop for work and entertainment'),
    (8, 8, 'CAT003', 'Jeans', 'Clothing', 39.99, 'Classic denim jeans for everyday wear'),
    (9, 9, 'CAT004', 'Gardening Tools Set', 'Home and Garden', 79.99, 'Complete set of gardening tools for enthusiasts'),
    (10, 10, 'CAT005', 'Face Cream', 'Beauty and Personal Care', 14.99, 'Moisturizing face cream for radiant skin'),
	(11, 11, 'CAT001', 'Oranges', 'Groceries', 2.49, 'Juicy oranges packed with vitamin C'),
    (12, 12, 'CAT002', 'Headphones', 'Electronics', 49.99, 'High-quality headphones for immersive audio'),
    (13, 13, 'CAT003', 'Dress', 'Clothing', 59.99, 'Elegant dress for special occasions'),
    (14, 14, 'CAT004', 'Outdoor Furniture Set', 'Home and Garden', 399.99, 'Comfortable outdoor furniture for your patio'),
    (15, 15, 'CAT005', 'Hand Soap', 'Beauty and Personal Care', 3.99, 'Gentle hand soap with refreshing scent'),
    (16, 16, 'CAT001', 'Grapes', 'Groceries', 3.99, 'Sweet and juicy grapes for snacking'),
    (17, 17, 'CAT002', 'Camera', 'Electronics', 299.99, 'Digital camera with advanced photography features'),
    (18, 18, 'CAT003', 'Sweater', 'Clothing', 29.99, 'Warm and cozy sweater for colder days'),
    (19, 19, 'CAT004', 'BBQ Grill', 'Home and Garden', 199.99, 'Charcoal grill for outdoor barbecues'),
    (20, 20, 'CAT005', 'Perfume', 'Beauty and Personal Care', 49.99, 'Elegant perfume with a floral fragrance'),
    (21, 21, 'CAT001', 'Milk', 'Groceries', 1.29, 'Fresh cow milk for your daily needs'),
    (22, 22, 'CAT002', 'Tablet', 'Electronics', 199.99, 'Portable tablet for entertainment and productivity'),
    (23, 23, 'CAT003', 'Jacket', 'Clothing', 49.99, 'Stylish jacket for a trendy look'),
    (24, 24, 'CAT004', 'Gardening Gloves', 'Home and Garden', 9.99, 'Durable gloves for gardening tasks'),
    (25, 25, 'CAT005', 'Lip Balm', 'Beauty and Personal Care', 2.99, 'Moisturizing lip balm for soft lips'),
    (26, 26, 'CAT001', 'Cucumbers', 'Groceries', 0.79, 'Fresh cucumbers for salads and snacks'),
    (27, 27, 'CAT002', 'Smart Watch', 'Electronics', 149.99, 'Connected smart watch for health and notifications'),
    (28, 28, 'CAT003', 'Shorts', 'Clothing', 24.99, 'Casual shorts for hot weather'),
    (29, 29, 'CAT004', 'Hammock', 'Home and Garden', 59.99, 'Relaxing hammock for outdoor lounging'),
    (30, 30, 'CAT005', 'Face Mask', 'Beauty and Personal Care', 1.99, 'Hydrating face mask for skincare'),
    (31, 31, 'CAT001', 'Potatoes', 'Groceries', 1.49, 'Versatile potatoes for cooking various dishes'),
    (32, 32, 'CAT002', 'Bluetooth Speaker', 'Electronics', 29.99, 'Portable Bluetooth speaker for music on the go'),
	(33, 33, 'CAT003', 'Socks', 'Clothing', 6.99, 'Comfortable socks for everyday wear'),
    (34, 34, 'CAT004', 'Plant Pots Set', 'Home and Garden', 29.99, 'Decorative plant pots for indoor plants'),
    (35, 35, 'CAT005', 'Sunscreen', 'Beauty and Personal Care', 8.99, 'Protective sunscreen for skin'),
    (36, 36, 'CAT001', 'Strawberries', 'Groceries', 3.99, 'Sweet strawberries for desserts and snacks'),
    (37, 37, 'CAT002', 'Printer', 'Electronics', 149.99, 'Inkjet printer for documents and photos'),
    (38, 38, 'CAT003', 'Pajamas', 'Clothing', 34.99, 'Cozy pajamas for a good night sleep'),
    (39, 39, 'CAT004', 'Outdoor Lighting Set', 'Home and Garden', 49.99, 'LED outdoor lights for ambiance'),
    (40, 40, 'CAT005', 'Hand Cream', 'Beauty and Personal Care', 5.99, 'Nourishing hand cream for soft hands'),
    (41, 41, 'CAT001', 'Bread', 'Groceries', 2.49, 'Freshly baked bread for sandwiches'),
    (42, 42, 'CAT002', 'Wireless Mouse', 'Electronics', 19.99, 'Optical wireless mouse for computer use'),
    (43, 43, 'CAT003', 'Hoodie', 'Clothing', 44.99, 'Casual hoodie for a laid-back look'),
    (44, 44, 'CAT004', 'Outdoor Umbrella', 'Home and Garden', 39.99, 'Sunshade umbrella for outdoor relaxation'),
    (45, 45, 'CAT005', 'Body Wash', 'Beauty and Personal Care', 6.99, 'Gentle body wash for shower'),
    (46, 46, 'CAT001', 'Carrots', 'Groceries', 0.99, 'Fresh carrots for cooking and snacking'),
    (47, 47, 'CAT002', 'External Hard Drive', 'Electronics', 79.99, 'High-capacity external hard drive for data storage'),
    (48, 48, 'CAT003', 'Tennis Shoes', 'Clothing', 54.99, 'Sporty tennis shoes for athletic activities'),
    (49, 49, 'CAT004', 'Garden Hose', 'Home and Garden', 19.99, 'Flexible garden hose for watering plants'),
    (50, 50, 'CAT005', 'Nail Polish', 'Beauty and Personal Care', 3.99, 'Vibrant nail polish for colorful nails'),
    (51, 51, 'CAT001', 'Onions', 'Groceries', 1.29, 'Essential onions for cooking'),
    (52, 52, 'CAT002', 'Wireless Earbuds', 'Electronics', 39.99, 'Bluetooth wireless earbuds for audio on the move'),
	(53, 53, 'CAT003', 'Belt', 'Clothing', 14.99, 'Stylish belt to complete your outfit'),
    (54, 54, 'CAT004', 'Garden Fertilizer', 'Home and Garden', 12.99, 'Nutrient-rich fertilizer for healthy plants'),
    (55, 55, 'CAT005', 'Deodorant', 'Beauty and Personal Care', 4.99, 'Long-lasting deodorant for freshness'),
    (56, 56, 'CAT001', 'Blueberries', 'Groceries', 4.99, 'Nutrient-packed blueberries for snacks'),
    (57, 57, 'CAT002', 'External Monitor', 'Electronics', 249.99, 'High-resolution external monitor for enhanced productivity'),
    (58, 58, 'CAT003', 'Dress Shoes', 'Clothing', 69.99, 'Elegant dress shoes for formal occasions'),
    (59, 59, 'CAT004', 'Plant Stand', 'Home and Garden', 24.99, 'Stylish stand for potted plants'),
    (60, 60, 'CAT005', 'Lotion', 'Beauty and Personal Care', 7.99, 'Hydrating body lotion for soft skin'),
    (61, 61, 'CAT001', 'Avocado', 'Groceries', 1.79, 'Nutrient-rich avocado for salads and spreads'),
    (62, 62, 'CAT002', 'Wireless Keyboard', 'Electronics', 29.99, 'Full-size wireless keyboard for comfortable typing'),
    (63, 63, 'CAT003', 'Swim Shorts', 'Clothing', 19.99, 'Colorful swim shorts for beach outings'),
    (64, 64, 'CAT004', 'Garden Trowel', 'Home and Garden', 7.99, 'Handy trowel for planting and digging'),
    (65, 65, 'CAT005', 'Shower Gel', 'Beauty and Personal Care', 5.99, 'Refreshing shower gel for cleansing'),
    (66, 66, 'CAT001', 'Tomatoes', 'Groceries', 2.99, 'Fresh tomatoes for salads and cooking'),
    (67, 67, 'CAT002', 'VR Headset', 'Electronics', 299.99, 'Virtual reality headset for immersive experiences'),
    (68, 68, 'CAT003', 'Sunglasses', 'Clothing', 24.99, 'Stylish sunglasses for sun protection'),
    (69, 69, 'CAT004', 'Garden Pruners', 'Home and Garden', 12.99, 'Pruning shears for trimming plants'),
    (70, 70, 'CAT005', 'Face Scrub', 'Beauty and Personal Care', 9.99, 'Exfoliating face scrub for skin renewal'),
    (71, 71, 'CAT001', 'Potting Soil', 'Groceries', 5.99, 'Nutrient-rich potting soil for plants'),
    (72, 72, 'CAT002', 'Action Camera', 'Electronics', 149.99, 'Compact action camera for capturing adventures'),
	(73, 73, 'CAT003', 'Hats', 'Clothing', 12.99, 'Stylish hats for various occasions'),
    (74, 74, 'CAT004', 'Garden Hose Reel', 'Home and Garden', 29.99, 'Convenient hose reel for organized storage'),
    (75, 75, 'CAT005', 'Facial Cleanser', 'Beauty and Personal Care', 7.99, 'Gentle facial cleanser for clear skin'),
    (76, 76, 'CAT001', 'Watermelon', 'Groceries', 6.99, 'Juicy watermelon for refreshing snacks'),
    (77, 77, 'CAT002', 'Smart Thermostat', 'Electronics', 129.99, 'Wi-Fi-enabled smart thermostat for home climate control'),
    (78, 78, 'CAT003', 'Sweatpants', 'Clothing', 29.99, 'Comfortable sweatpants for lounging'),
    (79, 79, 'CAT004', 'Garden Trellis', 'Home and Garden', 19.99, 'Decorative trellis for climbing plants'),
    (80, 80, 'CAT005', 'Hand Sanitizer', 'Beauty and Personal Care', 2.99, 'Hygienic hand sanitizer for germ protection'),
    (81, 81, 'CAT001', 'Pineapple', 'Groceries', 3.99, 'Sweet pineapple for tropical flavor'),
    (82, 82, 'CAT002', 'Portable Projector', 'Electronics', 199.99, 'Compact portable projector for presentations and entertainment'),
    (83, 83, 'CAT003', 'Tie', 'Clothing', 17.99, 'Elegant tie for formal attire'),
    (84, 84, 'CAT004', 'Garden Kneeler', 'Home and Garden', 24.99, 'Cushioned kneeler for comfortable gardening'),
    (85, 85, 'CAT005', 'Mouthwash', 'Beauty and Personal Care', 4.99, 'Refreshing mouthwash for oral hygiene'),
    (86, 86, 'CAT001', 'Cherries', 'Groceries', 4.99, 'Sweet strawberries for desserts and snacks'),
    (87, 87, 'CAT002', 'Smart Pen', 'Electronics', 19.99, 'Optical wireless mouse for computer use'),
    (88, 88, 'CAT003', 'Windcheaters', 'Clothing', 44.99, 'Casual hoodie for a laid-back look'),
    (89, 89, 'CAT004', 'Umbrella', 'Home and Garden', 39.99, 'Sunshade umbrella for outdoor relaxation'),
    (90, 90, 'CAT005', 'Head Wash', 'Beauty and Personal Care', 6.99, 'Gentle body wash for shower'),
    (91, 91, 'CAT001', 'Green Chillies', 'Groceries', 0.99, 'Fresh carrots for cooking and snacking'),
    (92, 92, 'CAT002', 'Pen Drives', 'Electronics', 79.99, 'High-capacity external hard drive for data storage'),
    (93, 93, 'CAT003', 'Sneaker Shoes', 'Clothing', 54.99, 'Sporty tennis shoes for athletic activities'),
    (94, 94, 'CAT004', 'Garden wooden logs', 'Home and Garden', 19.99, 'Flexible garden hose for watering plants'),
    (95, 95, 'CAT005', 'Nail Polish Remover', 'Beauty and Personal Care', 3.99, 'Vibrant nail polish for colorful nails'),
    (96, 96, 'CAT001', 'Lemons', 'Groceries', 1.29, 'Essential onions for cooking'),
    (97, 97, 'CAT002', 'Wired Earbuds', 'Electronics', 39.99, 'Bluetooth wireless earbuds for audio on the move'),
    (98, 98, 'CAT003', 'Gloves', 'Clothing', 14.99, 'Stylish belt to complete your outfit'),
    (99, 99, 'CAT004', 'Garden Chairs', 'Home and Garden', 12.99, 'Nutrient-rich fertilizer for healthy plants'),
    (100, 100, 'CAT005', 'Face Powder', 'Beauty and Personal Care', 4.99, 'Long-lasting deodorant for freshness'),
	(101, 11, 'CAT003', 'Ankle Length Socks', 'Clothing', 6.99, 'Comfortable socks for everyday wear'),
    (102, 12, 'CAT004', 'Plastic Pots Set', 'Home and Garden', 29.99, 'Decorative plant pots for indoor plants'),
    (103, 13, 'CAT005', 'Night Cream', 'Beauty and Personal Care', 8.99, 'Protective sunscreen for skin'),
    (104, 12, 'CAT001', 'Guava', 'Groceries', 3.99, 'Sweet and juicy strawberries for desserts'),
    (105, 12, 'CAT002', 'CPU', 'Electronics', 249.99, 'High-resolution external monitor for enhanced productivity'),
    (106, 13, 'CAT003', 'Joggers', 'Clothing', 69.99, 'Elegant dress shoes for formal occasions'),
    (107, 18, 'CAT004', 'Wall Lamps', 'Home and Garden', 49.99, 'LED outdoor lights for ambiance'),
    (108, 98, 'CAT005', 'Foot Cream', 'Beauty and Personal Care', 5.99, 'Nourishing hand cream for soft hands'),
    (109, 59, 'CAT001', 'Egg Bread', 'Groceries', 2.49, 'Freshly baked bread for sandwiches'),
    (110, 11, 'CAT002', 'Drone', 'Electronics', 19.99, 'Optical wireless mouse for computer use'),
    (111, 11, 'CAT003', 'Bemudas', 'Clothing', 34.99, 'Cozy pajamas for a good night sleep'),
    (112, 12, 'CAT004', 'Earthworm Manure', 'Home and Garden', 39.99, 'Sunshade umbrella for outdoor relaxation'),
    (113, 13, 'CAT005', 'Lip Scrub', 'Beauty and Personal Care', 6.99, 'Gentle body wash for shower'),
    (114, 14, 'CAT001', 'Pumkins', 'Groceries', 0.99, 'Fresh carrots for cooking and snacking'),
    (115, 13, 'CAT002', 'USB Cables', 'Electronics', 79.99, 'High-capacity external hard drive for data storage'),
    (116, 11, 'CAT003', 'Running Shoes', 'Clothing', 54.99, 'Sporty tennis shoes for athletic activities'),
    (117, 17, 'CAT004', 'Garden Mats', 'Home and Garden', 19.99, 'Flexible garden hose for watering plants'),
    (118, 11, 'CAT005', 'Nail Extensions', 'Beauty and Personal Care', 3.99, 'Vibrant nail polish for colorful nails'),
    (119, 19, 'CAT001', 'Corriender Leaves ', 'Groceries', 1.29, 'Essential onions for cooking'),
    (120, 10, 'CAT002', 'Neckband Earphones', 'Electronics', 39.99, 'Bluetooth wireless earbuds for audio on the move'),
    (121, 12, 'CAT003', 'Hankies', 'Clothing', 14.99, 'Stylish belt to complete your outfit'),
    (122, 22, 'CAT004', 'Garden Lights', 'Home and Garden', 12.99, 'Nutrient-rich fertilizer for healthy plants'),
    (123, 23, 'CAT005', 'Powder', 'Beauty and Personal Care', 4.99, 'Long-lasting deodorant for freshness'),
    (124, 14, 'CAT001', 'Muskmelon', 'Groceries', 6.99, 'Juicy watermelon for refreshing snacks'),
    (125, 15, 'CAT002', 'E-book Readers', 'Electronics', 129.99, 'Wi-Fi-enabled smart thermostat for home climate control'),
    (126, 12, 'CAT003', 'Trackpants', 'Clothing', 29.99, 'Comfortable sweatpants for lounging'),
    (127, 17, 'CAT004', 'Garden Trollies', 'Home and Garden', 19.99, 'Decorative trellis for climbing plants'),
    (128, 18, 'CAT005', 'Face Razors', 'Beauty and Personal Care', 2.99, 'Hygienic hand sanitizer for germ protection'),
    (129, 19, 'CAT001', 'Green apple', 'Groceries', 3.99, 'Sweet pineapple for tropical flavor'),
    (130, 30, 'CAT002', 'Portable Lamps', 'Electronics', 199.99, 'Compact portable projector for presentations and entertainment'),
	(131, 31, 'CAT003', 'Briefs', 'Clothing', 6.99, 'Comfortable socks for everyday wear'),
    (132, 13, 'CAT004', 'Ceremic Pots', 'Home and Garden', 29.99, 'Decorative plant pots for indoor plants'),
    (133, 33, 'CAT005', 'Face Rice Water', 'Beauty and Personal Care', 8.99, 'Protective sunscreen for skin'),
    (134, 34, 'CAT001', 'Red Berries', 'Groceries', 3.99, 'Sweet and juicy strawberries for desserts'),
    (135, 15, 'CAT002', 'Radios', 'Electronics', 249.99, 'High-resolution external monitor for enhanced productivity'),
    (136, 16, 'CAT003', 'Gym Wear', 'Clothing', 69.99, 'Elegant dress shoes for formal occasions'),
    (137, 57, 'CAT004', 'Door Mat Set', 'Home and Garden', 49.99, 'LED outdoor lights for ambiance'),
    (138, 58, 'CAT005', 'Hair Wax', 'Beauty and Personal Care', 5.99, 'Nourishing hand cream for soft hands'),
    (139, 39, 'CAT001', 'Eggs', 'Groceries', 2.49, 'Freshly baked bread for sandwiches'),
    (140, 50, 'CAT002', 'C-type Portable Chargers', 'Electronics', 19.99, 'Optical wireless mouse for computer use'),
    (141, 91, 'CAT003', 'Trunks', 'Clothing', 34.99, 'Cozy pajamas for a good night sleep'),
    (142, 72, 'CAT004', 'Shoe Racks', 'Home and Garden', 39.99, 'Sunshade umbrella for outdoor relaxation'),
    (143, 63, 'CAT005', 'Body Mist', 'Beauty and Personal Care', 6.99, 'Gentle body wash for shower'),
    (144, 64, 'CAT001', 'Raddish', 'Groceries', 0.99, 'Fresh carrots for cooking and snacking'),
    (145, 65, 'CAT002', 'Tubelights', 'Electronics', 79.99, 'High-capacity external hard drive for data storage'),
    (146, 69, 'CAT003', 'Basketball Shoes', 'Clothing', 54.99, 'Sporty tennis shoes for athletic activities'),
    (147, 77, 'CAT004', 'Garden Tables', 'Home and Garden', 19.99, 'Flexible garden hose for watering plants'),
    (148, 48, 'CAT005', 'Hair Oil', 'Beauty and Personal Care', 3.99, 'Vibrant nail polish for colorful nails'),
    (149, 49, 'CAT001', 'Bitter Guard', 'Groceries', 1.29, 'Essential onions for cooking'),
    (150, 11, 'CAT002', 'Fans', 'Electronics', 39.99, 'Bluetooth wireless earbuds for audio on the move'),
    (151, 11, 'CAT003', 'Heels', 'Clothing', 14.99, 'Stylish belt to complete your outfit'),
    (152, 15, 'CAT004', 'Bedsheets', 'Home and Garden', 12.99, 'Nutrient-rich fertilizer for healthy plants'),
    (153, 53, 'CAT005', 'Body Razors', 'Beauty and Personal Care', 4.99, 'Long-lasting deodorant for freshness'),
    (154, 54, 'CAT001', 'melons', 'Groceries', 6.99, 'Juicy watermelon for refreshing snacks'),
    (155, 55, 'CAT002', 'Televisions', 'Electronics', 129.99, 'Wi-Fi-enabled smart thermostat for home climate control'),
    (156, 56, 'CAT003', 'Tops', 'Clothing', 29.99, 'Comfortable sweatpants for lounging'),
    (157, 15, 'CAT004', 'Side Lamps', 'Home and Garden', 19.99, 'Decorative trellis for climbing plants'),
    (158, 18, 'CAT005', 'Toner', 'Beauty and Personal Care', 2.99, 'Hygienic hand sanitizer for germ protection'),
    (159, 19, 'CAT001', 'Pear', 'Groceries', 3.99, 'Sweet pineapple for tropical flavor'),
    (160, 60, 'CAT002', 'Speakers', 'Electronics', 199.99, 'Compact portable projector for presentations and entertainment');
	
	-- Insert rows into Delivery Table
INSERT INTO supermarket.Delivery (Tracking_Id, OrderID, Expected_date, Delivered_date)
VALUES
    ('TRK001', 1,  '2023-08-01', '2023-08-01'),
    ('TRK002', 2,  '2023-08-01', '2023-08-01'),
    ('TRK003', 3,  '2023-08-02', '2023-08-02'),
    ('TRK004', 4,  '2023-08-02', NULL),
    ('TRK005', 5,  '2023-08-02', NULL),
    ('TRK006', 6,  '2023-08-03', '2023-08-02'),
    ('TRK007', 7,  '2023-08-02', '2023-08-02'),
    ('TRK008', 8,  '2023-08-03', NULL),
    ('TRK009', 9,  '2023-08-03', '2023-08-02'),
    ('TRK010', 10, '2023-08-03','2023-08-03'),
	('TRK011', 11, '2023-08-03', '2023-08-04'),
    ('TRK012', 12, '2023-08-04', NULL),
    ('TRK013', 13, '2023-08-04', '2023-08-04'),
    ('TRK014', 14, '2023-08-04', '2023-08-04'),
    ('TRK015', 15, '2023-08-04', '2023-08-03'),
    ('TRK016', 16, '2023-08-05', '2023-08-05'),
    ('TRK017', 17, '2023-08-04', '2023-08-04'),
    ('TRK018', 18, '2023-08-05', '2023-08-05'),
    ('TRK019', 19, '2023-08-05', '2023-08-05'),
    ('TRK020', 20, '2023-08-06', '2023-08-06'),
    ('TRK021', 21, '2023-08-06', '2023-08-06'),
    ('TRK022', 22, '2023-08-06', '2023-08-05'),
    ('TRK023', 23, '2023-08-06', '2023-08-07'),
    ('TRK024', 24, '2023-08-07', '2023-08-07'),
    ('TRK025', 25, '2023-08-07', '2023-08-07'),
    ('TRK026', 26, '2023-08-07', '2023-08-08'),
    ('TRK027', 27, '2023-08-08', '2023-08-08'),
    ('TRK028', 28, '2023-08-08', '2023-08-08'),
    ('TRK029', 29, '2023-08-09', '2023-08-09'),
    ('TRK030', 30, '2023-08-08', '2023-08-09'),
	('TRK031', 31, '2023-08-09', '2023-08-09'),
    ('TRK032', 32, '2023-08-09', NULL),
    ('TRK033', 33, '2023-08-09', NULL),
    ('TRK034', 34, '2023-08-09', '2023-08-09'),
    ('TRK035', 35, '2023-08-09', NULL),
    ('TRK036', 36, '2023-08-09', '2023-08-08'),
    ('TRK037', 37, '2023-08-10', '2023-08-08'),
    ('TRK038', 38, '2023-08-10', '2023-08-09'),
    ('TRK039', 39, '2023-08-10', NULL),
    ('TRK040', 40, '2023-08-10', NULL),
    ('TRK041', 41, '2023-08-10', NULL),
    ('TRK042', 42, '2023-08-11', NULL),
    ('TRK043', 43, '2023-08-10', '2023-08-10'),
    ('TRK044', 44, '2023-08-11', '2023-08-11'),
    ('TRK045', 45, '2023-08-12', NULL),
    ('TRK046', 46, '2023-08-13', '2023-08-13'),
    ('TRK047', 47, '2023-08-13', '2023-08-14'),
    ('TRK048', 48, '2023-08-15', '2023-08-15'),
    ('TRK049', 49, '2023-08-15', '2023-08-15'),
    ('TRK050', 50, '2023-08-15', '2023-08-15'),
	('TRK051', 51, '2023-08-15', '2023-08-15'),
    ('TRK052', 52, '2023-08-16', '2023-08-16'),
    ('TRK053', 53, '2023-08-15', '2023-08-15'),
    ('TRK054', 54, '2023-08-17', '2023-08-17'),
    ('TRK055', 55, '2023-08-17', '2023-08-17'),
    ('TRK056', 56, '2023-08-18', '2023-08-18'),
    ('TRK057', 57, '2023-08-18', '2023-08-18'),
    ('TRK058', 58, '2023-08-18', '2023-08-18'),
    ('TRK059', 59, '2023-08-18', '2023-08-17'),
    ('TRK060', 60, '2023-08-20', '2023-08-20'),
    ('TRK061', 61, '2023-08-20', '2023-08-20'),
    ('TRK062', 62, '2023-08-20', '2023-08-20'),
    ('TRK063', 63, '2023-08-21', '2023-08-21'),
    ('TRK064', 64, '2023-08-21', '2023-08-21'),
    ('TRK065', 65, '2023-08-21', NULL),
    ('TRK066', 66, '2023-08-21', NULL),
    ('TRK067', 67, '2023-08-22', '2023-08-21'),
    ('TRK068', 68, '2023-08-21', NULL),
    ('TRK069', 69, '2023-08-21', '2023-08-21'),
    ('TRK070', 70, '2023-08-22', NULL),
    ('TRK071', 71, '2023-08-22', '2023-08-22'),
    ('TRK072', 72, '2023-08-23', '2023-08-23'),
    ('TRK073', 73, '2023-08-24', '2023-08-24'),
    ('TRK074', 74, '2023-08-25', NULL),
    ('TRK075', 75, '2023-08-25', NULL),
    ('TRK076', 76, '2023-08-26', NULL),
    ('TRK077', 77, '2023-08-25', '2023-08-26'),
    ('TRK078', 78, '2023-08-27', '2023-08-27'),
    ('TRK079', 79, '2023-08-27', '2023-08-27'),
    ('TRK080', 80, '2023-08-27', '2023-08-27'),
	('TRK081', 81, '2023-08-27', NULL),
    ('TRK082', 82, '2023-08-28', NULL),
    ('TRK083', 83, '2023-08-29', NULL),
    ('TRK084', 84, '2023-08-28', NULL),
    ('TRK085', 85, '2023-08-28', '2023-08-28'),
    ('TRK086', 86, '2023-08-29', NULL),
    ('TRK087', 87, '2023-08-30', NULL),
    ('TRK088', 88, '2023-08-30', NULL),
    ('TRK089', 89, '2023-08-30', '2023-08-30'),
    ('TRK090', 90, '2023-08-31', NULL),
    ('TRK091', 91, '2023-08-31', NULL),
    ('TRK092', 92, '2023-09-01', NULL),
    ('TRK093', 93, '2023-09-01', '2023-09-01'),
    ('TRK094', 94, '2023-08-31', NULL),
    ('TRK095', 95, '2023-09-01', NULL),
    ('TRK096', 96, '2023-09-01', NULL),
    ('TRK097', 97, '2023-09-01', NULL),
    ('TRK098', 98, '2023-09-01', '2023-09-01'),
    ('TRK099', 99, '2023-09-02', '2023-09-02'),
    ('TRK100', 100,'2023-09-02', NULL)
;

-- Insert rows into Status Table
INSERT INTO supermarket.Status (OrderId, Status)
VALUES
    (1, 'Delivered'),
    (2, 'Delivered'),
    (3, 'Delivered'),
    (4, 'Cancelled'),
    (5, 'Cancelled'),
    (6, 'Delivered'),
    (7, 'Delivered'),
    (8, 'Cancelled'),
    (9, 'Delivered'),
    (10, 'Delivered'),
    (11, 'Delivered'),
    (12, 'Cancelled'),
    (13, 'Delivered'),
    (14, 'Delivered'),
    (15, 'Delivered'),
    (16, 'Delivered'),
    (17, 'Delivered'),
    (18, 'Delivered'),
    (19, 'Delivered'),
    (20, 'Delivered'),
    (21, 'Delivered'),
    (22, 'Delivered'),
    (23, 'Delivered'),
    (24, 'Delivered'),
    (25, 'Delivered'),
    (26, 'Delivered'),
    (27, 'Delivered'),
    (28, 'Delivered'),
    (29, 'Delivered'),
	(30, 'Delivered'),
    (31, 'Delivered'),
    (32, 'Cancelled'),
    (33, 'Cancelled'),
    (34, 'Delivered'),
    (35, 'Cancelled'),
    (36, 'Delivered'),
    (37, 'Delivered'),
    (38, 'Delivered'),
    (39, 'Cancelled'),
    (40, 'Cancelled'),
    (41, 'Cancelled'),
    (42, 'Cancelled'),
    (43, 'Delivered'),
    (44, 'Delivered'),
    (45, 'Cancelled'),
    (46, 'Delivered'),
    (47, 'Delivered'),
    (48, 'Delivered'),
    (49, 'Delivered'),
    (50, 'Delivered'),
    (51, 'Delivered'),
    (52, 'Delivered'),
    (53, 'Delivered'),
    (54, 'Delivered'),
    (55, 'Delivered'),
    (56, 'Delivered'),
    (57, 'Delivered'),
    (58, 'Delivered'),
    (59, 'Delivered'),
    (60, 'Delivered'),
    (61, 'Delivered'),
    (62, 'Delivered'),
    (63, 'Delivered'),
    (64, 'Delivered'),
    (65, 'Cancelled'),
    (66, 'Cancelled'),
    (67, 'Delivered'),
    (68, 'Pending'),
    (69, 'Delivered'),
    (70, 'Pending'),
    (71, 'Delivered'),
    (72, 'Delivered'),
    (73, 'Delivered'),
    (74, 'Out for Delivery'),
    (75, 'Out for Delivery'),
    (76, 'Out for Delivery'),
    (77, 'Delivered'),
    (78, 'Delivered'),
    (79, 'Delivered'),
    (80, 'Delivered'),
    (81, 'Pending'),
    (82, 'Out for Delivery'),
    (83, 'Out for Delivery'),
    (84, 'Pending'),
    (85, 'Delivered'),
    (86, 'Out for Delivery'),
    (87, 'Delivered'),
    (88, 'Out for Delivery'),
    (89, 'Delivered'),
    (90, 'Pending'),
    (91, 'Processing'),
    (92, 'Processing'),
    (93, 'Delivered'),
    (94, 'Cancelled'),
    (95, 'Pending'),
    (96, 'Out for Delivery'),
    (97, 'Processing'),
    (98, 'Delivered'),
    (99, 'Delivered'),
    (100,'Processing');

-- Insert rows into Suppliers Table
INSERT INTO supermarket.Suppliers (SupplierID, SupplierName, ContactName, Email, Phone, Address)
VALUES
    (1, 'All Well Electronics', 'Saroj Singh', 'allwell@gmail.com', '123-456-7890', '123 Main Market, Noida City'),
    (2, 'Fresh Foods Inc.', 'Gajendra Awasthi', 'freshly@gmail.com', '987-654-3210', '456 Market Rd, Farukkhnagar, Gurugram'),
    (3, 'Garden Supplies Co.', 'Shipra Shinde', 'garden@gmail.com', '567-890-1234', '789 Green Vally, Carterpuri Village, Gurugram'),
    (4, 'Beauty Products Ltd.', 'Vinita Singh', 'beautyp@gmail.com', '345-678-9012', 'DLF Industrial Area, Faridabad'),
    (5, 'Clothing Fit Corp.', 'David Kalra', 'clfit@gmail.com', '678-901-2345', 'Firozpur, Patiala');
	
-- Insert rows into Inventory Table
INSERT INTO supermarket.Inventory (ProductID, Category_Id, SupplierID, StockIn, StockOut)
VALUES
    (1, 'CAT001', 2, 100, 10),
    (2, 'CAT002', 1, 50, 5),
    (3, 'CAT003', 5, 75, 8),
    (4, 'CAT004', 3, 30, 3),
    (5, 'CAT005', 4, 120, 15),
    (6, 'CAT001', 2, 90, 8),
    (7, 'CAT002', 1, 40, 4),
    (8, 'CAT003', 5, 60, 6),
    (9, 'CAT004', 3, 25, 2),
    (10, 'CAT005', 4, 110, 12),
    (11, 'CAT001', 2, 95, 9),
    (12, 'CAT002', 1, 55, 6),
    (13, 'CAT003', 5, 70, 7),
    (14, 'CAT004', 3, 28, 3),
    (15, 'CAT005', 4, 115, 14),
    (16, 'CAT001', 2, 80, 7),
    (17, 'CAT002', 1, 45, 5),
    (18, 'CAT003', 5, 65, 5),
    (19, 'CAT004', 3, 27, 3),
    (20, 'CAT005', 4, 105, 10),
	(21, 'CAT001', 2, 110, 12),
    (22, 'CAT002', 1, 60, 7),
    (23, 'CAT003', 5, 85, 9),
    (24, 'CAT004', 3, 35, 4),
    (25, 'CAT005', 4, 130, 16),
    (26, 'CAT001', 2, 100, 10),
    (27, 'CAT002', 1, 50, 6),
    (28, 'CAT003', 5, 80, 8),
    (29, 'CAT004', 3, 33, 3),
    (30, 'CAT005', 4, 125, 15),
    (31, 'CAT001', 2, 105, 11),
    (32, 'CAT002', 1, 55, 6),
    (33, 'CAT003', 5, 90, 9),
    (34, 'CAT004', 3, 36, 4),
    (35, 'CAT005', 4, 135, 17),
    (36, 'CAT001', 2, 95, 10),
    (37, 'CAT002', 1, 45, 5),
    (38, 'CAT003', 5, 75, 8),
    (39, 'CAT004', 3, 30, 3),
    (40, 'CAT005', 4, 120, 14),
    (41, 'CAT001', 2, 100, 12),
    (42, 'CAT002', 1, 50, 6),
    (43, 'CAT003', 5, 80, 8),
    (44, 'CAT004', 3, 35, 4),
    (45, 'CAT005', 4, 130, 16),
    (46, 'CAT001', 2, 110, 11),
    (47, 'CAT002', 1, 60, 7),
    (48, 'CAT003', 5, 85, 9),
    (49, 'CAT004', 3, 36, 4),
    (50, 'CAT005', 4, 135, 17),
	(51, 'CAT001', 2, 120, 15),
    (52, 'CAT002', 1, 65, 7),
    (53, 'CAT003', 5, 90, 10),
    (54, 'CAT004', 3, 40, 5),
    (55, 'CAT005', 4, 140, 18),
    (56, 'CAT001', 2, 115, 12),
    (57, 'CAT002', 1, 55, 6),
    (58, 'CAT003', 5, 85, 9),
    (59, 'CAT004', 3, 38, 4),
    (60, 'CAT005', 4, 130, 15),
    (61, 'CAT001', 2, 125, 14),
    (62, 'CAT002', 1, 70, 8),
    (63, 'CAT003', 5, 95, 11),
    (64, 'CAT004', 3, 42, 5),
    (65, 'CAT005', 4, 145, 17),
    (66, 'CAT001', 2, 130, 16),
    (67, 'CAT002', 1, 75, 8),
    (68, 'CAT003', 5, 100, 12),
    (69, 'CAT004', 3, 45, 5),
    (70, 'CAT005', 4, 150, 18),
    (71, 'CAT001', 2, 135, 15),
    (72, 'CAT002', 1, 80, 9),
    (73, 'CAT003', 5, 105, 13),
    (74, 'CAT004', 3, 48, 5),
    (75, 'CAT005', 4, 155, 19),
    (76, 'CAT001', 2, 140, 16),
    (77, 'CAT002', 1, 85, 10),
    (78, 'CAT003', 5, 110, 14),
    (79, 'CAT004', 3, 50, 6),
    (80, 'CAT005', 4, 160, 20),
    (81, 'CAT001', 2, 145, 17),
    (82, 'CAT002', 1, 90, 11),
    (83, 'CAT003', 5, 115, 15),
    (84, 'CAT004', 3, 55, 6),
    (85, 'CAT005', 4, 165, 21),
    (86, 'CAT001', 2, 150, 18),
    (87, 'CAT002', 1, 95, 12),
    (88, 'CAT003', 5, 120, 16),
    (89, 'CAT004', 3, 60, 7),
    (90, 'CAT005', 4, 170, 22),
    (91, 'CAT001', 2, 155, 19),
    (92, 'CAT002', 1, 100, 13),
    (93, 'CAT003', 5, 125, 17),
    (94, 'CAT004', 3, 65, 7),
    (95, 'CAT005', 4, 175, 23),
    (96, 'CAT001', 2, 160, 20),
    (97, 'CAT002', 1, 105, 14),
    (98, 'CAT003', 5, 130, 18),
    (99, 'CAT004', 3, 70, 8),
    (100, 'CAT005', 4, 180, 24),
    (101, 'CAT001', 5, 165, 21),
    (102, 'CAT002', 3, 110, 15),
    (103, 'CAT003', 4, 135, 19),
    (104, 'CAT004', 2, 75, 8),
    (105, 'CAT005', 1, 185, 25),
	(106, 'CAT001', 5, 170, 22),
    (107, 'CAT002', 3, 115, 16),
    (108, 'CAT003', 4, 140, 20),
    (109, 'CAT004', 2, 80, 9),
    (110, 'CAT005', 1, 190, 26),
    (111, 'CAT001', 5, 175, 23),
    (112, 'CAT002', 3, 120, 17),
    (113, 'CAT003', 4, 145, 21),
    (114, 'CAT004', 2, 85, 10),
    (115, 'CAT005', 1, 195, 27),
    (116, 'CAT001', 5, 180, 24),
    (117, 'CAT002', 3, 125, 18),
    (118, 'CAT003', 4, 150, 22),
    (119, 'CAT004', 2, 90, 10),
    (120, 'CAT005', 1, 200, 28),
    (121, 'CAT001', 5, 185, 25),
    (122, 'CAT002', 3, 130, 19),
    (123, 'CAT003', 4, 155, 23),
    (124, 'CAT004', 2, 95, 11),
    (125, 'CAT005', 1, 205, 29),
    (126, 'CAT001', 5, 190, 26),
    (127, 'CAT002', 3, 135, 20),
    (128, 'CAT003', 4, 160, 24),
    (129, 'CAT004', 2, 100, 11),
    (130, 'CAT005', 1, 210, 30),
    (131, 'CAT001', 5, 195, 27),
    (132, 'CAT002', 3, 140, 21),
    (133, 'CAT003', 4, 165, 25),
    (134, 'CAT004', 2, 105, 12),
    (135, 'CAT005', 1, 215, 31),
    (136, 'CAT001', 5, 200, 28),
    (137, 'CAT002', 3, 145, 22),
    (138, 'CAT003', 4, 170, 26),
    (139, 'CAT004', 2, 110, 12),
    (140, 'CAT005', 1, 220, 32),
    (141, 'CAT001', 5, 205, 29),
    (142, 'CAT002', 3, 150, 23),
    (143, 'CAT003', 4, 175, 27),
    (144, 'CAT004', 2, 115, 13),
    (145, 'CAT005', 1, 225, 33),
    (146, 'CAT001', 5, 210, 30),
    (147, 'CAT002', 3, 155, 24),
    (148, 'CAT003', 4, 180, 28),
    (149, 'CAT004', 2, 120, 13),
    (150, 'CAT005', 1, 230, 34),
    (151, 'CAT001', 5, 215, 31),
    (152, 'CAT002', 3, 160, 25),
    (153, 'CAT003', 4, 185, 29),
    (154, 'CAT004', 2, 125, 14),
    (155, 'CAT005', 1, 235, 35),
    (156, 'CAT001', 5, 220, 32),
    (157, 'CAT002', 3, 165, 26),
    (158, 'CAT003', 4, 190, 30),
    (159, 'CAT004', 2, 130, 14),
    (160, 'CAT005', 1, 240, 36);
	
-- Joining Tables...

--1. Joining all the tables to form a single table with all the desired columns.

	SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    C.Phone,
    C.Address,
    O.OrderID,
    O.OrderDate,
    O.TotalAmount,
    O.Pay_Mode,
    O.Invoice,
    P.ProductID,
    P.ProductName,
    P.Category,
    P.Price,
    P.Description,
    CA.Category_Id,
    CA.Category_Name,
    S.SupplierID,
    S.SupplierName,
    S.ContactName,
    S.Email AS SupplierEmail,
    S.Phone AS SupplierPhone,
    S.Address AS SupplierAddress,
    I.StockIn,
    I.StockOut,
    D.Tracking_Id,
    D.Expected_date AS DeliveryExpectedDate,
    D.Delivered_date AS DeliveryDeliveredDate,
    ST.Status
FROM supermarket.Customers C
INNER JOIN supermarket.Orders O ON C.CustomerID = O.CustomerID
INNER JOIN supermarket.Products P ON O.OrderID = P.OrderID
INNER JOIN supermarket.Category CA ON P.Category_Id = CA.Category_Id
INNER JOIN supermarket.Inventory I ON CA.Category_Id = I.Category_Id AND p.ProductID = I.ProductID 
INNER JOIN supermarket.Suppliers S ON S.SupplierID = I.SupplierID
INNER JOIN supermarket.Delivery D ON O.OrderID = D.OrderID
INNER JOIN supermarket.Status ST ON O.OrderID = ST.OrderId;
 
--2. Joining Customers, Orders, Products, Category, Delivery and Status tables.
	
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.Phone,
    c.Address,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.Pay_Mode,
    o.Invoice,
	p.ProductID,
    p.ProductName,
    p.Price,
    p.Description,
    ca.Category_Id,
    ca.Category_Name,
	d.Tracking_Id,
    d.Expected_date,
    d.Delivered_date,
    s.Status
FROM
    supermarket.Customers c
INNER JOIN
    supermarket.Orders o ON c.CustomerID = o.CustomerID
INNER JOIN
    supermarket.Products p ON o.OrderID = p.OrderID
INNER JOIN
    supermarket.Category ca ON p.Category_Id = ca.Category_Id
INNER JOIN
    supermarket.Delivery d ON o.OrderID = d.OrderID
INNER JOIN
    supermarket.Status s ON o.OrderID = s.OrderId
;
	
--3. Joining Inventory, Suppliers and Category tables.

SELECT
    i.StockIn,
    i.StockOut,
    s.SupplierName,
    s.Email,
    s.Phone,
	CA.Category_Id
FROM
    supermarket.Category CA
INNER JOIN
    supermarket.Inventory i ON i.Category_Id = CA.Category_Id
INNER JOIN
    supermarket.Suppliers s ON i.SupplierID = s.SupplierID;
	

--Analysis And Modification...

-- Q1. find the customer who has placed the highest total amount order?

SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone, c.Address, 
       o.OrderID, o.TotalAmount
FROM supermarket.Customers c
INNER JOIN supermarket.Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount = (SELECT MAX(TotalAmount) FROM supermarket.Orders);
	
--Calculate the average total amount of all orders.

SELECT AVG(TotalAmount) AS AverageTotalAmount
FROM supermarket.Orders;
	
--Q2. Write a query to retrieve a list of customers along with the total number of orders they have placed. 
--Display the results in descending order of the number of orders.

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders
FROM
    supermarket.Customers c
JOIN
    supermarket.Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.FirstName, c.LastName
ORDER BY
    TotalOrders DESC
	LIMIT 10;
	
--Q3. Create a query that identifies the top 3 categories with the highest total quantity of products sold. 
--Include the category name and the total quantity sold.
	
SELECT
    C.Category_Name,
    SUM(I.StockOut) AS TotalQuantitySold
FROM
    supermarket.Category AS C
JOIN
    supermarket.Products AS P ON C.Category_Id = P.Category_Id
JOIN
    supermarket.Inventory AS I ON P.ProductID = I.ProductID
GROUP BY
    C.Category_Name
ORDER BY
    TotalQuantitySold DESC
LIMIT 3;

--Q4. Write a query to retrieve the products that have a lower quantity in 
--    stock than a specified reorder point. 
--	  Include the product name, current stock quantity, and reorder point. 
--	  Order the results by stock quantity in ascending order.

WITH ReorderData AS (
    SELECT P.ProductName, (I.StockIn - I.StockOut) AS CurrentStockQuantity
    FROM supermarket.Products P
    JOIN supermarket.Inventory I ON P.ProductID = I.ProductID
)
SELECT ProductName, CurrentStockQuantity, 40 AS ReorderPoint
FROM ReorderData
WHERE CurrentStockQuantity < 40
ORDER BY CurrentStockQuantity ASC;

--Q5. Create a query to identify customers who have placed at least 3 orders with a total amount greater than 100 Rupees each. 
--Display customer names, email addresses, and the number of qualifying orders.

SELECT C.FirstName || ' ' || C.LastName AS CustomerName, C.Email, COUNT(O.OrderID) AS NumberOfQualifyingOrders
FROM supermarket.Customers C
JOIN supermarket.Orders O ON C.CustomerID = O.CustomerID
WHERE O.TotalAmount > 100
GROUP BY C.CustomerID, CustomerName, C.Email
HAVING COUNT(O.OrderID) >= 3
ORDER BY NumberOfQualifyingOrders DESC;

--Q6. Write a query to calculate the total profit for each category. 
--Display the category name and total profit, ordered by profit in descending order.

SELECT C.Category_Name,
       SUM((P.Price * I.StockIn) - (P.Price * I.StockOut)) AS TotalProfit
FROM supermarket.Products P
JOIN supermarket.Category C ON P.Category_Id = C.Category_Id
JOIN supermarket.Inventory I ON P.ProductID = I.ProductID
GROUP BY C.Category_Name
ORDER BY TotalProfit DESC;

--Q7. Create a query to determine the suppliers based on the average stock availability for their supplied products. 
--Display supplier names and their average availability percentages.

SELECT S.SupplierName,
       AVG(I.StockIn::FLOAT / (I.StockIn + I.StockOut)) * 100 AS AvgAvailabilityPercentage
FROM supermarket.Suppliers S
JOIN supermarket.Inventory I ON S.SupplierID = I.SupplierID
GROUP BY S.SupplierName
ORDER BY AvgAvailabilityPercentage DESC
LIMIT 5;

--Q8. Write a query to analyze the percentage of orders that were delivered after the expected delivery date. 
--Calculate this percentage for each category. 
--Display the category name and the percentage of late deliveries, ordered by percentage in descending order.

SELECT
    C.Category_Name,
    COUNT(CASE WHEN D.Delivered_date > D.Expected_date THEN 1 END) AS LateDeliveries,
    COUNT(*) AS TotalOrders,
    (COUNT(CASE WHEN D.Delivered_date > D.Expected_date THEN 1 END) * 100.0 / COUNT(*)) AS PercentageLate
FROM
    supermarket.Category C
JOIN
    supermarket.Products P ON C.Category_Id = P.Category_Id
JOIN
    supermarket.Orders O ON P.OrderID = O.OrderID
JOIN
    supermarket.Delivery D ON O.OrderID = D.OrderID
GROUP BY
    C.Category_Name
ORDER BY
    PercentageLate DESC;

--Q9. Design a query to calculate the percentage of customers who have placed orders in the last 30 days compared to the total 
--number of customers. Display the retention rate as a percentage.

SELECT
      (COUNT(DISTINCT CASE WHEN O.OrderDate >= CURRENT_DATE - INTERVAL '5 days' THEN C.CustomerID END) * 100.0 / COUNT(DISTINCT C.CustomerID)) AS RetentionRate
FROM
    supermarket.Customers C
LEFT JOIN
    supermarket.Orders O ON C.CustomerID = O.CustomerID
	;

--Q10. Create a query that provides a breakdown of orders by their status (Shipped, Delivered, etc.).
--Display the percentage of orders for each status.

SELECT
    S.Status,
    COUNT(O.OrderID) AS OrderCount,
    (COUNT(O.OrderID) * 100.0 / SUM(COUNT(O.OrderID)) OVER ()) AS Percentage
FROM
    supermarket.Status AS S
LEFT JOIN
    supermarket.Orders AS O ON S.OrderID = O.OrderID
GROUP BY
    S.Status
ORDER BY
    Percentage DESC;

--Q11. Write a query to calculate the average, minimum, and maximum total amount spent by customers on their orders.
	
SELECT
    AVG(TotalAmount) AS AverageTotalAmount,
    MIN(TotalAmount) AS MinimumTotalAmount,
    MAX(TotalAmount) AS MaximumTotalAmount
FROM
    supermarket.Orders;	
	
--Q12. Write a query to categorize customers into "High Value," "Medium Value," and "Low Value" segments based on their 
--     total amount spent on orders. Display the segment name and the number of customers in each segment.
	SELECT
    CASE
        WHEN TotalAmount >= 500 THEN 'High Value'
        WHEN TotalAmount >=100 AND TotalAmount < 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Segment,
    COUNT(*) AS NumberOfCustomers
FROM
    (
        SELECT
            C.CustomerID,
            COALESCE(SUM(O.TotalAmount), 0) AS TotalAmount
        FROM
            supermarket.Customers AS C
        LEFT JOIN
            supermarket.Orders AS O ON C.CustomerID = O.CustomerID
        GROUP BY
            C.CustomerID
    ) AS CustomerTotalAmount
GROUP BY
    Segment
ORDER BY
    Segment;
	
--Q13. Creating a new Column as ProfitMargin in Products table which will tell us about the profit over each product.
-- Add the ProfitMargin column to the Products table
ALTER TABLE supermarket.Products
ADD ProfitMargin DECIMAL(10, 4);  

-- Update the ProfitMargin values
UPDATE supermarket.Products AS P
SET ProfitMargin = CASE
    WHEN (P.Price * I.StockIn) = 0 THEN NULL  
    ELSE ((P.Price * I.StockIn) - (P.Price * I.StockOut)) / (P.Price * I.StockIn)
END
FROM supermarket.Inventory AS I
WHERE P.ProductID = I.ProductID;

--Q14. Customer Total Purchase Calculation...
	
-- Adding a new column to the Customers table
ALTER TABLE supermarket.Customers
ADD TotalSpent DECIMAL(10, 2);	
	
-- Updating the new column 
UPDATE supermarket.Customers AS C
SET TotalSpent = (
    SELECT COALESCE(SUM(O.TotalAmount), 0)
    FROM supermarket.Orders AS O
    WHERE O.CustomerID = C.CustomerID
);

-- Displaying the first few rows 
SELECT P.ProductID, P.ProductName, P.Price, I.StockIn, I.StockOut, P.ProfitMargin
FROM supermarket.Products AS P
JOIN supermarket.Inventory AS I ON P.ProductID = I.ProductID
ORDER BY P.ProfitMargin DESC
LIMIT 10;  









select * from supermarket.customers;