// ANTI-PATTERN 1: Init before checking existence — wastes memory and makes logic unclear
local procedure GHV2423_MigrateBookingConfNotifCodeToSelection_Bad1()
var
    Location: Record Location;
    CustNotifSelection: Record "GHV Cust. Notif. Selection";
begin
    Location.Reset();
    Location.SetFilter("GHV Booking Conf. Notif. Code", '<>%1', '');
    if Location.FindSet() then
        repeat
            CustNotifSelection.Init();  // BAD: Init unconditionally
            CustNotifSelection."Notification Type" := Enum::"GHV Customer Notification Type"::"Booking Confirmation";
            CustNotifSelection."Location Code" := Location.Code;
            CustNotifSelection."Service Type" := '';
            if not CustNotifSelection.Get(CustNotifSelection."Notification Type", CustNotifSelection."Location Code", '') then begin
                CustNotifSelection."Notification Code" := Location."GHV Booking Conf. Notif. Code";
                CustNotifSelection.Insert();
            end;
        until Location.Next() = 0;
end;

// ANTI-PATTERN 2: Unguarded Insert with error-recovery Modify — both can fail
local procedure GHV2423_MigrateBookingConfNotifCodeToSelection_Bad2()
var
    Location: Record Location;
    CustNotifSelection: Record "GHV Cust. Notif. Selection";
begin
    Location.Reset();
    Location.SetFilter("GHV Booking Conf. Notif. Code", '<>%1', '');
    if Location.FindSet() then
        repeat
            CustNotifSelection.Init();
            CustNotifSelection."Notification Type" := Enum::"GHV Customer Notification Type"::"Booking Confirmation";
            CustNotifSelection."Location Code" := Location.Code;
            CustNotifSelection."Service Type" := '';
            CustNotifSelection."Notification Code" := Location."GHV Booking Conf. Notif. Code";
            // BAD: Unguarded Insert, then attempting Modify as fallback
            if not CustNotifSelection.Insert() then
                CustNotifSelection.Modify();  // Risky: both can still fail
        until Location.Next() = 0;
end;
