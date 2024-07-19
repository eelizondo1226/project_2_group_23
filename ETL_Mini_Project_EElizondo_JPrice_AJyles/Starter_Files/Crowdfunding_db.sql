DROP TABLE category;
CREATE TABLE category (
	category_id VARCHAR(10) NOT NULL PRIMARY KEY,
	category VARCHAR(50) NOT NULL
);

DROP TABLE subcategory;
CREATE TABLE subcategory (
	subcategory_id VARCHAR(20) NOT NULL PRIMARY KEY,
	subcategory VARCHAR(50) NOT NULL
);

DROP TABLE campaign;
CREATE TABLE campaign (
    cf_id INT NOT NULL PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    description VARCHAR(200) NOT NULL,
    goal FLOAT NOT NULL,
    pledged FLOAT NOT NULL,
    outcome VARCHAR(30) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(10) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    subcategory_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

DROP TABLE contacts;
CREATE TABLE contacts (
	contact_id INT NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL
);


SELECT backers_count, COUNT(*) AS CountPerBackersCount
FROM campaign
WHERE backers_count >= 300
GROUP BY backers_count
ORDER BY backers_count DESC;

SELECT COUNT(*) AS TotalRows
FROM campaign
WHERE backers_count >= 300;

