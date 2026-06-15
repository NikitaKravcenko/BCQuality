// BAD: Marking obsolete on both table AND non-API page creates duplicate signals and confuses users

// Table extension — correctly marked obsolete
tableextension 50100 "GH Location Ext" extends Location
{
    fields
    {
        field(25006930; "GHV Booking Conf. Notif. Code"; Code[20])
        {
            Caption = 'Booking Confirmation Notif. Code';
            DataClassification = CustomerContent;
            TableRelation = "GHV Customer Notification".Code;
            ObsoleteState = Pending;
            ObsoleteReason = 'Replaced by GHV Cust. Notif. Selection table.';
            ObsoleteTag = '27.4';
        }
    }
}

// Page extension — BAD: also marking obsolete creates duplicate/conflicting signals
pageextension 50100 "GH Location Card Ext" extends "Location Card"
{
    layout
    {
        addafter("Address")
        {
            field(GHVBookingConfNotifCode; Rec."GHV Booking Conf. Notif. Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the customer confirmation notification.';
                // BAD: Obsolete marking on a UI page confuses end users
                // They see a deprecation warning but cannot do anything about it
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by GHV Cust. Notif. Selection table.';
                ObsoleteTag = '27.4';
            }
        }
    }
}
