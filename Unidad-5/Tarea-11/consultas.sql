--Nota: Realiza cada consulta que sea posible utilizando INNER JOIN && WHERE.

--Proporciona una consulta que muestre solo los clientes de Brasil.

SELECT * from customers WHERE country regexp 'Brazil';
/**
┌────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.

sqlite> SELECT c.FIRSTNAME || ' ' || c.LastNAME as nombre_completo, i.InvoiceId, i.InvoiceDate, i.BillingCountry  FROM INVOICES as i join customers as c on i.CustomerId=c.CustomerId and 
 c.Country regexp 'Brazil';

sqlite> SELECT c.FIRSTNAME || ' ' || c.LastNAME as nombre_completo, i.InvoiceId, i.InvoiceDate, i.BillingCountry  FROM INVOICES as i, customers as c WHERE i.CustomerId=c.CustomerId and 
 c.Country regexp 'Brazil';


/**
┌─────────────────┬───────────┬─────────────────────┬────────────────┐
│ nombre_completo │ InvoiceId │     InvoiceDate     │ BillingCountry │
├─────────────────┼───────────┼─────────────────────┼────────────────┤
│ Luís Gonçalves  │ 98        │ 2010-03-11 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 121       │ 2010-06-13 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 143       │ 2010-09-15 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 195       │ 2011-05-06 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 316       │ 2012-10-27 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 327       │ 2012-12-07 00:00:00 │ Brazil         │
│ Luís Gonçalves  │ 382       │ 2013-08-07 00:00:00 │ Brazil         │
│ Eduardo Martins │ 25        │ 2009-04-09 00:00:00 │ Brazil         │
│ Eduardo Martins │ 154       │ 2010-11-14 00:00:00 │ Brazil         │
│ Eduardo Martins │ 177       │ 2011-02-16 00:00:00 │ Brazil         │
│ Eduardo Martins │ 199       │ 2011-05-21 00:00:00 │ Brazil         │
│ Eduardo Martins │ 251       │ 2012-01-09 00:00:00 │ Brazil         │
│ Eduardo Martins │ 372       │ 2013-07-02 00:00:00 │ Brazil         │
│ Eduardo Martins │ 383       │ 2013-08-12 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 57        │ 2009-09-06 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 68        │ 2009-10-17 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 123       │ 2010-06-17 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 252       │ 2012-01-22 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 275       │ 2012-04-25 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 297       │ 2012-07-28 00:00:00 │ Brazil         │
│ Alexandre Rocha │ 349       │ 2013-03-18 00:00:00 │ Brazil         │
│ Roberto Almeida │ 34        │ 2009-05-23 00:00:00 │ Brazil         │
│ Roberto Almeida │ 155       │ 2010-11-14 00:00:00 │ Brazil         │
│ Roberto Almeida │ 166       │ 2010-12-25 00:00:00 │ Brazil         │
│ Roberto Almeida │ 221       │ 2011-08-25 00:00:00 │ Brazil         │
│ Roberto Almeida │ 350       │ 2013-03-31 00:00:00 │ Brazil         │
│ Roberto Almeida │ 373       │ 2013-07-03 00:00:00 │ Brazil         │
│ Roberto Almeida │ 395       │ 2013-10-05 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 35        │ 2009-06-05 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 58        │ 2009-09-07 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 80        │ 2009-12-10 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 132       │ 2010-07-31 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 253       │ 2012-01-22 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 264       │ 2012-03-03 00:00:00 │ Brazil         │
│ Fernanda Ramos  │ 319       │ 2012-11-01 00:00:00 │ Brazil         │
└─────────────────┴───────────┴─────────────────────┴────────────────┘
**/


--Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.


SELECT * FROM employees WHERE title = "Sales Manager";
/**
┌────────────┬──────────┬───────────┬───────────────┬───────────┬─────────────────────┬─────────────────────┬──────────────┬─────────┬───────┬─────────┬────────────┬───────────────────┬───────────────────┬───────────────────────┐
│ EmployeeId │ LastName │ FirstName │     Title     │ ReportsTo │      BirthDate      │      HireDate       │   Address    │  City   │ State │ Country │ PostalCode │       Phone       │        Fax        │         Email         │
├────────────┼──────────┼───────────┼───────────────┼───────────┼─────────────────────┼─────────────────────┼──────────────┼─────────┼───────┼─────────┼────────────┼───────────────────┼───────────────────┼───────────────────────┤
│ 2          │ Edwards  │ Nancy     │ Sales Manager │ 1         │ 1958-12-08 00:00:00 │ 2002-05-01 00:00:00 │ 825 8 Ave SW │ Calgary │ AB    │ Canada  │ T2P 2T3    │ +1 (403) 262-3443 │ +1 (403) 262-3322 │ nancy@chinookcorp.com │
└────────────┴──────────┴───────────┴───────────────┴───────────┴─────────────────────┴─────────────────────┴──────────────┴─────────┴───────┴─────────┴────────────┴───────────────────┴───────────────────┴───────────────────────┘
**/

--Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.

