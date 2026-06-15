page 70950 "Service Comment Subform"
{
    PageType = ListPart;
    SourceTable = "Service Comment Line";
}

page 70951 "Service Comment Subform RO"
{
    PageType = ListPart;
    SourceTable = "Service Comment Line";

    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
}

// Duplicated page usage by context:
// part(Comments; "Service Comment Subform")    // Draft
// part(Comments; "Service Comment Subform RO") // Posted
