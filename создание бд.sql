CREATE DATABASE OrderingCash;
GO

USE OrderingCash;
GO

CREATE TABLE Клиенты (
    клиент_id INT PRIMARY KEY,
    имя VARCHAR(100) NOT NULL,
    отчество VARCHAR(100),
    фамилия VARCHAR(100) NOT NULL,
    дата_рождения DATE NOT NULL,
    id_мобильного_аккаунта INT NOT NULL
);
GO

CREATE TABLE Счета (
    счет_id INT PRIMARY KEY,
    клиент_id INT NOT NULL,
    FOREIGN KEY (клиент_id) REFERENCES Клиенты(клиент_id)
);
GO

CREATE TABLE Отделения (
    отделение_id INT PRIMARY KEY,
    адрес VARCHAR(500) NOT NULL,
    часы_работы VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Статусы (
    статус_id INT PRIMARY KEY,
    название_статуса VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Заказы (
    заказ_id INT PRIMARY KEY,
    клиент_id INT NOT NULL,
    отделение_id INT NOT NULL,
    счет_id INT NOT NULL,
    дата_создания DATE NOT NULL,
    дата_плановой_выдачи DATE NOT NULL,
    дата_фактической_выдачи DATE NOT NULL,
    запрошенная_сумма INT NOT NULL,
    секретное_слово VARCHAR(100) NOT NULL,
    FOREIGN KEY (клиент_id) REFERENCES Клиенты(клиент_id),
    FOREIGN KEY (отделение_id) REFERENCES Отделения(отделение_id),
    FOREIGN KEY (счет_id) REFERENCES Счета(счет_id)
);
GO

CREATE TABLE История_заказов (
    запись_id INT PRIMARY KEY,
    заказ_id INT NOT NULL,
    статус_id INT NOT NULL,
    момент_времени DATETIME NOT NULL,
    FOREIGN KEY (заказ_id) REFERENCES Заказы(заказ_id),
    FOREIGN KEY (статус_id) REFERENCES Статусы(статус_id)
);
GO

CREATE TABLE Инкассации (
    инкассация_id INT PRIMARY KEY,
    заказ_id INT NOT NULL,
    момент_времени DATETIME NOT NULL,
    FOREIGN KEY (заказ_id) REFERENCES Заказы(заказ_id)
);
GO