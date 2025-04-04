SELECT
	OH.ORDER_ID ,
	OH.ORDER_DATE ,
	OH.STATUS_ID ,
	OR2.PARTY_ID ,
	OR2.ROLE_TYPE_ID ,
	PER.FIRST_NAME AS CUSTOMER_FIRST_NAME,
	PER.LAST_NAME AS CUSTOMER_SECOND_NAME,
	PG.GROUP_NAME AS ORGANIZATION,
	PA.ADDRESS1 AS STREET_ADDRESS,
	PA.CITY ,
	PA.STATE_PROVINCE_GEO_ID AS STATE_PROVINCE,
	PA.COUNTRY_GEO_ID AS COUNTRY_CODE
FROM
	ORDER_HEADER OH
JOIN ORDER_ROLE OR2
ON
	OH.ORDER_ID = OR2.ORDER_ID
	AND OH.STATUS_ID != 'CANCELLED'
	AND OH.ORDER_DATE BETWEEN '2023-10-01' AND '2023-10-30'
	AND OR2.ROLE_TYPE_ID = 'BILL_TO_CUSTOMER'
LEFT JOIN PERSON PER
ON
	PER.PARTY_ID = OR2.PARTY_ID
LEFT JOIN PARTY_GROUP PG
ON
	PG.PARTY_ID = OR2.PARTY_ID
JOIN ORDER_CONTACT_MECH OCM
ON
	OCM.ORDER_ID = OH.ORDER_ID
	AND OCM.CONTACT_MECH_PURPOSE_TYPE_ID = 'SHIPPING_LOCATION'
LEFT JOIN POSTAL_ADDRESS PA
ON
	PA.CONTACT_MECH_ID = OCM.CONTACT_MECH_ID
