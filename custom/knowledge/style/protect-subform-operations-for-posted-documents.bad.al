page 70950 "Service Comment Subform"
{
    PageType = ListPart;
    SourceTable = "Service Comment Line";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(CommentText; Rec."Comment Text")
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        // Bad: blind exit prevents users from viewing posted comments.
                        if (Rec.Type = Rec.Type::"Posted Jobsheet") or
                           (Rec.Type = Rec.Type::"Posted Return Jobsheet") then
                            exit;

                        OpenExtendedCommentEditor();
                    end;
                }
            }
        }
    }

    local procedure OpenExtendedCommentEditor()
    begin
    end;
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
