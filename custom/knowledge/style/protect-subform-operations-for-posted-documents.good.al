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
                    var
                        ExtDescrMgt: Codeunit "GHV Extended Descr. Mgt";
                        SelectCommentTypeMsg: Label 'Please select a comment type';
                    begin
                        if Rec."Line No." = 0 then begin
                            Message(SelectCommentTypeMsg);
                            exit;
                        end;

                        if IsPostedContext() then begin
                            ExtDescrMgt.ShowReadOnly(Rec.GetExtendeComment(false));
                            exit;
                        end;

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
