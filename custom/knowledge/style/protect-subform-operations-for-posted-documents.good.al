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
                        if IsPostedContext() then
                            exit;

                        OpenExtendedCommentEditor();
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if IsPostedContext() then
            exit(false);

        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if IsPostedContext() then
            exit(false);

        exit(true);
    end;

    local procedure IsPostedContext(): Boolean
    begin
        exit((Rec.Type = Rec.Type::"Posted Jobsheet") or
             (Rec.Type = Rec.Type::"Posted Return Jobsheet"));
    end;

    local procedure OpenExtendedCommentEditor()
    begin
    end;
}
