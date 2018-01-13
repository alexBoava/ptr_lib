#Geodetic functions in MySQL

DELIMITER $$

#Degree to Radians
CREATE FUNCTION DEG2RAD (DEG DOUBLE)  RETURNS DOUBLE
BEGIN
	RETURN DEG * (PI()/180);
END $$


DROP FUNCTION IF EXISTS HARVESINE;
DELIMITER $$

#Haversine

CREATE FUNCTION HAVERSINE (LATI DOUBLE, LONGI DOUBLE,LATF DOUBLE, LONGF DOUBLE)  RETURNS DOUBLE
BEGIN 
	SET @D = 6371000;
    SET @DLAT = LATF - LATI;
    SET @DLON = LONGF - LONGI;
	SET @A = pow(sin(DEG2RAD(@DLAT)/2),2) + cos(DEG2RAD(LATI)) * cos(DEG2RAD(LATF))* 
             pow(sin(DEG2RAD(@DLON)/2),2) ;
	SET @C = 2 * atan2(sqrt(@A),sqrt(1-@A));
    SET @D = @R * @C;
    RETURN @D;
END$$