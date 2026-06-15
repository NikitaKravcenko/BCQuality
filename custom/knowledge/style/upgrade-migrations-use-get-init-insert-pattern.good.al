local procedure GHV2423_MigrateBookingConfNotifCodeToSelection()
var
    Location: Record Location;
    CustNotifSelection: Record "GHV Cust. Notif. Selection";
    CustomerNotification: Record "GHV Customer Notification";
begin
    // Check whether the tag has been used before, and if so, don't run upgrade code
    if UpgradeTagMgt.HasUpgradeTag(UpgradeTagDefinition.GetMigrateBookingConfNotifCodeToSelectionTag()) then
        exit;

    Location.Reset();
    Location.SetFilter("GHV Booking Conf. Notif. Code", '<>%1', '');
    if Location.FindSet() then
        repeat
            // Guard: first verify the source notification exists
            if CustomerNotification.Get(Location."GHV Booking Conf. Notif. Code") then
                // Get with actual source key values; if not found, init and insert
                if not CustNotifSelection.Get(CustomerNotification.Type, Location.Code, '') then begin
                    CustNotifSelection.Init();
                    CustNotifSelection."Notification Type" := CustomerNotification.Type;
                    CustNotifSelection."Location Code" := Location.Code;
                    CustNotifSelection."Service Type" := '';
                    CustNotifSelection."Notification Code" := CustomerNotification.Code;
                    CustNotifSelection.Insert();
                end;
        until Location.Next() = 0;

    UpgradeTagMgt.SetUpgradeTag(UpgradeTagDefinition.GetMigrateBookingConfNotifCodeToSelectionTag());
end;
