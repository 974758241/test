CLASS zrap110_travel_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrap110_travel_data_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " delete existing entries in the database table
    DELETE FROM zrap110_atravsol.
    DELETE FROM zrap110_abooksol.
    DATA lv_empty_attachment TYPE xstring.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA lv_timestamp        TYPE timestampl.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA lv_user             TYPE char12.

    lv_user = sy-uname.
    GET TIME STAMP FIELD lv_timestamp.
    " insert travel demo data
    INSERT zrap110_atravsol FROM (
        SELECT FROM /dmo/travel
          FIELDS travel_id            AS travel_id,
                 agency_id            AS agency_id,
                 customer_id          AS customer_id,
                 begin_date           AS begin_date,
                 end_date             AS end_date,
                 booking_fee          AS booking_fee,
                 total_price          AS total_price,
                 currency_code        AS currency_code,
                 description          AS description,
                 CASE status
                   WHEN 'B' THEN 'A' " accepted
                   WHEN 'X' THEN 'X' " cancelled
                   ELSE 'O'          " open
                 END                  AS overall_status,
                 @lv_empty_attachment AS attachment, " 使用NULL值
                 ' '                  AS mime_type, " 添加空字符串
                 ' '                  AS file_name, " 添加空字符串
                 lastchangedat        AS last_changed_at,
                 createdby            AS created_by,
                 createdat            AS created_at,
                 lastchangedby        AS last_changed_by,

                 lastchangedat        AS local_last_changed_at
          ORDER BY travel_id
          UP TO 200 ROWS ).
    COMMIT WORK.

    " insert booking demo data
    INSERT zrap_abook_01 FROM (
        SELECT
          FROM /dmo/booking AS booking
                 JOIN
                   zrap110_atravsol AS z ON booking~travel_id = z~travel_id
          FIELDS uuid( )                 AS booking_uuid,
                 uuid( )                 AS travel_uuid,
                 booking~booking_id      AS booking_id,
                 booking~booking_date    AS booking_date,
                 booking~customer_id     AS customer_id,
                 booking~carrier_id      AS carrier_id,
                 booking~connection_id   AS connection_id,
                 booking~flight_date     AS flight_date,
                 booking~flight_price    AS flight_price,
                 booking~currency_code   AS currency_code,
                 z~created_by            AS created_by,
                 z~local_last_changed_by AS last_changed_by,
                 z~local_last_changed_at AS local_last_changed_by ).
    COMMIT WORK.

    out->write( 'Travel and Booking demo data inserted.' ).
  ENDMETHOD.
ENDCLASS.