SELECT DISTINCT BillingCountry FROM invoices;
/**
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Germany        │
│ Norway         │
│ Belgium        │
│ Canada         │
│ USA            │
│ France         │
│ Ireland        │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ India          │
│ Brazil         │
│ Portugal       │
│ Netherlands    │
│ Spain          │
│ Sweden         │
│ Czech Republic │
│ Finland        │
│ Denmark        │
│ Italy          │
│ Poland         │
│ Austria        │
│ Hungary        │
│ Argentina      │
└────────────────┘
**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil.

SELECT * FROM invoices i join customers c on i.CustomerID=c.CustomerID  
   ...> AND c.Country ='Brazil';

SELECT * FROM invoices i , customers c WHERE i.CustomerID=c.CustomerID  
   ...> AND c.Country ='Brazil';

/**
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┬────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┼────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┴────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

--Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.

SELECT e.firstname || ' ' || e.lastname as nombre_completo, i.* FROM INVOICES i, employees e  join customers c on c.SupportRepId=e.EmployeeID and c.CustomerID=i.CustomerID   
   ...> AND e.title='Sales Manager';

SELECT e.firstname || ' ' || e.lastname as nombre_completo, i.* FROM INVOICES i, employees e, customers c WHERE c.SupportRepId=e.EmployeeID and c.CustomerID=i.CustomerID   
   ...> AND e.title='Sales Manager';


--Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.


SELECT i.total, c.firstname || ' ' || c.Lastname as Nombre, c.country, e.firstname|| ' ' || e.lastname as nombre_agente   FROM INVOICES i, employees as e  join customers c on c.CustomerID=i.CustomerID and   
   ...> c.SupportRepId=e.EmployeeID ;

SELECT i.total, c.firstname || ' ' || c.Lastname as Nombre, c.country, e.firstname|| ' ' || e.lastname as nombre_agente   FROM INVOICES i, employees, customers c WHERE c.CustomerID=i.CustomerID and   
   ...> c.SupportRepId=e.EmployeeID ;

/**
┌───────┬───────────────────────┬────────────────┬───────────────┐
│ Total │        Nombre         │    Country     │ nombre_agente │
├───────┼───────────────────────┼────────────────┼───────────────┤
│ 3.98  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 3.96  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 5.94  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 0.99  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 1.98  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 13.86 │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 8.91  │ Luís Gonçalves        │ Brazil         │ Jane Peacock  │
│ 1.98  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 13.86 │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 8.91  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 1.98  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 3.96  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 5.94  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 0.99  │ Leonie Köhler         │ Germany        │ Steve Johnson │
│ 3.98  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 13.86 │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 8.91  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 1.98  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 3.96  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 5.94  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 0.99  │ François Tremblay     │ Canada         │ Jane Peacock  │
│ 3.96  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 5.94  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 0.99  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 1.98  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 15.86 │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 8.91  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 1.98  │ Bjørn Hansen          │ Norway         │ Margaret Park │
│ 1.98  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 3.96  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 5.94  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 0.99  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 1.98  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 16.86 │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 8.91  │ František Wichterlová │ Czech Republic │ Margaret Park │
│ 8.91  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 1.98  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 3.96  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 5.94  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 0.99  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 1.98  │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 25.86 │ Helena Holý           │ Czech Republic │ Steve Johnson │
│ 1.98  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 18.86 │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 8.91  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 1.98  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 3.96  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 5.94  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 0.99  │ Astrid Gruber         │ Austria        │ Steve Johnson │
│ 5.94  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 0.99  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 1.98  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 13.86 │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 8.91  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 1.98  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 3.96  │ Daan Peeters          │ Belgium        │ Margaret Park │
│ 1.98  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 3.96  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 5.94  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 0.99  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 1.98  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 13.86 │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 8.91  │ Kara Nielsen          │ Denmark        │ Margaret Park │
│ 8.91  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 1.98  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 3.96  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 5.94  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 0.99  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 1.98  │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 13.86 │ Eduardo Martins       │ Brazil         │ Margaret Park │
│ 1.98  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 13.86 │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 8.91  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 1.98  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 3.96  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 5.94  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 0.99  │ Alexandre Rocha       │ Brazil         │ Steve Johnson │
│ 0.99  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 1.98  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 13.86 │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 8.91  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 1.98  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 3.96  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 5.94  │ Roberto Almeida       │ Brazil         │ Jane Peacock  │
│ 1.98  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 3.96  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 5.94  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 0.99  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 1.98  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 13.86 │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 8.91  │ Fernanda Ramos        │ Brazil         │ Margaret Park │
│ 8.91  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 1.98  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 3.96  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 5.94  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 0.99  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 1.98  │ Mark Philips          │ Canada         │ Steve Johnson │
│ 13.86 │ Mark Philips          │ Canada         │ Steve Johnson │
│ 1.98  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 13.86 │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 9.91  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 1.98  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 3.96  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 5.94  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 0.99  │ Jennifer Peterson     │ Canada         │ Jane Peacock  │
│ 0.99  │ Frank Harris          │ USA            │ Margaret Park │
│ 1.98  │ Frank Harris          │ USA            │ Margaret Park │
│ 13.86 │ Frank Harris          │ USA            │ Margaret Park │
│ 8.91  │ Frank Harris          │ USA            │ Margaret Park │
│ 1.98  │ Frank Harris          │ USA            │ Margaret Park │
│ 3.96  │ Frank Harris          │ USA            │ Margaret Park │
│ 5.94  │ Frank Harris          │ USA            │ Margaret Park │
│ 1.98  │ Jack Smith            │ USA            │ Steve Johnson │
│ 3.96  │ Jack Smith            │ USA            │ Steve Johnson │
│ 5.94  │ Jack Smith            │ USA            │ Steve Johnson │
│ 0.99  │ Jack Smith            │ USA            │ Steve Johnson │
│ 1.98  │ Jack Smith            │ USA            │ Steve Johnson │
│ 13.86 │ Jack Smith            │ USA            │ Steve Johnson │
│ 10.91 │ Jack Smith            │ USA            │ Steve Johnson │
│ 1.98  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 3.96  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 5.94  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 0.99  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 1.98  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 13.86 │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 8.91  │ Michelle Brooks       │ USA            │ Jane Peacock  │
│ 1.98  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 13.86 │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 8.91  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 1.98  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 3.96  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 5.94  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 1.99  │ Tim Goyer             │ USA            │ Jane Peacock  │
│ 1.98  │ Dan Miller            │ USA            │ Margaret Park │
│ 13.86 │ Dan Miller            │ USA            │ Margaret Park │
│ 8.91  │ Dan Miller            │ USA            │ Margaret Park │
│ 3.98  │ Dan Miller            │ USA            │ Margaret Park │
│ 3.96  │ Dan Miller            │ USA            │ Margaret Park │
│ 5.94  │ Dan Miller            │ USA            │ Margaret Park │
│ 0.99  │ Dan Miller            │ USA            │ Margaret Park │
│ 3.96  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 5.94  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 0.99  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 1.98  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 13.86 │ Kathy Chase           │ USA            │ Steve Johnson │
│ 8.91  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 1.98  │ Kathy Chase           │ USA            │ Steve Johnson │
│ 1.98  │ Heather Leacock       │ USA            │ Margaret Park │
│ 3.96  │ Heather Leacock       │ USA            │ Margaret Park │
│ 5.94  │ Heather Leacock       │ USA            │ Margaret Park │
│ 0.99  │ Heather Leacock       │ USA            │ Margaret Park │
│ 3.98  │ Heather Leacock       │ USA            │ Margaret Park │
│ 13.86 │ Heather Leacock       │ USA            │ Margaret Park │
│ 8.91  │ Heather Leacock       │ USA            │ Margaret Park │
│ 13.86 │ John Gordon           │ USA            │ Margaret Park │
│ 8.91  │ John Gordon           │ USA            │ Margaret Park │
│ 1.98  │ John Gordon           │ USA            │ Margaret Park │
│ 3.96  │ John Gordon           │ USA            │ Margaret Park │
│ 5.94  │ John Gordon           │ USA            │ Margaret Park │
│ 0.99  │ John Gordon           │ USA            │ Margaret Park │
│ 1.98  │ John Gordon           │ USA            │ Margaret Park │
│ 1.98  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 15.86 │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 8.91  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 1.98  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 7.96  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 5.94  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 0.99  │ Frank Ralston         │ USA            │ Jane Peacock  │
│ 5.94  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 0.99  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 1.98  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 18.86 │ Victor Stevens        │ USA            │ Steve Johnson │
│ 8.91  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 1.98  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 3.96  │ Victor Stevens        │ USA            │ Steve Johnson │
│ 1.98  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 3.96  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 5.94  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 0.99  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 1.98  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 23.86 │ Richard Cunningham    │ USA            │ Margaret Park │
│ 8.91  │ Richard Cunningham    │ USA            │ Margaret Park │
│ 8.91  │ Patrick Gray          │ USA            │ Margaret Park │
│ 1.98  │ Patrick Gray          │ USA            │ Margaret Park │
│ 3.96  │ Patrick Gray          │ USA            │ Margaret Park │
│ 5.94  │ Patrick Gray          │ USA            │ Margaret Park │
│ 0.99  │ Patrick Gray          │ USA            │ Margaret Park │
│ 1.98  │ Patrick Gray          │ USA            │ Margaret Park │
│ 13.86 │ Patrick Gray          │ USA            │ Margaret Park │
│ 1.98  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 13.86 │ Julia Barnett         │ USA            │ Steve Johnson │
│ 8.91  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 1.98  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 3.96  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 11.94 │ Julia Barnett         │ USA            │ Steve Johnson │
│ 0.99  │ Julia Barnett         │ USA            │ Steve Johnson │
│ 0.99  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 1.98  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 13.86 │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 8.91  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 1.98  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 3.96  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 5.94  │ Robert Brown          │ Canada         │ Jane Peacock  │
│ 1.98  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 3.96  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 5.94  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 0.99  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 1.98  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 13.86 │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 8.91  │ Edward Francis        │ Canada         │ Jane Peacock  │
│ 8.91  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 1.98  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 3.96  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 5.94  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 0.99  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 1.98  │ Martha Silk           │ Canada         │ Steve Johnson │
│ 13.86 │ Martha Silk           │ Canada         │ Steve Johnson │
│ 1.98  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 13.86 │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 8.91  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 1.98  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 3.96  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 5.94  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 0.99  │ Aaron Mitchell        │ Canada         │ Margaret Park │
│ 0.99  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 1.98  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 13.86 │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 8.91  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 1.98  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 3.96  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 5.94  │ Ellie Sullivan        │ Canada         │ Jane Peacock  │
│ 1.98  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 3.96  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 5.94  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 0.99  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 1.98  │ João Fernandes        │ Portugal       │ Margaret Park │
│ 13.86 │ João Fernandes        │ Portugal       │ Margaret Park │
│ 10.91 │ João Fernandes        │ Portugal       │ Margaret Park │
│ 1.98  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 3.96  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 5.94  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 0.99  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 1.98  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 13.86 │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 8.91  │ Madalena Sampaio      │ Portugal       │ Margaret Park │
│ 1.98  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 13.86 │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 8.91  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 1.98  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 3.96  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 5.94  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 0.99  │ Hannah Schneider      │ Germany        │ Steve Johnson │
│ 0.99  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 1.98  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 13.86 │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 14.91 │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 1.98  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 3.96  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 5.94  │ Fynn Zimmermann       │ Germany        │ Jane Peacock  │
│ 1.98  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 3.96  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 5.94  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 0.99  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 1.98  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 13.86 │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 8.91  │ Niklas Schröder       │ Germany        │ Jane Peacock  │
│ 1.98  │ Camille Bernard       │ France         │ Margaret Park │
│ 3.96  │ Camille Bernard       │ France         │ Margaret Park │
│ 5.94  │ Camille Bernard       │ France         │ Margaret Park │
│ 1.99  │ Camille Bernard       │ France         │ Margaret Park │
│ 1.98  │ Camille Bernard       │ France         │ Margaret Park │
│ 13.86 │ Camille Bernard       │ France         │ Margaret Park │
│ 8.91  │ Camille Bernard       │ France         │ Margaret Park │
│ 1.98  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 13.86 │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 8.91  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 2.98  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 3.96  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 5.94  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 0.99  │ Dominique Lefebvre    │ France         │ Margaret Park │
│ 1.98  │ Marc Dubois           │ France         │ Steve Johnson │
│ 13.86 │ Marc Dubois           │ France         │ Steve Johnson │
│ 8.91  │ Marc Dubois           │ France         │ Steve Johnson │
│ 1.98  │ Marc Dubois           │ France         │ Steve Johnson │
│ 3.96  │ Marc Dubois           │ France         │ Steve Johnson │
│ 5.94  │ Marc Dubois           │ France         │ Steve Johnson │
│ 0.99  │ Marc Dubois           │ France         │ Steve Johnson │
│ 3.96  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 5.94  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 0.99  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 3.98  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 13.86 │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 8.91  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 1.98  │ Wyatt Girard          │ France         │ Jane Peacock  │
│ 1.98  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 3.96  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 5.94  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 0.99  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 1.98  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 16.86 │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 8.91  │ Isabelle Mercier      │ France         │ Jane Peacock  │
│ 8.91  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 1.98  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 7.96  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 5.94  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 0.99  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 1.98  │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 13.86 │ Terhi Hämäläinen      │ Finland        │ Jane Peacock  │
│ 1.98  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 21.86 │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 8.91  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 1.98  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 3.96  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 5.94  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 0.99  │ Ladislav Kovács       │ Hungary        │ Jane Peacock  │
│ 5.94  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 0.99  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 1.98  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 21.86 │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 8.91  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 1.98  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 3.96  │ Hugh O'Reilly         │ Ireland        │ Jane Peacock  │
│ 1.98  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 3.96  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 5.94  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 0.99  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 1.98  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 13.86 │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 8.91  │ Lucas Mancini         │ Italy          │ Steve Johnson │
│ 8.91  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 1.98  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 3.96  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 8.94  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 0.99  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 1.98  │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 13.86 │ Johannes Van der Berg │ Netherlands    │ Steve Johnson │
│ 1.98  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 13.86 │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 8.91  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 1.98  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 3.96  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 5.94  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 0.99  │ Stanisław Wójcik      │ Poland         │ Margaret Park │
│ 0.99  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 1.98  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 13.86 │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 8.91  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 1.98  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 3.96  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 5.94  │ Enrique Muñoz         │ Spain          │ Steve Johnson │
│ 1.98  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 3.96  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 6.94  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 0.99  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 1.98  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 13.86 │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 8.91  │ Joakim Johansson      │ Sweden         │ Steve Johnson │
│ 8.91  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 3.96  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 5.94  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 0.99  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 13.86 │ Emma Jones            │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 13.86 │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 8.91  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 1.98  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 3.96  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 5.94  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 0.99  │ Phil Hughes           │ United Kingdom │ Jane Peacock  │
│ 0.99  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 1.98  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 13.86 │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 8.91  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 1.98  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 3.96  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 5.94  │ Steve Murray          │ United Kingdom │ Steve Johnson │
│ 1.98  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 3.96  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 5.94  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 0.99  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 1.98  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 13.86 │ Mark Taylor           │ Australia      │ Margaret Park │
│ 8.91  │ Mark Taylor           │ Australia      │ Margaret Park │
│ 1.98  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 3.96  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 5.94  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 0.99  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 1.98  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 13.86 │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 8.91  │ Diego Gutiérrez       │ Argentina      │ Margaret Park │
│ 1.98  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 13.86 │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 17.91 │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 1.98  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 3.96  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 5.94  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 0.99  │ Luis Rojas            │ Chile          │ Steve Johnson │
│ 1.98  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 13.86 │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 8.91  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 1.98  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 3.96  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 5.94  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 1.99  │ Manoj Pareek          │ India          │ Jane Peacock  │
│ 3.96  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 5.94  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 1.99  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 1.98  │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 13.86 │ Puja Srivastava       │ India          │ Jane Peacock  │
│ 8.91  │ Puja Srivastava       │ India          │ Jane Peacock  │
└───────┴───────────────────────┴────────────────┴───────────────┘

**/

--¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?


SELECT  COUNT(invoiceid) as total_ventas FROM invoices 
   ...> WHERE invoiceDate REGEXP '2009' or invoicedate REGEXP '2011';

/**
┌──────────────┐
│ total_ventas │
├──────────────┤
│ 166          │
└──────────────┘
**/


--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.

SELECT COUNT(InvoiceLineId) as total_items from invoice_items      
   ...> WHERE InvoiceId = 37;

/**
┌─────────────┐
│ total_items │
├─────────────┤
│ 4           │
└─────────────┘
**/


--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY





--Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

--Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.

--Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.

--Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

--Proporciona una consulta que muestre todas las facturas.

