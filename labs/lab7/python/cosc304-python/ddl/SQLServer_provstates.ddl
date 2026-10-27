USE workson;
GO

DROP TABLE IF EXISTS states;

CREATE TABLE states(
	countryCode char(2),
	stateCode char(2),
	stateName char(40)
);


INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Alberta', 'AB', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('British Columbia', 'BC', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Manitoba', 'MB', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('New Brunswick', 'NB', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Newfoundland and Labrador', 'NL', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Northwest Territories', 'NT', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Nova Scotia', 'NS', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Nunavut', 'NU', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Ontario', 'ON', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Prince Edward Island', 'PE', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Québec', 'QC', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Saskatchewan', 'SK', 'CA');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Yukon Territory', 'YT', 'CA');


INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Alabama', 'AL', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Alaska', 'AK', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('American Samoa', 'AS', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Arizona', 'AZ', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Arkansas', 'AR', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Armed Forces America', 'AA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Armed Forces Other Areas', 'AE', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Armed Forces Pacific', 'AP', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('California', 'CA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Colorado', 'CO', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Connecticut', 'CT', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Delaware', 'DE', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('District of Columbia', 'DC', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Federated States of Micronesia', 'FM', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Florida', 'FL', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Georgia', 'GA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Guam', 'GU', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Hawaii', 'HI', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Idaho', 'ID', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Illinois', 'IL', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Indiana', 'IN', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Iowa', 'IA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Kansas', 'KS', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Kentucky', 'KY', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Louisiana', 'LA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Maine', 'ME', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Marshall Islands', 'MH', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Maryland', 'MD', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Massachusetts', 'MA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Michigan', 'MI', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Minnesota', 'MN', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Mississippi', 'MS', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Missouri', 'MO', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Montana', 'MT', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Nebraska', 'NE', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Nevada', 'NV', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('New Hampshire', 'NH', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('New Jersey', 'NJ', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('New Mexico', 'NM', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('New York', 'NY', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('North Carolina', 'NC', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('North Dakota', 'ND', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Northern Mariana Islands', 'MP', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Ohio', 'OH', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Oklahoma', 'OK', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Oregon', 'OR', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Palau', 'PW', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Pennsylvania', 'PA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Puerto Rico', 'PR', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Rhode Island', 'RI', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('South Carolina', 'SC', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('South Dakota', 'SD', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Tennessee', 'TN', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Texas', 'TX', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('U.S. Virgin Islands', 'VI', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Utah', 'UT', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Vermont', 'VT', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Virginia', 'VA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Washington', 'WA', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('West Virginia', 'WV', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Wisconsin', 'WI', 'US');
INSERT INTO states (stateName, stateCode, countryCode) VALUES ('Wyoming', 'WY', 'US');