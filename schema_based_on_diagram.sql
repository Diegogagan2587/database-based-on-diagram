CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(250),
    CONSTRAINT FK_patients FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(125),
    date_of_birth DATE
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type VARCHAR(125),
    name VARCHAR(125) 
);

CREATE TABLE history_treatment_relations (
    medical_history_id INT,
    treatment_id INT, 
    date time,
    PRIMARY KEY (medical_history_id, treatment_id,date),
    CONSTRAINT FK_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    CONSTRAINT FK_treatments FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount DECIMAL(18,2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT FK_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);