SELECT * FROM TRACKS;
/**
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3061    │ Big Bad Bill (Is Sweet William Now)                          │ 242     │ 1           │ 1       │ Jack Yellen/Milton Ager                                      │ 165146       │ 5489609    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3062    │ The Full Bug                                                 │ 242     │ 1           │ 1       │ Alex Van Halen/David Lee Roth/Edward Van Halen/Michael Antho │ 201116       │ 6551013    │ 0.99      │
│         │                                                              │         │             │         │ ny                                                           │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3063    │ Happy Trails                                                 │ 242     │ 1           │ 1       │ Dale Evans                                                   │ 65488        │ 2111141    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3064    │ Eruption                                                     │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth, Michael An │ 102164       │ 3272891    │ 0.99      │
│         │                                                              │         │             │         │ thony                                                        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3065    │ Ain't Talkin' 'bout Love                                     │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth, Michael An │ 228336       │ 7569506    │ 0.99      │
│         │                                                              │         │             │         │ thony                                                        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3066    │ Runnin' With The Devil                                       │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth, Michael An │ 215902       │ 7061901    │ 0.99      │
│         │                                                              │         │             │         │ thony                                                        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3067    │ Dance the Night Away                                         │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth, Michael An │ 185965       │ 6087433    │ 0.99      │
│         │                                                              │         │             │         │ thony                                                        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3068    │ And the Cradle Will Rock...                                  │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth, Michael An │ 213968       │ 7011402    │ 0.99      │
│         │                                                              │         │             │         │ thony                                                        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3069    │ Unchained                                                    │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth, Michael An │ 208953       │ 6777078    │ 0.99      │
│         │                                                              │         │             │         │ thony                                                        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3070    │ Jump                                                         │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth             │ 241711       │ 7911090    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3071    │ Panama                                                       │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, David Lee Roth             │ 211853       │ 6921784    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3072    │ Why Can't This Be Love                                       │ 243     │ 1           │ 1       │ Van Halen                                                    │ 227761       │ 7457655    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3073    │ Dreams                                                       │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony,/Edward Va │ 291813       │ 9504119    │ 0.99      │
│         │                                                              │         │             │         │ n Halen, Alex Van Halen, Michael Anthony, Sammy Hagar        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3074    │ When It's Love                                               │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony,/Edward Va │ 338991       │ 11049966   │ 0.99      │
│         │                                                              │         │             │         │ n Halen, Alex Van Halen, Michael Anthony, Sammy Hagar        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3075    │ Poundcake                                                    │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony,/Edward Va │ 321854       │ 10366978   │ 0.99      │
│         │                                                              │         │             │         │ n Halen, Alex Van Halen, Michael Anthony, Sammy Hagar        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3076    │ Right Now                                                    │ 243     │ 1           │ 1       │ Van Halen                                                    │ 321828       │ 10503352   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3077    │ Can't Stop Loving You                                        │ 243     │ 1           │ 1       │ Van Halen                                                    │ 248502       │ 8107896    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3078    │ Humans Being                                                 │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony,/Edward Va │ 308950       │ 10014683   │ 0.99      │
│         │                                                              │         │             │         │ n Halen, Alex Van Halen, Michael Anthony, Sammy Hagar        │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3079    │ Can't Get This Stuff No More                                 │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony,/Edward Va │ 315376       │ 10355753   │ 0.99      │
│         │                                                              │         │             │         │ n Halen, Alex Van Halen, Michael Anthony, David Lee Roth     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3080    │ Me Wise Magic                                                │ 243     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony,/Edward Va │ 366053       │ 12013467   │ 0.99      │
│         │                                                              │         │             │         │ n Halen, Alex Van Halen, Michael Anthony, David Lee Roth     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3081    │ Runnin' With The Devil                                       │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 216032       │ 7056863    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3082    │ Eruption                                                     │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 102556       │ 3286026    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3083    │ You Really Got Me                                            │ 244     │ 1           │ 1       │ Ray Davies                                                   │ 158589       │ 5194092    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3084    │ Ain't Talkin' 'Bout Love                                     │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 230060       │ 7617284    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3085    │ I'm The One                                                  │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 226507       │ 7373922    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3086    │ Jamie's Cryin'                                               │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 210546       │ 6946086    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3087    │ Atomic Punk                                                  │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 182073       │ 5908861    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3088    │ Feel Your Love Tonight                                       │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 222850       │ 7293608    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3089    │ Little Dreamer                                               │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 203258       │ 6648122    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3090    │ Ice Cream Man                                                │ 244     │ 1           │ 1       │ John Brim                                                    │ 200306       │ 6573145    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3091    │ On Fire                                                      │ 244     │ 1           │ 1       │ Edward Van Halen, Alex Van Halen, Michael Anthony and David  │ 180636       │ 5879235    │ 0.99      │
│         │                                                              │         │             │         │ Lee Roth                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3092    │ Neworld                                                      │ 245     │ 1           │ 1       │ Van Halen                                                    │ 105639       │ 3495897    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3093    │ Without You                                                  │ 245     │ 1           │ 1       │ Van Halen                                                    │ 390295       │ 12619558   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3094    │ One I Want                                                   │ 245     │ 1           │ 1       │ Van Halen                                                    │ 330788       │ 10743970   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3095    │ From Afar                                                    │ 245     │ 1           │ 1       │ Van Halen                                                    │ 324414       │ 10524554   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3096    │ Dirty Water Dog                                              │ 245     │ 1           │ 1       │ Van Halen                                                    │ 327392       │ 10709202   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3097    │ Once                                                         │ 245     │ 1           │ 1       │ Van Halen                                                    │ 462837       │ 15378082   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3098    │ Fire in the Hole                                             │ 245     │ 1           │ 1       │ Van Halen                                                    │ 331728       │ 10846768   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3099    │ Josephina                                                    │ 245     │ 1           │ 1       │ Van Halen                                                    │ 342491       │ 11161521   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3100    │ Year to the Day                                              │ 245     │ 1           │ 1       │ Van Halen                                                    │ 514612       │ 16621333   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3101    │ Primary                                                      │ 245     │ 1           │ 1       │ Van Halen                                                    │ 86987        │ 2812555    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3102    │ Ballot or the Bullet                                         │ 245     │ 1           │ 1       │ Van Halen                                                    │ 342282       │ 11212955   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3103    │ How Many Say I                                               │ 245     │ 1           │ 1       │ Van Halen                                                    │ 363937       │ 11716855   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3104    │ Sucker Train Blues                                           │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 267859       │ 8738780    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3105    │ Do It For The Kids                                           │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 235911       │ 7693331    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3106    │ Big Machine                                                  │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 265613       │ 8673442    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3107    │ Illegal I Song                                               │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 257750       │ 8483347    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3108    │ Spectacle                                                    │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 221701       │ 7252876    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3109    │ Fall To Pieces                                               │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 270889       │ 8823096    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3110    │ Headspace                                                    │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 223033       │ 7237986    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3111    │ Superhuman                                                   │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 255921       │ 8365328    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3112    │ Set Me Free                                                  │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 247954       │ 8053388    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3113    │ You Got No Right                                             │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 335412       │ 10991094   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3114    │ Slither                                                      │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 248398       │ 8118785    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3115    │ Dirty Little Thing                                           │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Keith Nelson, Matt Sorum, Scott Weiland  │ 237844       │ 7732982    │ 0.99      │
│         │                                                              │         │             │         │ & Slash                                                      │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3116    │ Loving The Alien                                             │ 246     │ 1           │ 1       │ Dave Kushner, Duff, Matt Sorum, Scott Weiland & Slash        │ 348786       │ 11412762   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3117    │ Pela Luz Dos Olhos Teus                                      │ 247     │ 1           │ 7       │                                                              │ 119196       │ 3905715    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3118    │ A Bencao E Outros                                            │ 247     │ 1           │ 7       │                                                              │ 421093       │ 14234427   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3119    │ Tudo Na Mais Santa Paz                                       │ 247     │ 1           │ 7       │                                                              │ 222406       │ 7426757    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3120    │ O Velho E Aflor                                              │ 247     │ 1           │ 7       │                                                              │ 275121       │ 9126828    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3121    │ Cotidiano N 2                                                │ 247     │ 1           │ 7       │                                                              │ 55902        │ 1805797    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3122    │ Adeus                                                        │ 247     │ 1           │ 7       │                                                              │ 221884       │ 7259351    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3123    │ Samba Pra Endrigo                                            │ 247     │ 1           │ 7       │                                                              │ 259265       │ 8823551    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3124    │ So Por Amor                                                  │ 247     │ 1           │ 7       │                                                              │ 236591       │ 7745764    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3125    │ Meu Pranto Rolou                                             │ 247     │ 1           │ 7       │                                                              │ 181760       │ 6003345    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3126    │ Mulher Carioca                                               │ 247     │ 1           │ 7       │                                                              │ 191686       │ 6395048    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3127    │ Um Homem Chamado Alfredo                                     │ 247     │ 1           │ 7       │                                                              │ 151640       │ 4976227    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3128    │ Samba Do Jato                                                │ 247     │ 1           │ 7       │                                                              │ 220813       │ 7357840    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3129    │ Oi, La                                                       │ 247     │ 1           │ 7       │                                                              │ 167053       │ 5562700    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3130    │ Vinicius, Poeta Do Encontro                                  │ 247     │ 1           │ 7       │                                                              │ 336431       │ 10858776   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3131    │ Soneto Da Separacao                                          │ 247     │ 1           │ 7       │                                                              │ 193880       │ 6277511    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3132    │ Still Of The Night                                           │ 141     │ 1           │ 3       │ Sykes                                                        │ 398210       │ 13043817   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3133    │ Here I Go Again                                              │ 141     │ 1           │ 3       │ Marsden                                                      │ 233874       │ 7652473    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3134    │ Is This Love                                                 │ 141     │ 1           │ 3       │ Sykes                                                        │ 283924       │ 9262360    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3135    │ Love Ain't No Stranger                                       │ 141     │ 1           │ 3       │ Galley                                                       │ 259395       │ 8490428    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3136    │ Looking For Love                                             │ 141     │ 1           │ 3       │ Sykes                                                        │ 391941       │ 12769847   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3137    │ Now You're Gone                                              │ 141     │ 1           │ 3       │ Vandenberg                                                   │ 251141       │ 8162193    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3138    │ Slide It In                                                  │ 141     │ 1           │ 3       │ Coverdale                                                    │ 202475       │ 6615152    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3139    │ Slow An' Easy                                                │ 141     │ 1           │ 3       │ Moody                                                        │ 367255       │ 11961332   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3140    │ Judgement Day                                                │ 141     │ 1           │ 3       │ Vandenberg                                                   │ 317074       │ 10326997   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3141    │ You're Gonna Break My Hart Again                             │ 141     │ 1           │ 3       │ Sykes                                                        │ 250853       │ 8176847    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3142    │ The Deeper The Love                                          │ 141     │ 1           │ 3       │ Vandenberg                                                   │ 262791       │ 8606504    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3143    │ Crying In The Rain                                           │ 141     │ 1           │ 3       │ Coverdale                                                    │ 337005       │ 10931921   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3144    │ Fool For Your Loving                                         │ 141     │ 1           │ 3       │ Marsden/Moody                                                │ 250801       │ 8129820    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3145    │ Sweet Lady Luck                                              │ 141     │ 1           │ 3       │ Vandenberg                                                   │ 273737       │ 8919163    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3146    │ Faixa Amarela                                                │ 248     │ 1           │ 7       │ Beto Gogo/Jessé Pai/Luiz Carlos/Zeca Pagodinho               │ 240692       │ 8082036    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3147    │ Posso Até Me Apaixonar                                       │ 248     │ 1           │ 7       │ Dudu Nobre                                                   │ 200698       │ 6735526    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3148    │ Não Sou Mais Disso                                           │ 248     │ 1           │ 7       │ Jorge Aragão/Zeca Pagodinho                                  │ 225985       │ 7613817    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3149    │ Vivo Isolado Do Mundo                                        │ 248     │ 1           │ 7       │ Alcides Dias Lopes                                           │ 180035       │ 6073995    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3150    │ Coração Em Desalinho                                         │ 248     │ 1           │ 7       │ Mauro Diniz/Ratino Sigem                                     │ 185208       │ 6225948    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3151    │ Seu Balancê                                                  │ 248     │ 1           │ 7       │ Paulinho Rezende/Toninho Geraes                              │ 219454       │ 7311219    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3152    │ Vai Adiar                                                    │ 248     │ 1           │ 7       │ Alcino Corrêa/Monarco                                        │ 270393       │ 9134882    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3153    │ Rugas                                                        │ 248     │ 1           │ 7       │ Augusto Garcez/Nelson Cavaquinho                             │ 140930       │ 4703182    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3154    │ Feirinha da Pavuna/Luz do Repente/Bagaço da Laranja          │ 248     │ 1           │ 7       │ Arlindo Cruz/Franco/Marquinhos PQD/Negro, Jovelina Pérolo/Ze │ 107206       │ 3593684    │ 0.99      │
│         │                                                              │         │             │         │ ca Pagodinho                                                 │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3155    │ Sem Essa de Malandro Agulha                                  │ 248     │ 1           │ 7       │ Aldir Blanc/Jayme Vignoli                                    │ 158484       │ 5332668    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3156    │ Chico Não Vai na Corimba                                     │ 248     │ 1           │ 7       │ Dudu Nobre/Zeca Pagodinho                                    │ 269374       │ 9122188    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3157    │ Papel Principal                                              │ 248     │ 1           │ 7       │ Almir Guineto/Dedé Paraiso/Luverci Ernesto                   │ 217495       │ 7325302    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3158    │ Saudade Louca                                                │ 248     │ 1           │ 7       │ Acyr Marques/Arlindo Cruz/Franco                             │ 243591       │ 8136475    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3159    │ Camarão que Dorme e Onda Leva                                │ 248     │ 1           │ 7       │ Acyi Marques/Arlindo Bruz/Braço, Beto Sem/Zeca Pagodinho     │ 299102       │ 10012231   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3160    │ Sapopemba e Maxambomba                                       │ 248     │ 1           │ 7       │ Nei Lopes/Wilson Moreira                                     │ 245394       │ 8268712    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3161    │ Minha Fé                                                     │ 248     │ 1           │ 7       │ Murilão                                                      │ 206994       │ 6981474    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3162    │ Lua de Ogum                                                  │ 248     │ 1           │ 7       │ Ratinho/Zeca Pagodinho                                       │ 168463       │ 5719129    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3163    │ Samba pras moças                                             │ 248     │ 1           │ 7       │ Grazielle/Roque Ferreira                                     │ 152816       │ 5121366    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3164    │ Verdade                                                      │ 248     │ 1           │ 7       │ Carlinhos Santana/Nelson Rufino                              │ 332826       │ 11120708   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3165    │ The Brig                                                     │ 229     │ 3           │ 21      │                                                              │ 2617325      │ 488919543  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3166    │ .07%                                                         │ 228     │ 3           │ 21      │                                                              │ 2585794      │ 541715199  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3167    │ Five Years Gone                                              │ 228     │ 3           │ 21      │                                                              │ 2587712      │ 530551890  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3168    │ The Hard Part                                                │ 228     │ 3           │ 21      │                                                              │ 2601017      │ 475996611  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3169    │ The Man Behind the Curtain                                   │ 229     │ 3           │ 21      │                                                              │ 2615990      │ 493951081  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3170    │ Greatest Hits                                                │ 229     │ 3           │ 21      │                                                              │ 2617117      │ 522102916  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3171    │ Landslide                                                    │ 228     │ 3           │ 21      │                                                              │ 2600725      │ 518677861  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3172    │ The Office: An American Workplace (Pilot)                    │ 249     │ 3           │ 19      │                                                              │ 1380833      │ 290482361  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3173    │ Diversity Day                                                │ 249     │ 3           │ 19      │                                                              │ 1306416      │ 257879716  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3174    │ Health Care                                                  │ 249     │ 3           │ 19      │                                                              │ 1321791      │ 260493577  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3175    │ The Alliance                                                 │ 249     │ 3           │ 19      │                                                              │ 1317125      │ 266203162  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3176    │ Basketball                                                   │ 249     │ 3           │ 19      │                                                              │ 1323541      │ 267464180  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3177    │ Hot Girl                                                     │ 249     │ 3           │ 19      │                                                              │ 1325458      │ 267836576  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3178    │ The Dundies                                                  │ 250     │ 3           │ 19      │                                                              │ 1253541      │ 246845576  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3179    │ Sexual Harassment                                            │ 250     │ 3           │ 19      │                                                              │ 1294541      │ 273069146  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3180    │ Office Olympics                                              │ 250     │ 3           │ 19      │                                                              │ 1290458      │ 256247623  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3181    │ The Fire                                                     │ 250     │ 3           │ 19      │                                                              │ 1288166      │ 266856017  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3182    │ Halloween                                                    │ 250     │ 3           │ 19      │                                                              │ 1315333      │ 249205209  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3183    │ The Fight                                                    │ 250     │ 3           │ 19      │                                                              │ 1320028      │ 277149457  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3184    │ The Client                                                   │ 250     │ 3           │ 19      │                                                              │ 1299341      │ 253836788  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3185    │ Performance Review                                           │ 250     │ 3           │ 19      │                                                              │ 1292458      │ 256143822  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3186    │ Email Surveillance                                           │ 250     │ 3           │ 19      │                                                              │ 1328870      │ 265101113  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3187    │ Christmas Party                                              │ 250     │ 3           │ 19      │                                                              │ 1282115      │ 260891300  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3188    │ Booze Cruise                                                 │ 250     │ 3           │ 19      │                                                              │ 1267958      │ 252518021  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3189    │ The Injury                                                   │ 250     │ 3           │ 19      │                                                              │ 1275275      │ 253912762  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3190    │ The Secret                                                   │ 250     │ 3           │ 19      │                                                              │ 1264875      │ 253143200  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3191    │ The Carpet                                                   │ 250     │ 3           │ 19      │                                                              │ 1264375      │ 256477011  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3192    │ Boys and Girls                                               │ 250     │ 3           │ 19      │                                                              │ 1278333      │ 255245729  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3193    │ Valentine's Day                                              │ 250     │ 3           │ 19      │                                                              │ 1270375      │ 253552710  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3194    │ Dwight's Speech                                              │ 250     │ 3           │ 19      │                                                              │ 1278041      │ 255001728  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3195    │ Take Your Daughter to Work Day                               │ 250     │ 3           │ 19      │                                                              │ 1268333      │ 253451012  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3196    │ Michael's Birthday                                           │ 250     │ 3           │ 19      │                                                              │ 1237791      │ 247238398  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3197    │ Drug Testing                                                 │ 250     │ 3           │ 19      │                                                              │ 1278625      │ 244626927  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3198    │ Conflict Resolution                                          │ 250     │ 3           │ 19      │                                                              │ 1274583      │ 253808658  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3199    │ Casino Night - Season Finale                                 │ 250     │ 3           │ 19      │                                                              │ 1712791      │ 327642458  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3200    │ Gay Witch Hunt                                               │ 251     │ 3           │ 19      │                                                              │ 1326534      │ 276942637  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3201    │ The Convention                                               │ 251     │ 3           │ 19      │                                                              │ 1297213      │ 255117055  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3202    │ The Coup                                                     │ 251     │ 3           │ 19      │                                                              │ 1276526      │ 267205501  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3203    │ Grief Counseling                                             │ 251     │ 3           │ 19      │                                                              │ 1282615      │ 256912833  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3204    │ The Initiation                                               │ 251     │ 3           │ 19      │                                                              │ 1280113      │ 251728257  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3205    │ Diwali                                                       │ 251     │ 3           │ 19      │                                                              │ 1279904      │ 252726644  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3206    │ Branch Closing                                               │ 251     │ 3           │ 19      │                                                              │ 1822781      │ 358761786  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3207    │ The Merger                                                   │ 251     │ 3           │ 19      │                                                              │ 1801926      │ 345960631  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3208    │ The Convict                                                  │ 251     │ 3           │ 22      │                                                              │ 1273064      │ 248863427  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3209    │ A Benihana Christmas, Pts. 1 & 2                             │ 251     │ 3           │ 22      │                                                              │ 2519436      │ 515301752  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3210    │ Back from Vacation                                           │ 251     │ 3           │ 22      │                                                              │ 1271688      │ 245378749  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3211    │ Traveling Salesmen                                           │ 251     │ 3           │ 22      │                                                              │ 1289039      │ 250822697  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3212    │ Producer's Cut: The Return                                   │ 251     │ 3           │ 22      │                                                              │ 1700241      │ 337219980  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3213    │ Ben Franklin                                                 │ 251     │ 3           │ 22      │                                                              │ 1271938      │ 264168080  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3214    │ Phyllis's Wedding                                            │ 251     │ 3           │ 22      │                                                              │ 1271521      │ 258561054  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3215    │ Business School                                              │ 251     │ 3           │ 22      │                                                              │ 1302093      │ 254402605  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3216    │ Cocktails                                                    │ 251     │ 3           │ 22      │                                                              │ 1272522      │ 259011909  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3217    │ The Negotiation                                              │ 251     │ 3           │ 22      │                                                              │ 1767851      │ 371663719  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3218    │ Safety Training                                              │ 251     │ 3           │ 22      │                                                              │ 1271229      │ 253054534  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3219    │ Product Recall                                               │ 251     │ 3           │ 22      │                                                              │ 1268268      │ 251208610  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3220    │ Women's Appreciation                                         │ 251     │ 3           │ 22      │                                                              │ 1732649      │ 338778844  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3221    │ Beach Games                                                  │ 251     │ 3           │ 22      │                                                              │ 1676134      │ 333671149  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3222    │ The Job                                                      │ 251     │ 3           │ 22      │                                                              │ 2541875      │ 501060138  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3223    │ How to Stop an Exploding Man                                 │ 228     │ 3           │ 21      │                                                              │ 2687103      │ 487881159  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3224    │ Through a Looking Glass                                      │ 229     │ 3           │ 21      │                                                              │ 5088838      │ 1059546140 │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3225    │ Your Time Is Gonna Come                                      │ 252     │ 2           │ 1       │ Page, Jones                                                  │ 310774       │ 5126563    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3226    │ Battlestar Galactica, Pt. 1                                  │ 253     │ 3           │ 20      │                                                              │ 2952702      │ 541359437  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3227    │ Battlestar Galactica, Pt. 2                                  │ 253     │ 3           │ 20      │                                                              │ 2956081      │ 521387924  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3228    │ Battlestar Galactica, Pt. 3                                  │ 253     │ 3           │ 20      │                                                              │ 2927802      │ 554509033  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3229    │ Lost Planet of the Gods, Pt. 1                               │ 253     │ 3           │ 20      │                                                              │ 2922547      │ 537812711  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3230    │ Lost Planet of the Gods, Pt. 2                               │ 253     │ 3           │ 20      │                                                              │ 2914664      │ 534343985  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3231    │ The Lost Warrior                                             │ 253     │ 3           │ 20      │                                                              │ 2920045      │ 558872190  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3232    │ The Long Patrol                                              │ 253     │ 3           │ 20      │                                                              │ 2925008      │ 513122217  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3233    │ The Gun On Ice Planet Zero, Pt. 1                            │ 253     │ 3           │ 20      │                                                              │ 2907615      │ 540980196  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3234    │ The Gun On Ice Planet Zero, Pt. 2                            │ 253     │ 3           │ 20      │                                                              │ 2924341      │ 546542281  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3235    │ The Magnificent Warriors                                     │ 253     │ 3           │ 20      │                                                              │ 2924716      │ 570152232  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3236    │ The Young Lords                                              │ 253     │ 3           │ 20      │                                                              │ 2863571      │ 587051735  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3237    │ The Living Legend, Pt. 1                                     │ 253     │ 3           │ 20      │                                                              │ 2924507      │ 503641007  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3238    │ The Living Legend, Pt. 2                                     │ 253     │ 3           │ 20      │                                                              │ 2923298      │ 515632754  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3239    │ Fire In Space                                                │ 253     │ 3           │ 20      │                                                              │ 2926593      │ 536784757  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3240    │ War of the Gods, Pt. 1                                       │ 253     │ 3           │ 20      │                                                              │ 2922630      │ 505761343  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3241    │ War of the Gods, Pt. 2                                       │ 253     │ 3           │ 20      │                                                              │ 2923381      │ 487899692  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3242    │ The Man With Nine Lives                                      │ 253     │ 3           │ 20      │                                                              │ 2956998      │ 577829804  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3243    │ Murder On the Rising Star                                    │ 253     │ 3           │ 20      │                                                              │ 2935894      │ 551759986  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3244    │ Greetings from Earth, Pt. 1                                  │ 253     │ 3           │ 20      │                                                              │ 2960293      │ 536824558  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3245    │ Greetings from Earth, Pt. 2                                  │ 253     │ 3           │ 20      │                                                              │ 2903778      │ 527842860  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3246    │ Baltar's Escape                                              │ 253     │ 3           │ 20      │                                                              │ 2922088      │ 525564224  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3247    │ Experiment In Terra                                          │ 253     │ 3           │ 20      │                                                              │ 2923548      │ 547982556  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3248    │ Take the Celestra                                            │ 253     │ 3           │ 20      │                                                              │ 2927677      │ 512381289  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3249    │ The Hand of God                                              │ 253     │ 3           │ 20      │                                                              │ 2924007      │ 536583079  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3250    │ Pilot                                                        │ 254     │ 3           │ 19      │                                                              │ 2484567      │ 492670102  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3251    │ Through the Looking Glass, Pt. 2                             │ 229     │ 3           │ 21      │                                                              │ 2617117      │ 550943353  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3252    │ Through the Looking Glass, Pt. 1                             │ 229     │ 3           │ 21      │                                                              │ 2610860      │ 493211809  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3253    │ Instant Karma                                                │ 255     │ 2           │ 9       │                                                              │ 193188       │ 3150090    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3254    │ #9 Dream                                                     │ 255     │ 2           │ 9       │                                                              │ 278312       │ 4506425    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3255    │ Mother                                                       │ 255     │ 2           │ 9       │                                                              │ 287740       │ 4656660    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3256    │ Give Peace a Chance                                          │ 255     │ 2           │ 9       │                                                              │ 274644       │ 4448025    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3257    │ Cold Turkey                                                  │ 255     │ 2           │ 9       │                                                              │ 281424       │ 4556003    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3258    │ Whatever Gets You Thru the Night                             │ 255     │ 2           │ 9       │                                                              │ 215084       │ 3499018    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3259    │ I'm Losing You                                               │ 255     │ 2           │ 9       │                                                              │ 240719       │ 3907467    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3260    │ Gimme Some Truth                                             │ 255     │ 2           │ 9       │                                                              │ 232778       │ 3780807    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3261    │ Oh, My Love                                                  │ 255     │ 2           │ 9       │                                                              │ 159473       │ 2612788    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3262    │ Imagine                                                      │ 255     │ 2           │ 9       │                                                              │ 192329       │ 3136271    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3263    │ Nobody Told Me                                               │ 255     │ 2           │ 9       │                                                              │ 210348       │ 3423395    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3264    │ Jealous Guy                                                  │ 255     │ 2           │ 9       │                                                              │ 239094       │ 3881620    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3265    │ Working Class Hero                                           │ 255     │ 2           │ 9       │                                                              │ 265449       │ 4301430    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3266    │ Power to the People                                          │ 255     │ 2           │ 9       │                                                              │ 213018       │ 3466029    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3267    │ Imagine                                                      │ 255     │ 2           │ 9       │                                                              │ 219078       │ 3562542    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3268    │ Beautiful Boy                                                │ 255     │ 2           │ 9       │                                                              │ 227995       │ 3704642    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3269    │ Isolation                                                    │ 255     │ 2           │ 9       │                                                              │ 156059       │ 2558399    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3270    │ Watching the Wheels                                          │ 255     │ 2           │ 9       │                                                              │ 198645       │ 3237063    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3271    │ Grow Old With Me                                             │ 255     │ 2           │ 9       │                                                              │ 149093       │ 2447453    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3272    │ Gimme Some Truth                                             │ 255     │ 2           │ 9       │                                                              │ 187546       │ 3060083    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3273    │ [Just Like] Starting Over                                    │ 255     │ 2           │ 9       │                                                              │ 215549       │ 3506308    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3274    │ God                                                          │ 255     │ 2           │ 9       │                                                              │ 260410       │ 4221135    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3275    │ Real Love                                                    │ 255     │ 2           │ 9       │                                                              │ 236911       │ 3846658    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3276    │ Sympton of the Universe                                      │ 256     │ 2           │ 1       │                                                              │ 340890       │ 5489313    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3277    │ Snowblind                                                    │ 256     │ 2           │ 1       │                                                              │ 295960       │ 4773171    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3278    │ Black Sabbath                                                │ 256     │ 2           │ 1       │                                                              │ 364180       │ 5860455    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3279    │ Fairies Wear Boots                                           │ 256     │ 2           │ 1       │                                                              │ 392764       │ 6315916    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3280    │ War Pigs                                                     │ 256     │ 2           │ 1       │                                                              │ 515435       │ 8270194    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3281    │ The Wizard                                                   │ 256     │ 2           │ 1       │                                                              │ 282678       │ 4561796    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3282    │ N.I.B.                                                       │ 256     │ 2           │ 1       │                                                              │ 335248       │ 5399456    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3283    │ Sweet Leaf                                                   │ 256     │ 2           │ 1       │                                                              │ 354706       │ 5709700    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3284    │ Never Say Die                                                │ 256     │ 2           │ 1       │                                                              │ 258343       │ 4173799    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3285    │ Sabbath, Bloody Sabbath                                      │ 256     │ 2           │ 1       │                                                              │ 333622       │ 5373633    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3286    │ Iron Man/Children of the Grave                               │ 256     │ 2           │ 1       │                                                              │ 552308       │ 8858616    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3287    │ Paranoid                                                     │ 256     │ 2           │ 1       │                                                              │ 189171       │ 3071042    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3288    │ Rock You Like a Hurricane                                    │ 257     │ 2           │ 1       │                                                              │ 255766       │ 4300973    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3289    │ No One Like You                                              │ 257     │ 2           │ 1       │                                                              │ 240325       │ 4050259    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3290    │ The Zoo                                                      │ 257     │ 2           │ 1       │                                                              │ 332740       │ 5550779    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3291    │ Loving You Sunday Morning                                    │ 257     │ 2           │ 1       │                                                              │ 339125       │ 5654493    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3292    │ Still Loving You                                             │ 257     │ 2           │ 1       │                                                              │ 390674       │ 6491444    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3293    │ Big City Nights                                              │ 257     │ 2           │ 1       │                                                              │ 251865       │ 4237651    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3294    │ Believe in Love                                              │ 257     │ 2           │ 1       │                                                              │ 325774       │ 5437651    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3295    │ Rhythm of Love                                               │ 257     │ 2           │ 1       │                                                              │ 231246       │ 3902834    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3296    │ I Can't Explain                                              │ 257     │ 2           │ 1       │                                                              │ 205332       │ 3482099    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3297    │ Tease Me Please Me                                           │ 257     │ 2           │ 1       │                                                              │ 287229       │ 4811894    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3298    │ Wind of Change                                               │ 257     │ 2           │ 1       │                                                              │ 315325       │ 5268002    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3299    │ Send Me an Angel                                             │ 257     │ 2           │ 1       │                                                              │ 273041       │ 4581492    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3300    │ Jump Around                                                  │ 258     │ 1           │ 17      │ E. Schrody/L. Muggerud                                       │ 217835       │ 8715653    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3301    │ Salutations                                                  │ 258     │ 1           │ 17      │ E. Schrody/L. Dimant                                         │ 69120        │ 2767047    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3302    │ Put Your Head Out                                            │ 258     │ 1           │ 17      │ E. Schrody/L. Freese/L. Muggerud                             │ 182230       │ 7291473    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3303    │ Top O' The Morning To Ya                                     │ 258     │ 1           │ 17      │ E. Schrody/L. Dimant                                         │ 216633       │ 8667599    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3304    │ Commercial 1                                                 │ 258     │ 1           │ 17      │ L. Muggerud                                                  │ 7941         │ 319888     │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3305    │ House And The Rising Sun                                     │ 258     │ 1           │ 17      │ E. Schrody/J. Vasquez/L. Dimant                              │ 219402       │ 8778369    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3306    │ Shamrocks And Shenanigans                                    │ 258     │ 1           │ 17      │ E. Schrody/L. Dimant                                         │ 218331       │ 8735518    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3307    │ House Of Pain Anthem                                         │ 258     │ 1           │ 17      │ E. Schrody/L. Dimant                                         │ 155611       │ 6226713    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3308    │ Danny Boy, Danny Boy                                         │ 258     │ 1           │ 17      │ E. Schrody/L. Muggerud                                       │ 114520       │ 4583091    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3309    │ Guess Who's Back                                             │ 258     │ 1           │ 17      │ E. Schrody/L. Muggerud                                       │ 238393       │ 9537994    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3310    │ Commercial 2                                                 │ 258     │ 1           │ 17      │ L. Muggerud                                                  │ 21211        │ 850698     │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3311    │ Put On Your Shit Kickers                                     │ 258     │ 1           │ 17      │ E. Schrody/L. Muggerud                                       │ 190432       │ 7619569    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3312    │ Come And Get Some Of This                                    │ 258     │ 1           │ 17      │ E. Schrody/L. Muggerud/R. Medrano                            │ 170475       │ 6821279    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3313    │ Life Goes On                                                 │ 258     │ 1           │ 17      │ E. Schrody/R. Medrano                                        │ 163030       │ 6523458    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3314    │ One For The Road                                             │ 258     │ 1           │ 17      │ E. Schrody/L. Dimant/L. Muggerud                             │ 170213       │ 6810820    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3315    │ Feel It                                                      │ 258     │ 1           │ 17      │ E. Schrody/R. Medrano                                        │ 239908       │ 9598588    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3316    │ All My Love                                                  │ 258     │ 1           │ 17      │ E. Schrody/L. Dimant                                         │ 200620       │ 8027065    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3317    │ Jump Around (Pete Rock Remix)                                │ 258     │ 1           │ 17      │ E. Schrody/L. Muggerud                                       │ 236120       │ 9447101    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3318    │ Shamrocks And Shenanigans (Boom Shalock Lock Boom/Butch Vig  │ 258     │ 1           │ 17      │ E. Schrody/L. Dimant                                         │ 237035       │ 9483705    │ 0.99      │
│         │ Mix)                                                         │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3319    │ Instinto Colectivo                                           │ 259     │ 1           │ 15      │                                                              │ 300564       │ 12024875   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3320    │ Chapa o Coco                                                 │ 259     │ 1           │ 15      │                                                              │ 143830       │ 5755478    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3321    │ Prostituta                                                   │ 259     │ 1           │ 15      │                                                              │ 359000       │ 14362307   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3322    │ Eu So Queria Sumir                                           │ 259     │ 1           │ 15      │                                                              │ 269740       │ 10791921   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3323    │ Tres Reis                                                    │ 259     │ 1           │ 15      │                                                              │ 304143       │ 12168015   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3324    │ Um Lugar ao Sol                                              │ 259     │ 1           │ 15      │                                                              │ 212323       │ 8495217    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3325    │ Batalha Naval                                                │ 259     │ 1           │ 15      │                                                              │ 285727       │ 11431382   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3326    │ Todo o Carnaval tem seu Fim                                  │ 259     │ 1           │ 15      │                                                              │ 237426       │ 9499371    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3327    │ O Misterio do Samba                                          │ 259     │ 1           │ 15      │                                                              │ 226142       │ 9047970    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3328    │ Armadura                                                     │ 259     │ 1           │ 15      │                                                              │ 232881       │ 9317533    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3329    │ Na Ladeira                                                   │ 259     │ 1           │ 15      │                                                              │ 221570       │ 8865099    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3330    │ Carimbo                                                      │ 259     │ 1           │ 15      │                                                              │ 328751       │ 13152314   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3331    │ Catimbo                                                      │ 259     │ 1           │ 15      │                                                              │ 254484       │ 10181692   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3332    │ Funk de Bamba                                                │ 259     │ 1           │ 15      │                                                              │ 237322       │ 9495184    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3333    │ Chega no Suingue                                             │ 259     │ 1           │ 15      │                                                              │ 221805       │ 8874509    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3334    │ Mun-Ra                                                       │ 259     │ 1           │ 15      │                                                              │ 274651       │ 10988338   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3335    │ Freestyle Love                                               │ 259     │ 1           │ 15      │                                                              │ 318484       │ 12741680   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3336    │ War Pigs                                                     │ 260     │ 4           │ 23      │                                                              │ 234013       │ 8052374    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3337    │ Past, Present, and Future                                    │ 261     │ 3           │ 21      │                                                              │ 2492867      │ 490796184  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3338    │ The Beginning of the End                                     │ 261     │ 3           │ 21      │                                                              │ 2611903      │ 526865050  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3339    │ LOST Season 4 Trailer                                        │ 261     │ 3           │ 21      │                                                              │ 112712       │ 20831818   │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3340    │ LOST In 8:15                                                 │ 261     │ 3           │ 21      │                                                              │ 497163       │ 98460675   │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3341    │ Confirmed Dead                                               │ 261     │ 3           │ 21      │                                                              │ 2611986      │ 512168460  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3342    │ The Economist                                                │ 261     │ 3           │ 21      │                                                              │ 2609025      │ 516934914  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3343    │ Eggtown                                                      │ 261     │ 3           │ 19      │                                                              │ 2608817      │ 501061240  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3344    │ The Constant                                                 │ 261     │ 3           │ 21      │                                                              │ 2611569      │ 520209363  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3345    │ The Other Woman                                              │ 261     │ 3           │ 21      │                                                              │ 2605021      │ 513246663  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3346    │ Ji Yeon                                                      │ 261     │ 3           │ 19      │                                                              │ 2588797      │ 506458858  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3347    │ Meet Kevin Johnson                                           │ 261     │ 3           │ 19      │                                                              │ 2612028      │ 504132981  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3348    │ The Shape of Things to Come                                  │ 261     │ 3           │ 21      │                                                              │ 2591299      │ 502284266  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3349    │ Amanda                                                       │ 262     │ 5           │ 2       │ Luca Gusella                                                 │ 246503       │ 4011615    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3350    │ Despertar                                                    │ 262     │ 5           │ 2       │ Andrea Dulbecco                                              │ 307385       │ 4821485    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3351    │ Din Din Wo (Little Child)                                    │ 263     │ 5           │ 16      │ Habib Koité                                                  │ 285837       │ 4615841    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3352    │ Distance                                                     │ 264     │ 5           │ 15      │ Karsh Kale/Vishal Vaid                                       │ 327122       │ 5327463    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3353    │ I Guess You're Right                                         │ 265     │ 5           │ 1       │ Darius "Take One" Minwalla/Jon Auer/Ken Stringfellow/Matt Ha │ 212044       │ 3453849    │ 0.99      │
│         │                                                              │         │             │         │ rris                                                         │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3354    │ I Ka Barra (Your Work)                                       │ 263     │ 5           │ 16      │ Habib Koité                                                  │ 300605       │ 4855457    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3355    │ Love Comes                                                   │ 265     │ 5           │ 1       │ Darius "Take One" Minwalla/Jon Auer/Ken Stringfellow/Matt Ha │ 199923       │ 3240609    │ 0.99      │
│         │                                                              │         │             │         │ rris                                                         │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3356    │ Muita Bobeira                                                │ 266     │ 5           │ 7       │ Luciana Souza                                                │ 172710       │ 2775071    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3357    │ OAM's Blues                                                  │ 267     │ 5           │ 2       │ Aaron Goldberg                                               │ 266936       │ 4292028    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3358    │ One Step Beyond                                              │ 264     │ 5           │ 15      │ Karsh Kale                                                   │ 366085       │ 6034098    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3359    │ Symphony No. 3 in E-flat major, Op. 55, "Eroica" - Scherzo:  │ 268     │ 5           │ 24      │ Ludwig van Beethoven                                         │ 356426       │ 5817216    │ 0.99      │
│         │ Allegro Vivace                                               │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3360    │ Something Nice Back Home                                     │ 261     │ 3           │ 21      │                                                              │ 2612779      │ 484711353  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3361    │ Cabin Fever                                                  │ 261     │ 3           │ 21      │                                                              │ 2612028      │ 477733942  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3362    │ There's No Place Like Home, Pt. 1                            │ 261     │ 3           │ 21      │                                                              │ 2609526      │ 522919189  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3363    │ There's No Place Like Home, Pt. 2                            │ 261     │ 3           │ 21      │                                                              │ 2497956      │ 523748920  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3364    │ There's No Place Like Home, Pt. 3                            │ 261     │ 3           │ 21      │                                                              │ 2582957      │ 486161766  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3365    │ Say Hello 2 Heaven                                           │ 269     │ 2           │ 23      │                                                              │ 384497       │ 6477217    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3366    │ Reach Down                                                   │ 269     │ 2           │ 23      │                                                              │ 672773       │ 11157785   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3367    │ Hunger Strike                                                │ 269     │ 2           │ 23      │                                                              │ 246292       │ 4233212    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3368    │ Pushin Forward Back                                          │ 269     │ 2           │ 23      │                                                              │ 225278       │ 3892066    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3369    │ Call Me a Dog                                                │ 269     │ 2           │ 23      │                                                              │ 304458       │ 5177612    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3370    │ Times of Trouble                                             │ 269     │ 2           │ 23      │                                                              │ 342539       │ 5795951    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3371    │ Wooden Jesus                                                 │ 269     │ 2           │ 23      │                                                              │ 250565       │ 4302603    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3372    │ Your Savior                                                  │ 269     │ 2           │ 23      │                                                              │ 244226       │ 4199626    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3373    │ Four Walled World                                            │ 269     │ 2           │ 23      │                                                              │ 414474       │ 6964048    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3374    │ All Night Thing                                              │ 269     │ 2           │ 23      │                                                              │ 231803       │ 3997982    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3375    │ No Such Thing                                                │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 224837       │ 3691272    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3376    │ Poison Eye                                                   │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 237120       │ 3890037    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3377    │ Arms Around Your Love                                        │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 214016       │ 3516224    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3378    │ Safe and Sound                                               │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 256764       │ 4207769    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3379    │ She'll Never Be Your Man                                     │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 204078       │ 3355715    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3380    │ Ghosts                                                       │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 231547       │ 3799745    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3381    │ Killing Birds                                                │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 218498       │ 3588776    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3382    │ Billie Jean                                                  │ 270     │ 2           │ 23      │ Michael Jackson                                              │ 281401       │ 4606408    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3383    │ Scar On the Sky                                              │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 220193       │ 3616618    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3384    │ Your Soul Today                                              │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 205959       │ 3385722    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3385    │ Finally Forever                                              │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 217035       │ 3565098    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3386    │ Silence the Voices                                           │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 267376       │ 4379597    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3387    │ Disappearing Act                                             │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 273320       │ 4476203    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3388    │ You Know My Name                                             │ 270     │ 2           │ 23      │ Chris Cornell                                                │ 240255       │ 3940651    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3389    │ Revelations                                                  │ 271     │ 2           │ 23      │                                                              │ 252376       │ 4111051    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3390    │ One and the Same                                             │ 271     │ 2           │ 23      │                                                              │ 217732       │ 3559040    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3391    │ Sound of a Gun                                               │ 271     │ 2           │ 23      │                                                              │ 260154       │ 4234990    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3392    │ Until We Fall                                                │ 271     │ 2           │ 23      │                                                              │ 230758       │ 3766605    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3393    │ Original Fire                                                │ 271     │ 2           │ 23      │                                                              │ 218916       │ 3577821    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3394    │ Broken City                                                  │ 271     │ 2           │ 23      │                                                              │ 228366       │ 3728955    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3395    │ Somedays                                                     │ 271     │ 2           │ 23      │                                                              │ 213831       │ 3497176    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3396    │ Shape of Things to Come                                      │ 271     │ 2           │ 23      │                                                              │ 274597       │ 4465399    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3397    │ Jewel of the Summertime                                      │ 271     │ 2           │ 23      │                                                              │ 233242       │ 3806103    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3398    │ Wide Awake                                                   │ 271     │ 2           │ 23      │                                                              │ 266308       │ 4333050    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3399    │ Nothing Left to Say But Goodbye                              │ 271     │ 2           │ 23      │                                                              │ 213041       │ 3484335    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3400    │ Moth                                                         │ 271     │ 2           │ 23      │                                                              │ 298049       │ 4838884    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3401    │ Show Me How to Live (Live at the Quart Festival)             │ 271     │ 2           │ 23      │                                                              │ 301974       │ 4901540    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3402    │ Band Members Discuss Tracks from "Revelations"               │ 271     │ 3           │ 23      │                                                              │ 294294       │ 61118891   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3403    │ Intoitus: Adorate Deum                                       │ 272     │ 2           │ 24      │ Anonymous                                                    │ 245317       │ 4123531    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3404    │ Miserere mei, Deus                                           │ 273     │ 2           │ 24      │ Gregorio Allegri                                             │ 501503       │ 8285941    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3405    │ Canon and Gigue in D Major: I. Canon                         │ 274     │ 2           │ 24      │ Johann Pachelbel                                             │ 271788       │ 4438393    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3406    │ Concerto No. 1 in E Major, RV 269 "Spring": I. Allegro       │ 275     │ 2           │ 24      │ Antonio Vivaldi                                              │ 199086       │ 3347810    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3407    │ Concerto for 2 Violins in D Minor, BWV 1043: I. Vivace       │ 276     │ 2           │ 24      │ Johann Sebastian Bach                                        │ 193722       │ 3192890    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3408    │ Aria Mit 30 Veränderungen, BWV 988 "Goldberg Variations": Ar │ 277     │ 2           │ 24      │ Johann Sebastian Bach                                        │ 120463       │ 2081895    │ 0.99      │
│         │ ia                                                           │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3409    │ Suite for Solo Cello No. 1 in G Major, BWV 1007: I. Prélude  │ 278     │ 2           │ 24      │ Johann Sebastian Bach                                        │ 143288       │ 2315495    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3410    │ The Messiah: Behold, I Tell You a Mystery... The Trumpet Sha │ 279     │ 2           │ 24      │ George Frideric Handel                                       │ 582029       │ 9553140    │ 0.99      │
│         │ ll Sound                                                     │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3411    │ Solomon HWV 67: The Arrival of the Queen of Sheba            │ 280     │ 2           │ 24      │ George Frideric Handel                                       │ 197135       │ 3247914    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3412    │ "Eine Kleine Nachtmusik" Serenade In G, K. 525: I. Allegro   │ 281     │ 2           │ 24      │ Wolfgang Amadeus Mozart                                      │ 348971       │ 5760129    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3413    │ Concerto for Clarinet in A Major, K. 622: II. Adagio         │ 282     │ 2           │ 24      │ Wolfgang Amadeus Mozart                                      │ 394482       │ 6474980    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3414    │ Symphony No. 104 in D Major "London": IV. Finale: Spiritoso  │ 283     │ 4           │ 24      │ Franz Joseph Haydn                                           │ 306687       │ 10085867   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3415    │ Symphony No.5 in C Minor: I. Allegro con brio                │ 284     │ 2           │ 24      │ Ludwig van Beethoven                                         │ 392462       │ 6419730    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3416    │ Ave Maria                                                    │ 285     │ 2           │ 24      │ Franz Schubert                                               │ 338243       │ 5605648    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3417    │ Nabucco: Chorus, "Va, Pensiero, Sull'ali Dorate"             │ 286     │ 2           │ 24      │ Giuseppe Verdi                                               │ 274504       │ 4498583    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3418    │ Die Walküre: The Ride of the Valkyries                       │ 287     │ 2           │ 24      │ Richard Wagner                                               │ 189008       │ 3114209    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3419    │ Requiem, Op.48: 4. Pie Jesu                                  │ 288     │ 2           │ 24      │ Gabriel Fauré                                                │ 258924       │ 4314850    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3420    │ The Nutcracker, Op. 71a, Act II: Scene 14: Pas de deux: Danc │ 289     │ 2           │ 24      │ Peter Ilyich Tchaikovsky                                     │ 304226       │ 5184289    │ 0.99      │
│         │ e of the Prince & the Sugar-Plum Fairy                       │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3421    │ Nimrod (Adagio) from Variations On an Original Theme, Op. 36 │ 290     │ 2           │ 24      │ Edward Elgar                                                 │ 250031       │ 4124707    │ 0.99      │
│         │  "Enigma"                                                    │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3422    │ Madama Butterfly: Un Bel Dì Vedremo                          │ 291     │ 2           │ 24      │ Giacomo Puccini                                              │ 277639       │ 4588197    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3423    │ Jupiter, the Bringer of Jollity                              │ 292     │ 2           │ 24      │ Gustav Holst                                                 │ 522099       │ 8547876    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3424    │ Turandot, Act III, Nessun dorma!                             │ 293     │ 2           │ 24      │ Giacomo Puccini                                              │ 176911       │ 2920890    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3425    │ Adagio for Strings from the String Quartet, Op. 11           │ 294     │ 2           │ 24      │ Samuel Barber                                                │ 596519       │ 9585597    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3426    │ Carmina Burana: O Fortuna                                    │ 295     │ 2           │ 24      │ Carl Orff                                                    │ 156710       │ 2630293    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3427    │ Fanfare for the Common Man                                   │ 296     │ 2           │ 24      │ Aaron Copland                                                │ 198064       │ 3211245    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3428    │ Branch Closing                                               │ 251     │ 3           │ 22      │                                                              │ 1814855      │ 360331351  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3429    │ The Return                                                   │ 251     │ 3           │ 22      │                                                              │ 1705080      │ 343877320  │ 1.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3430    │ Toccata and Fugue in D Minor, BWV 565: I. Toccata            │ 297     │ 2           │ 24      │ Johann Sebastian Bach                                        │ 153901       │ 2649938    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3431    │ Symphony No.1 in D Major, Op.25 "Classical", Allegro Con Bri │ 298     │ 2           │ 24      │ Sergei Prokofiev                                             │ 254001       │ 4195542    │ 0.99      │
│         │ o                                                            │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3432    │ Scheherazade, Op. 35: I. The Sea and Sindbad's Ship          │ 299     │ 2           │ 24      │ Nikolai Rimsky-Korsakov                                      │ 545203       │ 8916313    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3433    │ Concerto No.2 in F Major, BWV1047, I. Allegro                │ 300     │ 2           │ 24      │ Johann Sebastian Bach                                        │ 307244       │ 5064553    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3434    │ Concerto for Piano No. 2 in F Minor, Op. 21: II. Larghetto   │ 301     │ 2           │ 24      │ Frédéric Chopin                                              │ 560342       │ 9160082    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3435    │ Cavalleria Rusticana \ Act \ Intermezzo Sinfonico            │ 302     │ 2           │ 24      │ Pietro Mascagni                                              │ 243436       │ 4001276    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3436    │ Karelia Suite, Op.11: 2. Ballade (Tempo Di Menuetto)         │ 303     │ 2           │ 24      │ Jean Sibelius                                                │ 406000       │ 5908455    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3437    │ Piano Sonata No. 14 in C Sharp Minor, Op. 27, No. 2, "Moonli │ 304     │ 2           │ 24      │ Ludwig van Beethoven                                         │ 391000       │ 6318740    │ 0.99      │
│         │ ght": I. Adagio sostenuto                                    │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3438    │ Fantasia On Greensleeves                                     │ 280     │ 2           │ 24      │ Ralph Vaughan Williams                                       │ 268066       │ 4513190    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3439    │ Das Lied Von Der Erde, Von Der Jugend                        │ 305     │ 2           │ 24      │ Gustav Mahler                                                │ 223583       │ 3700206    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3440    │ Concerto for Cello and Orchestra in E minor, Op. 85: I. Adag │ 306     │ 2           │ 24      │ Edward Elgar                                                 │ 483133       │ 7865479    │ 0.99      │
│         │ io - Moderato                                                │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3441    │ Two Fanfares for Orchestra: II. Short Ride in a Fast Machine │ 307     │ 2           │ 24      │ John Adams                                                   │ 254930       │ 4310896    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3442    │ Wellington's Victory or the Battle Symphony, Op.91: 2. Symph │ 308     │ 2           │ 24      │ Ludwig van Beethoven                                         │ 412000       │ 6965201    │ 0.99      │
│         │ ony of Triumph                                               │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3443    │ Missa Papae Marcelli: Kyrie                                  │ 309     │ 2           │ 24      │ Giovanni Pierluigi da Palestrina                             │ 240666       │ 4244149    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3444    │ Romeo et Juliette: No. 11 - Danse des Chevaliers             │ 310     │ 2           │ 24      │                                                              │ 275015       │ 4519239    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3445    │ On the Beautiful Blue Danube                                 │ 311     │ 2           │ 24      │ Johann Strauss II                                            │ 526696       │ 8610225    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3446    │ Symphonie Fantastique, Op. 14: V. Songe d'une nuit du sabbat │ 312     │ 2           │ 24      │ Hector Berlioz                                               │ 561967       │ 9173344    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3447    │ Carmen: Overture                                             │ 313     │ 2           │ 24      │ Georges Bizet                                                │ 132932       │ 2189002    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3448    │ Lamentations of Jeremiah, First Set \ Incipit Lamentatio     │ 314     │ 2           │ 24      │ Thomas Tallis                                                │ 69194        │ 1208080    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3449    │ Music for the Royal Fireworks, HWV351 (1749): La Réjouissanc │ 315     │ 2           │ 24      │ George Frideric Handel                                       │ 120000       │ 2193734    │ 0.99      │
│         │ e                                                            │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3450    │ Peer Gynt Suite No.1, Op.46: 1. Morning Mood                 │ 316     │ 2           │ 24      │ Edvard Grieg                                                 │ 253422       │ 4298769    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3451    │ Die Zauberflöte, K.620: "Der Hölle Rache Kocht in Meinem Her │ 317     │ 2           │ 25      │ Wolfgang Amadeus Mozart                                      │ 174813       │ 2861468    │ 0.99      │
│         │ ze"                                                          │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3452    │ SCRIABIN: Prelude in B Major, Op. 11, No. 11                 │ 318     │ 4           │ 24      │                                                              │ 101293       │ 3819535    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3453    │ Pavan, Lachrimae Antiquae                                    │ 319     │ 2           │ 24      │ John Dowland                                                 │ 253281       │ 4211495    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3454    │ Symphony No. 41 in C Major, K. 551, "Jupiter": IV. Molto all │ 320     │ 2           │ 24      │ Wolfgang Amadeus Mozart                                      │ 362933       │ 6173269    │ 0.99      │
│         │ egro                                                         │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3455    │ Rehab                                                        │ 321     │ 2           │ 14      │                                                              │ 213240       │ 3416878    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3456    │ You Know I'm No Good                                         │ 321     │ 2           │ 14      │                                                              │ 256946       │ 4133694    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3457    │ Me & Mr. Jones                                               │ 321     │ 2           │ 14      │                                                              │ 151706       │ 2449438    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3458    │ Just Friends                                                 │ 321     │ 2           │ 14      │                                                              │ 191933       │ 3098906    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3459    │ Back to Black                                                │ 321     │ 2           │ 14      │ Mark Ronson                                                  │ 240320       │ 3852953    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3460    │ Love Is a Losing Game                                        │ 321     │ 2           │ 14      │                                                              │ 154386       │ 2509409    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3461    │ Tears Dry On Their Own                                       │ 321     │ 2           │ 14      │ Nickolas Ashford & Valerie Simpson                           │ 185293       │ 2996598    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3462    │ Wake Up Alone                                                │ 321     │ 2           │ 14      │ Paul O'duffy                                                 │ 221413       │ 3576773    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3463    │ Some Unholy War                                              │ 321     │ 2           │ 14      │                                                              │ 141520       │ 2304465    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3464    │ He Can Only Hold Her                                         │ 321     │ 2           │ 14      │ Richard Poindexter & Robert Poindexter                       │ 166680       │ 2666531    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3465    │ You Know I'm No Good (feat. Ghostface Killah)                │ 321     │ 2           │ 14      │                                                              │ 202320       │ 3260658    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3466    │ Rehab (Hot Chip Remix)                                       │ 321     │ 2           │ 14      │                                                              │ 418293       │ 6670600    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3467    │ Intro / Stronger Than Me                                     │ 322     │ 2           │ 9       │                                                              │ 234200       │ 3832165    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3468    │ You Sent Me Flying / Cherry                                  │ 322     │ 2           │ 9       │                                                              │ 409906       │ 6657517    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3469    │ F**k Me Pumps                                                │ 322     │ 2           │ 9       │ Salaam Remi                                                  │ 200253       │ 3324343    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3470    │ I Heard Love Is Blind                                        │ 322     │ 2           │ 9       │                                                              │ 129666       │ 2190831    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3471    │ (There Is) No Greater Love (Teo Licks)                       │ 322     │ 2           │ 9       │ Isham Jones & Marty Symes                                    │ 167933       │ 2773507    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3472    │ In My Bed                                                    │ 322     │ 2           │ 9       │ Salaam Remi                                                  │ 315960       │ 5211774    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3473    │ Take the Box                                                 │ 322     │ 2           │ 9       │ Luke Smith                                                   │ 199160       │ 3281526    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3474    │ October Song                                                 │ 322     │ 2           │ 9       │ Matt Rowe & Stefan Skarbek                                   │ 204846       │ 3358125    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3475    │ What Is It About Men                                         │ 322     │ 2           │ 9       │ Delroy "Chris" Cooper, Donovan Jackson, Earl Chinna Smith, F │ 209573       │ 3426106    │ 0.99      │
│         │                                                              │         │             │         │ elix Howard, Gordon Williams, Luke Smith, Paul Watson & Wilb │              │            │           │
│         │                                                              │         │             │         │ urn Squiddley Cole                                           │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3476    │ Help Yourself                                                │ 322     │ 2           │ 9       │ Freddy James, Jimmy hogarth & Larry Stock                    │ 300884       │ 5029266    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3477    │ Amy Amy Amy (Outro)                                          │ 322     │ 2           │ 9       │ Astor Campbell, Delroy "Chris" Cooper, Donovan Jackson, Doro │ 663426       │ 10564704   │ 0.99      │
│         │                                                              │         │             │         │ thy Fields, Earl Chinna Smith, Felix Howard, Gordon Williams │              │            │           │
│         │                                                              │         │             │         │ , James Moody, Jimmy McHugh, Matt Rowe, Salaam Remi & Stefan │              │            │           │
│         │                                                              │         │             │         │  Skarbek                                                     │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3478    │ Slowness                                                     │ 323     │ 2           │ 23      │                                                              │ 215386       │ 3644793    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3479    │ Prometheus Overture, Op. 43                                  │ 324     │ 4           │ 24      │ Ludwig van Beethoven                                         │ 339567       │ 10887931   │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3480    │ Sonata for Solo Violin: IV: Presto                           │ 325     │ 4           │ 24      │ Béla Bartók                                                  │ 299350       │ 9785346    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3481    │ A Midsummer Night's Dream, Op.61 Incidental Music: No.7 Nott │ 326     │ 2           │ 24      │                                                              │ 387826       │ 6497867    │ 0.99      │
│         │ urno                                                         │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3482    │ Suite No. 3 in D, BWV 1068: III. Gavotte I & II              │ 327     │ 2           │ 24      │ Johann Sebastian Bach                                        │ 225933       │ 3847164    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3483    │ Concert pour 4 Parties de V**les, H. 545: I. Prelude         │ 328     │ 2           │ 24      │ Marc-Antoine Charpentier                                     │ 110266       │ 1973559    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3484    │ Adios nonino                                                 │ 329     │ 2           │ 24      │ Astor Piazzolla                                              │ 289388       │ 4781384    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3485    │ Symphony No. 3 Op. 36 for Orchestra and Soprano "Symfonia Pi │ 330     │ 2           │ 24      │ Henryk Górecki                                               │ 567494       │ 9273123    │ 0.99      │
│         │ esni Zalosnych" \ Lento E Largo - Tranquillissimo            │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3486    │ Act IV, Symphony                                             │ 331     │ 2           │ 24      │ Henry Purcell                                                │ 364296       │ 5987695    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3487    │ 3 Gymnopédies: No.1 - Lent Et Grave, No.3 - Lent Et Douloure │ 332     │ 2           │ 24      │ Erik Satie                                                   │ 385506       │ 6458501    │ 0.99      │
│         │ ux                                                           │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3488    │ Music for the Funeral of Queen Mary: VI. "Thou Knowest, Lord │ 333     │ 2           │ 24      │ Henry Purcell                                                │ 142081       │ 2365930    │ 0.99      │
│         │ , the Secrets of Our Hearts"                                 │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3489    │ Symphony No. 2: III. Allegro vivace                          │ 334     │ 2           │ 24      │ Kurt Weill                                                   │ 376510       │ 6129146    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3490    │ Partita in E Major, BWV 1006A: I. Prelude                    │ 335     │ 2           │ 24      │ Johann Sebastian Bach                                        │ 285673       │ 4744929    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3491    │ Le Sacre Du Printemps: I.iv. Spring Rounds                   │ 336     │ 2           │ 24      │ Igor Stravinsky                                              │ 234746       │ 4072205    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3492    │ Sing Joyfully                                                │ 314     │ 2           │ 24      │ William Byrd                                                 │ 133768       │ 2256484    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3493    │ Metopes, Op. 29: Calypso                                     │ 337     │ 2           │ 24      │ Karol Szymanowski                                            │ 333669       │ 5548755    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3494    │ Symphony No. 2, Op. 16 -  "The Four Temperaments": II. Alleg │ 338     │ 2           │ 24      │ Carl Nielsen                                                 │ 286998       │ 4834785    │ 0.99      │
│         │ ro Comodo e Flemmatico                                       │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3495    │ 24 Caprices, Op. 1, No. 24, for Solo Violin, in A Minor      │ 339     │ 2           │ 24      │ Niccolò Paganini                                             │ 265541       │ 4371533    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3496    │ Étude 1, In C Major - Preludio (Presto) - Liszt              │ 340     │ 4           │ 24      │                                                              │ 51780        │ 2229617    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3497    │ Erlkonig, D.328                                              │ 341     │ 2           │ 24      │                                                              │ 261849       │ 4307907    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3498    │ Concerto for Violin, Strings and Continuo in G Major, Op. 3, │ 342     │ 4           │ 24      │ Pietro Antonio Locatelli                                     │ 493573       │ 16454937   │ 0.99      │
│         │  No. 9: I. Allegro                                           │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3499    │ Pini Di Roma (Pinien Von Rom) \ I Pini Della Via Appia       │ 343     │ 2           │ 24      │                                                              │ 286741       │ 4718950    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3500    │ String Quartet No. 12 in C Minor, D. 703 "Quartettsatz": II. │ 344     │ 2           │ 24      │ Franz Schubert                                               │ 139200       │ 2283131    │ 0.99      │
│         │  Andante - Allegro assai                                     │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3501    │ L'orfeo, Act 3, Sinfonia (Orchestra)                         │ 345     │ 2           │ 24      │ Claudio Monteverdi                                           │ 66639        │ 1189062    │ 0.99      │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3502    │ Quintet for Horn, Violin, 2 Violas, and Cello in E Flat Majo │ 346     │ 2           │ 24      │ Wolfgang Amadeus Mozart                                      │ 221331       │ 3665114    │ 0.99      │
│         │ r, K. 407/386c: III. Allegro                                 │         │             │         │                                                              │              │            │           │
├─────────┼──────────────────────────────────────────────────────────────┼─────────┼─────────────┼─────────┼──────────────────────────────────────────────────────────────┼──────────────┼────────────┼───────────┤
│ 3503    │ Koyaanisqatsi                                                │ 347     │ 2           │ 10      │ Philip Glass                                                 │ 206005       │ 3305164    │ 0.99      │
└─────────┴──────────────────────────────────────────────────────────────┴─────────┴─────────────┴─────────┴──────────────────────────────────────────────────────────────┴──────────────┴────────────┴───────────┘
**/

--Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

--¿Qué agente de ventas realizó más ventas en 2009?

--Escribir una consulta que muestre todas las playlists de la base de datos.

 select * from playlists;
 /**
┌────────────┬────────────────────────────┐
│ PlaylistId │            Name            │
├────────────┼────────────────────────────┤
│ 1          │ Music                      │
│ 2          │ Movies                     │
│ 3          │ TV Shows                   │
│ 4          │ Audiobooks                 │
│ 5          │ 90’s Music                 │
│ 6          │ Audiobooks                 │
│ 7          │ Movies                     │
│ 8          │ Music                      │
│ 9          │ Music Videos               │
│ 10         │ TV Shows                   │
│ 11         │ Brazilian Music            │
│ 12         │ Classical                  │
│ 13         │ Classical 101 - Deep Cuts  │
│ 14         │ Classical 101 - Next Steps │
│ 15         │ Classical 101 - The Basics │
│ 16         │ Grunge                     │
│ 17         │ Heavy Metal Classic        │
│ 18         │ On-The-Go 1                │
└────────────┴────────────────────────────┘
**/
--Escribe una consulta que liste todas las canciones de una playlist.

--Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.
SELECT t.name from tracks as t, playlists as pl 
   ...> JOIN playlist_track as pt on pt.trackid=t.trackid and pt.playlistid=pl.playlistid 
   ...> WHERE pl.name = 'Classical ';