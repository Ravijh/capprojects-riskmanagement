namespace RiskManagement;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risks : managed
{
    key ID : UUID;
    title : String(100);
    prio : String(3);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    multi : Association to one Migrations;
    Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Migrations : managed
{
    key ID : UUID;
    descr : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.multi = $self;
}
