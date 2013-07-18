/*
Copyright (c) 2000-2013 "independIT Integrative Technologies GmbH",
Authors: Ronald Jeninga, Dieter Stubler

schedulix Enterprise Job Scheduling System

independIT Integrative Technologies GmbH [http://www.independit.de]
mailto:contact@independit.de

This file is part of schedulix

schedulix is free software: 
you can redistribute it and/or modify it under the terms of the 
GNU Affero General Public License as published by the 
Free Software Foundation, either version 3 of the License, 
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
-- Copyright (C) 2001,2002 topIT Informationstechnologie GmbH
-- Copyright (C) 2003-2006 independIT Integrative Technologies GmbH

CREATE TABLE FOLDER (
    ID                             DECIMAL(20) NOT NULL
    , `NAME`                         varchar(64)     NOT NULL
    , `OWNER_ID`                     decimal(20)     NOT NULL
    , `ENV_ID`                       decimal(20)         NULL
    , `PARENT_ID`                    decimal(20)         NULL
    , `CREATOR_U_ID`                 decimal(20)     NOT NULL
    , `CREATE_TS`                    decimal(20)     NOT NULL
    , `CHANGER_U_ID`                 decimal(20)     NOT NULL
    , `CHANGE_TS`                    decimal(20)     NOT NULL
    , `INHERIT_PRIVS`                decimal(20)     NOT NULL
    , VALID_FROM                   DECIMAL(20) NOT NULL
    , VALID_TO                     DECIMAL(20) NOT NULL
) engine = innodb;
CREATE INDEX PK_FOLDER
ON FOLDER(id);
CREATE VIEW SCI_C_FOLDER AS
SELECT
    ID
    , `NAME`                         AS `NAME`
    , `OWNER_ID`                     AS `OWNER_ID`
    , `ENV_ID`                       AS `ENV_ID`
    , `PARENT_ID`                    AS `PARENT_ID`
    , `CREATOR_U_ID`                 AS `CREATOR_U_ID`
    , from_unixtime((`CREATE_TS` & ~1125899906842624)/1000) AS `CREATE_TS`
    , `CHANGER_U_ID`                 AS `CHANGER_U_ID`
    , from_unixtime((`CHANGE_TS` & ~1125899906842624)/1000) AS `CHANGE_TS`
    , `INHERIT_PRIVS`                AS `INHERIT_PRIVS`
  FROM FOLDER
 WHERE VALID_TO = 9223372036854775807;
CREATE VIEW SCI_V_FOLDER AS
SELECT
    ID
    , `NAME`                         AS `NAME`
    , `OWNER_ID`                     AS `OWNER_ID`
    , `ENV_ID`                       AS `ENV_ID`
    , `PARENT_ID`                    AS `PARENT_ID`
    , `CREATOR_U_ID`                 AS `CREATOR_U_ID`
    , from_unixtime((`CREATE_TS` & ~1125899906842624)/1000) AS `CREATE_TS`
    , `CHANGER_U_ID`                 AS `CHANGER_U_ID`
    , from_unixtime((`CHANGE_TS` & ~1125899906842624)/1000) AS `CHANGE_TS`
    , `INHERIT_PRIVS`                AS `INHERIT_PRIVS`
    , VALID_FROM
    , VALID_TO
  FROM FOLDER;
