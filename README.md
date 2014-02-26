PdfReader
=========

346 assignment 2 Otago University

Assignment 2. PDF Viewer
The world needs another PDF Viewer. In this assignment you will design and
implement one using Cocoa. The must have functionality of your viewer will be as
follows (60 points):
Navigate the document (next page, previous page, jump to any page)
Indicate current page in the document
Zoom in, zoom out, zoom to bit
Resize the pdf view with the window
Change display mode (continuous, single page, two pages, etc.)
Back and forward navigation, as in:
If, from page 6, I selected the next page, page 7, and then jumped to page 33:
o
Selecting back will take me back to page 7
o
Selecting back again will take me back to page 6
o
Selecting forward now will take me to page 7
You can be as creative and inventive as you wish with your user interface – for
instance, there are many ways of providing a user with the ability to jump to an
arbitrary page, or showing where they are in the document. But keep in mind that
you’ll be marked on usability. Also, don’t forget to
customise
the menu and connect
its items to correct actions.
You will bind that PDF Kit,
https://developer.apple.com/library/mac/documentation/graphicsimaging/Concep
tual/PDFKitGuide
, provides classes that help with most of the handling of a PDF
document (instructions how to add the PDF Kit framework to your Cocoa project are
provided separately). Most of your work for the core functionality of your viewer
will consist of creating a user interface, which selects and calls the appropriate
methods of the PDFViewer class.
For the remaining 40 points in this project, you have a choice. You can implement
any combination of the following, but only need 40 points (in addition to the 60
points awarded for the core functionality) to get full marks on the assignment:
Make your viewer a library style application (40 points)
o
Starting the application will bring up a window with thumbnails for a list
of documents in the library.
o
User has the ability to add/remove documents to/from the library (you
probably don’t need to copy pdf biles around, just keep track of their
location on the hard drive).
o
Clicking on a thumbnail opens the corresponding document
o
This application can be document based, as in allow multiple pdfs to be
open at a time, or single window based, as in only one pdf open at a time,
where closing the document would bring back the library window with
the list of pdf thumbnails.







Add ability to make annotations (40 points)
o
Once again, you’ll bind the PDF Kit and subclasses of PDFAnnotations class
extremely helpful for this task
o
You don’t have to do all type of annotations, just a selection of two or
more
o
Provide undo and redo for undoing and redoing annotation actions
o
Your application will be document based – user will have the ability to
have multiple pdf biles open at a time
o
You must provide functionality for the user to open and close pdf
documents
Provide functionality for the user to open multiple pdf documents (10 points)
o
This is for people who chose not to do the library style app nor do
annotations, but still are able to create a multidocument application
Do some graphic design (10 points)
o
Design and create an icon for your application and add it to your project
o
Design and display a splash screen at the start of your application
Add presentation mode functionality to your viewer (10 points)
o
That is, the viewer can work in fullscreen mode
Add search document capability (10 points)
o
With ability to specify search options provided by the PDFKit
You are free to choose any combination of the functionality above. If you’re aiming
for more than 100 potential marks, you might pick up extras from additional
features whenever you lose marks elsewhere (like in the core functionality). But you
won’t get more than 100 points.
Resources
Aside from designing your own icon for the application, you can use readymade
icons for buttons and other visual elements: for example
http://www.gentleface.com/free_icon_set.html#geticons
. Be sure to include credits
for anything that you use in your About panel.
Report
I don’t require a report about the internal workings of your application. However,
you will need to hand in something that provides a list of features you implemented,
and how to use them (especially if they are operated with keyboard shortcuts). This
will assure that I don’t miss anything. You can make this list a pdf document part of
your application bundle and load it by default in your application.


SELECT POLICYSUMMARY.POLICYNUMBER,
        POLICYSUMMARY.EFFECTIVE,
        POLICYSUMMARY.EXPIRATION,
        POLICYSUMMARY.CURRENTREVISIONIND,
        POLICYSUMMARY.POLICYSTATUSCD,
        POLICYSUMMARY.PREVIOUSPOLICYVERSIONID,
        POLICYSUMMARY.REVISIONNO,
        POLICYSUMMARY.TRANSACTIONDATE,
        POLICYSUMMARY.TRANSACTIONEFFECTIVEDATE,
        POLICYSUMMARY.TXTYPE,
        POLICYSUMMARY.VERSION,
        POLICYSUMMARY.PAYMENTOPTION_ID,
        POLICYSUMMARY.ENTITYSTATUS,
        POLICYSUMMARY.ANNIVERSARYDATE,
        POLICYSUMMARY.AMICANCELINFO_ID,
        
        --LEDGERTRANSACTION.*,
        COVERAGE.RISKITEM_ID as COVERAGE_RISKITEM_ID,
        COVERAGE.ID as COVERAGE_ID,
        COVERAGE.COVERAGECD,
        LEDGERENTRY.ID as LEDGERENTRY_ID,
        LEDGERTRANSACTION.ID AS LEDGERTRANSACTION_ID,
        (CASE LEDGERENTRY.ENTRYTYPE WHEN 'CREDIT' THEN -LEDGERENTRY.ENTRYAMT ELSE LEDGERENTRY.ENTRYAMT END) AS DISCOUNT_AMOUNT
    FROM
        STAGING.MV_COVERAGE COVERAGE
        INNER JOIN STAGING.MV_LEDGERENTRY LEDGERENTRY
            ON LEDGERENTRY.COVERAGE_FK = COVERAGE.ID
        LEFT JOIN STAGING.MV_LEDGERTX_ENTRY LEDGERTX_ENTRY
            ON LEDGERTX_ENTRY.ENTRIES_ID = LEDGERENTRY.ID
        INNER JOIN STAGING.MV_LEDGERTRANSACTION LEDGERTRANSACTION
            ON LEDGERTRANSACTION.ID = LEDGERTX_ENTRY.LEDGERTRANSACTION_ID 
            
    INNER JOIN STAGING.MV_RISKITEM RISKITEM
        ON RISKITEM.ID = COVERAGE.RISKITEM_ID
    INNER JOIN STAGING.MV_POLICYSUMMARY POLICYSUMMARY
        ON POLICYSUMMARY.POLICYDETAIL_ID = RISKITEM.POLICYDETAIL_ID

            
    WHERE
        COVERAGE.COVERAGECD in ('STAFFA', 'STAFFB', 'STAFFP') -- Staff discounts for ABS, base policy and options
        AND LEDGERENTRY.LEDGERACCOUNTNO = '1022' -- Direct premium written (ignore the UPR transactions)
        AND POLICYSUMMARY.POLICYNUMBER = 'M0010006097'
        --AND LEDGERTRANSACTION.TXTYPE = 'Cancellation





