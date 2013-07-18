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

CREATE TABLE WATCH_TYPE_PARAMETER (
    ID                             DECIMAL(20) NOT NULL
    , NAME                           varchar(64)     NOT NULL
    , DEFAULTVALUE                   varchar(256)        NULL
    , WT_ID                          decimal(20)     NOT NULL
    , IS_SUBMIT_PAR                  integer         NOT NULL
    , TYPE                           integer         NOT NULL
    , CREATOR_U_ID                   decimal(20)     NOT NULL
    , CREATE_TS                      decimal(20)     NOT NULL
    , CHANGER_U_ID                   decimal(20)     NOT NULL
    , CHANGE_TS                      decimal(20)     NOT NULL
);
CREATE UNIQUE INDEX PK_WATCH_TYPE_PARAMETER
ON WATCH_TYPE_PARAMETER(ID);
CREATE VIEW SCI_WATCH_TYPE_PARAMETER AS
SELECT
    ID
    , NAME                           AS NAME
    , DEFAULTVALUE                   AS DEFAULTVALUE
    , WT_ID                          AS WT_ID
    , CASE IS_SUBMIT_PAR WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_SUBMIT_PAR
    , CASE TYPE WHEN 1 THEN 'CONFIG' WHEN 2 THEN 'VALUE' WHEN 3 THEN 'INFO' END AS TYPE
    , CREATOR_U_ID                   AS CREATOR_U_ID
    , timestamp 'epoch' + cast(to_char(mod(CREATE_TS, 1125899906842624)/1000, '999999999999') as interval) AS CREATE_TS
    , CHANGER_U_ID                   AS CHANGER_U_ID
    , timestamp 'epoch' + cast(to_char(mod(CHANGE_TS, 1125899906842624)/1000, '999999999999') as interval) AS CHANGE_TS
  FROM WATCH_TYPE_PARAMETER;
