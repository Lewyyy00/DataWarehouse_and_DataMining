USE PraceDyplomoweDW;
GO

-- Tabele Wymiarow
CREATE TABLE Dim_PracaDyplomowa (
    ID_Praca INT PRIMARY KEY,
    Temat VARCHAR(500)
);

CREATE TABLE Dim_TypStudiow (
    ID_TypStudiow SMALLINT PRIMARY KEY,
    Nazwa VARCHAR(50)
);

CREATE TABLE Dim_Wydzial (
    ID_Wydzial SMALLINT PRIMARY KEY,
    Nazwa VARCHAR(100)
);

CREATE TABLE Dim_StopienNaukowy (
    ID_StopienNaukowy SMALLINT PRIMARY KEY,
    Nazwa VARCHAR(50)
);

CREATE TABLE Dim_Osoba (
    ID_Osoba INT PRIMARY KEY,
    Imie VARCHAR(20),
    Nazwisko VARCHAR(30),
    ID_StopienNaukowy SMALLINT FOREIGN KEY REFERENCES Dim_StopienNaukowy(ID_StopienNaukowy)
);

CREATE TABLE Dim_Data (
    ID_Data INT IDENTITY(1,1) PRIMARY KEY,
    PelnaData SMALLDATETIME,  -- Zmiana na SMALLDATETIME
    Rok INT,
    Miesiac INT,
    Dzien INT,
    Kwartal VARCHAR(2)
);

-- Tabela faktów
CREATE TABLE F_PracaDyplomowa (
    ID_Praca INT FOREIGN KEY REFERENCES Dim_PracaDyplomowa(ID_Praca),
    ID_TypStudiow SMALLINT FOREIGN KEY REFERENCES Dim_TypStudiow(ID_TypStudiow),
    ID_Wydzial SMALLINT FOREIGN KEY REFERENCES Dim_Wydzial(ID_Wydzial),
    ID_Promotor INT FOREIGN KEY REFERENCES Dim_Osoba(ID_Osoba),
    ID_Data INT FOREIGN KEY REFERENCES Dim_Data(ID_Data),
    Ocena SMALLINT,
    LiczbaAutorow INT,
    LiczbaRecenzji INT,
    LiczbaSlowKluczowych INT
);