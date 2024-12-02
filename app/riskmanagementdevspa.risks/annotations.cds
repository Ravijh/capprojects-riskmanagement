using RiskManagmentService as service from '../../srv/service';
annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Supplier_BusinessPartner,
            Label : 'Supplier_BusinessPartner',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Form',
            ID : 'Form',
            Target : '@UI.FieldGroup#Form',
        },
    ],
    UI.FieldGroup #Form : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : multi_ID,
                Label : 'multi_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : Supplier.BusinessPartnerFullName,
                Label : 'BusinessPartnerFullName',
            },
            {
                $Type : 'UI.DataField',
                Value : Supplier.BusinessPartnerIsBlocked,
                Label : 'BusinessPartnerIsBlocked',
            },
            {
                $Type : 'UI.DataField',
                Value : Supplier_BusinessPartner,
                Label : 'Supplier_BusinessPartner',
            },
        ],
    },
);

annotate service.Risks with {
    Supplier @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'A_BusinessPartner',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Supplier_BusinessPartner,
                    ValueListProperty : 'BusinessPartner',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'BusinessPartnerFullName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'BusinessPartnerIsBlocked',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

