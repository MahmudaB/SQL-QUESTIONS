
-- create
CREATE TABLE Worker(
    WORKER_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATE,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker
  (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
  (001,'Monika','Arora',100000,'14-02-20','HR'),
  (002,'Niharika','Verma',80000,'14-02-11','ADMIN'),
  (003,'Hardik','Aro',300000,'14-02-20','HR'),
  (004,'Ashis','Arora',500000,'14-02-20','ADMIN'),
  (005,'Virat','Verma',60000,'14-02-11','ADMIN'),
  (006,'Anushka','kohli',30000,'14-02-19','ACCOUNT'),
  (007,'Anisha','Navya',30000,'14-02-21','ACCOUNT'),
  (008,'Anika','Naita',90000,'14-02-20','ADMIN');

-- SELECT * FROM Worker;

-- create bonus
CREATE TABLE Bonus(
     WORKER_REF_ID INT,
     BONUS_AMOUNT INT(10),
     BONUS_DATE DATE,
     FOREIGN KEY (WORKER_REF_ID)
     REFERENCES WORKER(WORKER_ID)
      ON DELETE CASCADE
);

INSERT INTO BONUS
  (WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE)  VALUES
  (001,5000,'16-02-20'),
  (002,3000,'16-06-11'),
  (003,4000,'16-02-20'),
  (001,3500,'16-02-20'),
  (002,3500,'16-06-11');
  
-- SELECT * FROM Bonus;

-- create title
CREATE TABLE Title (
     WORKER_REF_ID INT,
     WORKER_TITLE CHAR(25),
     AFECTED_FROM DATE,
     FOREIGN KEY (WORKER_REF_ID)
     REFERENCES WORKER(WORKER_ID)
      ON DELETE CASCADE
);

INSERT INTO Title 
   (WORKER_REF_ID,WORKER_TITLE,AFECTED_FROM) VALUES
   (001,'Manager','2016-02-20'),
   (002,'Executive','2016-06-11'),
   (007,'Executive','2016-06-11'),
   (005,'Manager','2016-02-20'),
   (004,'Asst. Manager','2016-06-11'),
   (003,'Lead','2016-06-11'),
   (006,'Lead','2016-06-11');
   
-- SELECT* FROM Title;

SELECT DEPARTMENT, count(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT
HAVING count(DEPARTMENT)>2;

   