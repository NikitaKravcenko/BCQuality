// GOOD: Obsolete only on table, deleted from UI pages

// Table extension — mark obsolete here
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

// Page extension — DELETE the field from UI pages; no obsolete marking
pageextension 50100 "GH Location Card Ext" extends "Location Card"
{
    layout
    {
        // GHVBookingConfNotifCode field is removed entirely
        // Users never see an obsolete warning; the field is simply not there
    }
}

// API Page — EXCEPTION: may retain with obsolete marking for API contract visibility
page 50101 "GH Location API"
{
    PageType = Api;
    SourceTable = Location;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ghvBookingConfNotifCode; Rec."GHV Booking Conf. Notif. Code")
                {
                    Caption = 'Booking Confirmation Notif. Code';
                    // For API pages only, the obsolete marking is acceptable
                    // to signal API consumers of the deprecation
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Use GHV Cust. Notif. Selection table instead.';
                    ObsoleteTag = '27.4';
                }
            }
        }
    }
}
