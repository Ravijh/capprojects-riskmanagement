using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { RiskManagement as my } from '../db/schema';

@path : '/service/RiskManagementDevSpaSvcs'
service RiskManagmentService
{
    annotate Migrations with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] }
    ];

    annotate Risks with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    @odata.draft.enabled
    entity Risks as
        projection on my.Risks;

    @odata.draft.enabled
    entity Migrations as
        projection on my.Migrations;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate RiskManagmentService with @requires :
[
    'authenticated-user',
    'RiskViewer',
    'RiskManager'
];
