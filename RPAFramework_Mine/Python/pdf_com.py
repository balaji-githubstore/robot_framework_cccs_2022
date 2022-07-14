import PyPDF2
from pickle import FALSE


def pdf_comp(pdf1,pdf2):
    with open(pdf1,"rb") as pdf1:
        with open(pdf2,"rb") as pdf2:
            pdfreader_1=PyPDF2.PdfFileReader(pdf1)
            pdfreader_2=PyPDF2.PdfFileReader(pdf2)
            pdf1_pg_no=pdfreader_1.numPages
            pdf2_pg_no=pdfreader_2.numPages
            pdf1_pg=pdfreader_1.getPage(1).extractText()
            pdf2_pg=pdfreader_2.getPage(1).extractText()
            if pdf1_pg==pdf2_pg and pdf1_pg_no==pdf2_pg_no:
                return True
            return False
    