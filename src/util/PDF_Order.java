package util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.html.simpleparser.HTMLWorker;
import com.lowagie.text.pdf.PdfWriter;

public class PDF_Order {
		
	public boolean publishPdf(String pdfUrl,String html){
		Document document = new Document(PageSize.LETTER);
		try {
			PdfWriter.getInstance(document, new FileOutputStream(pdfUrl));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (DocumentException e) {
			e.printStackTrace();
			return false;
		}
		document.open();
		HTMLWorker htmlWorker = new HTMLWorker(document);
		try {
			htmlWorker.parse(new StringReader(html));
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		document.close();
		return true;

	}
  
 } 
 
