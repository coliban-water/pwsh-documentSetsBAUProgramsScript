try {
    # Change site URL before running this script
    #$HubSiteURL = "https://colibanwater.sharepoint.com/sites/Projects"
    $SiteURL = "https://colibanwater.sharepoint.com/sites/PR-9997Testingtheprovisioningengine"

    $DocumentLibraryName = "Subproject Documents"
    $ContentTypeName = "BAU Program Subproject"
    $EnableDocumentSetFeatureGUID = "3bae86a2-776d-499d-9db8-fa4cdc7884f8"
    $ViewName = "All Documents"
    $ColumnName1 = "Project Owner"
    $ColumnName2 = "Subproject Location"
    $ColumnName3 = "Subproject Status"
    $ColumnName4 = "Subproject Year"

    # BAU Program Subproject Content Type (UAT)
    #$ContentTypeID = "0x0120D52000666D96818FF2EA438EF294E69A1811E0"
    # BAU Program Subproject Content Type (Production)
    $ContentTypeID = "0x0120D52000564F78D02B9EC04D9605534A48E88D79"

    # This will connect to the site
    Connect-PnPOnline -Url $SiteURL -Interactive
    
    # Associate site to hub site
    # Add-PnPHubToHubAssociation -SourceUrl $HubSiteURL -TargetUrl $SiteURL

    # This will enable the document set feature in the site collection
    Enable-PnPFeature -Identity $EnableDocumentSetFeatureGUID -Scope Site

    # This will create a document library in the specified site called "Subproject Documents"
    New-PnPList -Title $DocumentLibraryName -Template DocumentLibrary -OnQuickLaunch

    # This will enable the specified list to allow management of content types
    Set-PnPList -Identity $DocumentLibraryName -EnableContentTypes $True

    # This will add the 'BAU Program Subproject' content type from the content type hub to the specified site
    Add-PnPContentTypesFromContentTypeHub -ContentTypes $ContentTypeID -Site $SiteURL

    # This will add the 'BAU Program Subproject' content type to the document library
    Add-PnPContentTypeToList -List $DocumentLibraryName -ContentType $ContentTypeName -DefaultContentType
    
    # This will create the document sets in the document library
    #<#
    Add-PnPDocumentSet -List $DocumentLibraryName -ContentType $ContentTypeName -Name "1909 files"
    Add-PnPDocumentSet -List $DocumentLibraryName -ContentType $ContentTypeName -Name "2023"
    Add-PnPDocumentSet -List $DocumentLibraryName -ContentType $ContentTypeName -Name "Subproject 1"
    Add-PnPDocumentSet -List $DocumentLibraryName -ContentType $ContentTypeName -Name "Subproject 2"
    Add-PnPDocumentSet -List $DocumentLibraryName -ContentType $ContentTypeName -Name "Subproject 3"
    #>
    
    # This will add the required folders to the document set
    #<#
    Add-PnPFolder -Name "01 - Project Approvals" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "02 - Organisation" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "2.1 - Communications" -Folder "$DocumentLibraryName/1909 files/02 - Organisation"
    Add-PnPFolder -Name "2.2 - Engagement" -Folder "$DocumentLibraryName/1909 files/02 - Organisation"
    Add-PnPFolder -Name "2.3 - Project Team Meetings" -Folder "$DocumentLibraryName/1909 files/02 - Organisation"
    Add-PnPFolder -Name "2.4 - Change Management" -Folder "$DocumentLibraryName/1909 files/02 - Organisation"
    Add-PnPFolder -Name "03 - Design and Investigations" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "3.1 - Data Collection" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "3.2 - Safety In Design" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "3.3 - Concept" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "3.4 Preliminary" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "3.5 - Detail" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "3.6 - As Constructed" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "3.7 - Geotechnical" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "3.8 - Survey" -Folder "$DocumentLibraryName/1909 files/03 - Design and Investigations"
    Add-PnPFolder -Name "04 - Statutory Planning and Environment" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "4.1 - Statutory Planning" -Folder "$DocumentLibraryName/1909 files/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.2 - Environment" -Folder "$DocumentLibraryName/1909 files/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.3 - Traditional Owners" -Folder "$DocumentLibraryName/1909 files/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.4 - Other Stakeholders" -Folder "$DocumentLibraryName/1909 files/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "05 - Cost Time Risk Management" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "5.1 - Budget" -Folder "$DocumentLibraryName/1909 files/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.2 - Schedule" -Folder "$DocumentLibraryName/1909 files/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.3 - Risk Register" -Folder "$DocumentLibraryName/1909 files/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "06 - Procurement" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "07 - Consultant and Contractor" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "08 - Project Close" -Folder "$DocumentLibraryName/1909 files"
    Add-PnPFolder -Name "8.1 - Handover Forms" -Folder "$DocumentLibraryName/1909 files/08 - Project Close"
    Add-PnPFolder -Name "8.2 - Benefits Realisation" -Folder "$DocumentLibraryName/1909 files/08 - Project Close"
    Add-PnPFolder -Name "8.3 - Evaluation and Lessons Learnt" -Folder "$DocumentLibraryName/1909 files/08 - Project Close"
    Add-PnPFolder -Name "8.4 - Maintenance and Defects Outside Contract" -Folder "$DocumentLibraryName/1909 files/08 - Project Close"
    Add-PnPFolder -Name "01 - Project Approvals" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "02 - Organisation" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "2.1 - Communications" -Folder "$DocumentLibraryName/2023/02 - Organisation"
    Add-PnPFolder -Name "2.2 - Engagement" -Folder "$DocumentLibraryName/2023/02 - Organisation"
    Add-PnPFolder -Name "2.3 - Project Team Meetings" -Folder "$DocumentLibraryName/2023/02 - Organisation"
    Add-PnPFolder -Name "2.4 - Change Management" -Folder "$DocumentLibraryName/2023/02 - Organisation"
    Add-PnPFolder -Name "03 - Design and Investigations" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "3.1 - Data Collection" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "3.2 - Safety In Design" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "3.3 - Concept" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "3.4 Preliminary" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "3.5 - Detail" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "3.6 - As Constructed" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "3.7 - Geotechnical" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "3.8 - Survey" -Folder "$DocumentLibraryName/2023/03 - Design and Investigations"
    Add-PnPFolder -Name "04 - Statutory Planning and Environment" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "4.1 - Statutory Planning" -Folder "$DocumentLibraryName/2023/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.2 - Environment" -Folder "$DocumentLibraryName/2023/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.3 - Traditional Owners" -Folder "$DocumentLibraryName/2023/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.4 - Other Stakeholders" -Folder "$DocumentLibraryName/2023/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "05 - Cost Time Risk Management" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "5.1 - Budget" -Folder "$DocumentLibraryName/2023/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.2 - Schedule" -Folder "$DocumentLibraryName/2023/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.3 - Risk Register" -Folder "$DocumentLibraryName/2023/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "06 - Procurement" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "07 - Consultant and Contractor" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "08 - Project Close" -Folder "$DocumentLibraryName/2023"
    Add-PnPFolder -Name "8.1 - Handover Forms" -Folder "$DocumentLibraryName/2023/08 - Project Close"
    Add-PnPFolder -Name "8.2 - Benefits Realisation" -Folder "$DocumentLibraryName/2023/08 - Project Close"
    Add-PnPFolder -Name "8.3 - Evaluation and Lessons Learnt" -Folder "$DocumentLibraryName/2023/08 - Project Close"
    Add-PnPFolder -Name "8.4 - Maintenance and Defects Outside Contract" -Folder "$DocumentLibraryName/2023/08 - Project Close"
    Add-PnPFolder -Name "01 - Project Approvals" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "02 - Organisation" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "2.1 - Communications" -Folder "$DocumentLibraryName/Subproject 1/02 - Organisation"
    Add-PnPFolder -Name "2.2 - Engagement" -Folder "$DocumentLibraryName/Subproject 1/02 - Organisation"
    Add-PnPFolder -Name "2.3 - Project Team Meetings" -Folder "$DocumentLibraryName/Subproject 1/02 - Organisation"
    Add-PnPFolder -Name "2.4 - Change Management" -Folder "$DocumentLibraryName/Subproject 1/02 - Organisation"
    Add-PnPFolder -Name "03 - Design and Investigations" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "3.1 - Data Collection" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "3.2 - Safety In Design" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "3.3 - Concept" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "3.4 Preliminary" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "3.5 - Detail" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "3.6 - As Constructed" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "3.7 - Geotechnical" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "3.8 - Survey" -Folder "$DocumentLibraryName/Subproject 1/03 - Design and Investigations"
    Add-PnPFolder -Name "04 - Statutory Planning and Environment" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "4.1 - Statutory Planning" -Folder "$DocumentLibraryName/Subproject 1/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.2 - Environment" -Folder "$DocumentLibraryName/Subproject 1/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.3 - Traditional Owners" -Folder "$DocumentLibraryName/Subproject 1/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.4 - Other Stakeholders" -Folder "$DocumentLibraryName/Subproject 1/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "05 - Cost Time Risk Management" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "5.1 - Budget" -Folder "$DocumentLibraryName/Subproject 1/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.2 - Schedule" -Folder "$DocumentLibraryName/Subproject 1/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.3 - Risk Register" -Folder "$DocumentLibraryName/Subproject 1/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "06 - Procurement" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "07 - Consultant and Contractor" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "08 - Project Close" -Folder "$DocumentLibraryName/Subproject 1"
    Add-PnPFolder -Name "8.1 - Handover Forms" -Folder "$DocumentLibraryName/Subproject 1/08 - Project Close"
    Add-PnPFolder -Name "8.2 - Benefits Realisation" -Folder "$DocumentLibraryName/Subproject 1/08 - Project Close"
    Add-PnPFolder -Name "8.3 - Evaluation and Lessons Learnt" -Folder "$DocumentLibraryName/Subproject 1/08 - Project Close"
    Add-PnPFolder -Name "8.4 - Maintenance and Defects Outside Contract" -Folder "$DocumentLibraryName/Subproject 1/08 - Project Close"
    Add-PnPFolder -Name "01 - Project Approvals" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "02 - Organisation" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "2.1 - Communications" -Folder "$DocumentLibraryName/Subproject 2/02 - Organisation"
    Add-PnPFolder -Name "2.2 - Engagement" -Folder "$DocumentLibraryName/Subproject 2/02 - Organisation"
    Add-PnPFolder -Name "2.3 - Project Team Meetings" -Folder "$DocumentLibraryName/Subproject 2/02 - Organisation"
    Add-PnPFolder -Name "2.4 - Change Management" -Folder "$DocumentLibraryName/Subproject 2/02 - Organisation"
    Add-PnPFolder -Name "03 - Design and Investigations" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "3.1 - Data Collection" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "3.2 - Safety In Design" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "3.3 - Concept" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "3.4 Preliminary" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "3.5 - Detail" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "3.6 - As Constructed" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "3.7 - Geotechnical" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "3.8 - Survey" -Folder "$DocumentLibraryName/Subproject 2/03 - Design and Investigations"
    Add-PnPFolder -Name "04 - Statutory Planning and Environment" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "4.1 - Statutory Planning" -Folder "$DocumentLibraryName/Subproject 2/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.2 - Environment" -Folder "$DocumentLibraryName/Subproject 2/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.3 - Traditional Owners" -Folder "$DocumentLibraryName/Subproject 2/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.4 - Other Stakeholders" -Folder "$DocumentLibraryName/Subproject 2/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "05 - Cost Time Risk Management" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "5.1 - Budget" -Folder "$DocumentLibraryName/Subproject 2/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.2 - Schedule" -Folder "$DocumentLibraryName/Subproject 2/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.3 - Risk Register" -Folder "$DocumentLibraryName/Subproject 2/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "06 - Procurement" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "07 - Consultant and Contractor" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "08 - Project Close" -Folder "$DocumentLibraryName/Subproject 2"
    Add-PnPFolder -Name "8.1 - Handover Forms" -Folder "$DocumentLibraryName/Subproject 2/08 - Project Close"
    Add-PnPFolder -Name "8.2 - Benefits Realisation" -Folder "$DocumentLibraryName/Subproject 2/08 - Project Close"
    Add-PnPFolder -Name "8.3 - Evaluation and Lessons Learnt" -Folder "$DocumentLibraryName/Subproject 2/08 - Project Close"
    Add-PnPFolder -Name "8.4 - Maintenance and Defects Outside Contract" -Folder "$DocumentLibraryName/Subproject 2/08 - Project Close"
    Add-PnPFolder -Name "01 - Project Approvals" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "02 - Organisation" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "2.1 - Communications" -Folder "$DocumentLibraryName/Subproject 3/02 - Organisation"
    Add-PnPFolder -Name "2.2 - Engagement" -Folder "$DocumentLibraryName/Subproject 3/02 - Organisation"
    Add-PnPFolder -Name "2.3 - Project Team Meetings" -Folder "$DocumentLibraryName/Subproject 3/02 - Organisation"
    Add-PnPFolder -Name "2.4 - Change Management" -Folder "$DocumentLibraryName/Subproject 3/02 - Organisation"
    Add-PnPFolder -Name "03 - Design and Investigations" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "3.1 - Data Collection" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "3.2 - Safety In Design" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "3.3 - Concept" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "3.4 Preliminary" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "3.5 - Detail" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "3.6 - As Constructed" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "3.7 - Geotechnical" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "3.8 - Survey" -Folder "$DocumentLibraryName/Subproject 3/03 - Design and Investigations"
    Add-PnPFolder -Name "04 - Statutory Planning and Environment" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "4.1 - Statutory Planning" -Folder "$DocumentLibraryName/Subproject 3/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.2 - Environment" -Folder "$DocumentLibraryName/Subproject 3/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.3 - Traditional Owners" -Folder "$DocumentLibraryName/Subproject 3/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "4.4 - Other Stakeholders" -Folder "$DocumentLibraryName/Subproject 3/04 - Statutory Planning and Environment"
    Add-PnPFolder -Name "05 - Cost Time Risk Management" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "5.1 - Budget" -Folder "$DocumentLibraryName/Subproject 3/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.2 - Schedule" -Folder "$DocumentLibraryName/Subproject 3/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "5.3 - Risk Register" -Folder "$DocumentLibraryName/Subproject 3/05 - Cost Time Risk Management"
    Add-PnPFolder -Name "06 - Procurement" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "07 - Consultant and Contractor" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "08 - Project Close" -Folder "$DocumentLibraryName/Subproject 3"
    Add-PnPFolder -Name "8.1 - Handover Forms" -Folder "$DocumentLibraryName/Subproject 3/08 - Project Close"
    Add-PnPFolder -Name "8.2 - Benefits Realisation" -Folder "$DocumentLibraryName/Subproject 3/08 - Project Close"
    Add-PnPFolder -Name "8.3 - Evaluation and Lessons Learnt" -Folder "$DocumentLibraryName/Subproject 3/08 - Project Close"
    Add-PnPFolder -Name "8.4 - Maintenance and Defects Outside Contract" -Folder "$DocumentLibraryName/Subproject 3/08 - Project Close"
    #>

    Write-host -f Green "Documents Sets and Folders Added to Subproject Document Document Library"

    #Get the Context
    $Context = Get-PnPContext
 
    #Get the List View from the list
    $ListView  =  Get-PnPView -List $DocumentLibraryName -Identity $ViewName -ErrorAction Stop
 
    #Check if view doesn't have the column already
    If($ListView.ViewFields -notcontains $ColumnName1 -and $ListView.ViewFields -notcontains $ColumnName2 -and $ListView.ViewFields -notcontains $ColumnName3 -and $ListView.ViewFields -notcontains $ColumnName4)
    {
        #Add Columns to View
        $ListView.ViewFields.Add($ColumnName1)
        $ListView.Update()
        $Context.ExecuteQuery()
        $ListView.ViewFields.Add($ColumnName2)
        $ListView.Update()
        $Context.ExecuteQuery()
        $ListView.ViewFields.Add($ColumnName3)
        $ListView.Update()
        $Context.ExecuteQuery()
        $ListView.ViewFields.Add($ColumnName4)
        $ListView.Update()
        $Context.ExecuteQuery()
        Write-host -f Green "Columns Added to View '$ViewName'"
    }
    else
    {
        Write-host -f Yellow "Columns Already Exists in View '$ViewName'"
    }

    Write-host -f Green "You're all good!"

}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}