package org.idpf.docbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import nu.xom.Builder;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Elements;
import nu.xom.Nodes;
import nu.xom.ParentNode;
import nu.xom.Serializer;
import nu.xom.XPathContext;

import org.daisy.util.file.Directory;

public class GlosslistHandler {
	
	private static final String dbns = "http://docbook.org/ns/docbook";
	private static final String xmlns = "http://www.w3.org/XML/1998/namespace";
	private final XPathContext con;
	
	public GlosslistHandler(String inDir, String outDir) throws Exception {
		Directory in = new Directory(inDir);		
		if(!in.exists()) throw new IOException(inDir);
		
		Collection<File> files = in.getFiles();
		System.out.println("processing glossentries in " + files.size() + " files");
				
		con = new XPathContext();
		con.addNamespace("db", dbns);
		
		for(File file : files) {
			System.out.println("processing glossentries in " + file.getName());
			if(file.getCanonicalPath().endsWith(".xml")) {				
				Builder builder = new Builder();
				Document doc = builder.build(file);
				try{
					doc = process(doc);
				}catch (Exception e) {
					System.err.println("Error processing " + file.getName());
					throw e;
				}
				serialize(doc, new File(outDir, file.getName()));
			}
		}		
	}
	
	/**
	 * In the given glosslist (assuming 1 per doc)
	 * 1) collect all glossentries that are referenced from outside the current glosslist
	 * 2) collect all glossentries that are referenced from the entries in 1
	 */
	private Document process(Document doc) {
		
		Nodes linkends = doc.getRootElement().query("//db:*[@linkend]", con);				
		Nodes glosslists = doc.getRootElement().query("//db:glosslist", con);
				
		if(glosslists.size()>1) throw new IllegalArgumentException("only one glosslist per doc");
		if(glosslists.size()==0) return doc;
		
		Element glosslist = (Element) glosslists.get(0);	
		
		//1) collect all glossentries that are referenced from outside the current glosslist		
		List<Element> usedGlossEntries = new LinkedList<Element>();				
		Elements allGlossentries = glosslist.getChildElements("glossentry", dbns);
		
		for (int k = 0; k < allGlossentries.size(); k++) {
			Element glossentry = allGlossentries.get(k);
			String id = glossentry.getAttributeValue("id", xmlns);
			if(referencedFromOutside(id, linkends, glosslist )) {	
				if(!contains(usedGlossEntries,glossentry)) {
					//System.out.println("adding step1");
					usedGlossEntries.add(glossentry);
				}
			}
		}
		
		
		//2: go through usedEntries nested linkends, and add any referenced glossEntries 		
		// recursively until list stops growing						
		while (true) {			
			List<Element> moreUsedGlossEntries = recurse2(glosslist, allGlossentries, usedGlossEntries);
			if(moreUsedGlossEntries.size() == 0) {
				break;
			}
			for(Element more : moreUsedGlossEntries) {
				if(!contains(usedGlossEntries,more)) {
					usedGlossEntries.add(more);
				}
			}			
		}		
				
		//finally, remove any unused glossentries
		for (int k = 0; k < allGlossentries.size(); k++) {
			Element glossentry = allGlossentries.get(k);
			if(!contains(usedGlossEntries, glossentry)) {
				glossentry.getParent().removeChild(glossentry);
			}			
		}	
		
		return doc;
	}


	private List<Element> recurse2(Element glosslist, Elements allGlossentries, List<Element> usedGlossEntries) {
		List<Element> newUsedGlossEntries = new LinkedList<Element>();
		for(Element usedEntry : usedGlossEntries) {
			Nodes linkends = usedEntry.query(".//db:*[@linkend]", con);
			for (int i = 0; i < linkends.size(); i++) {
				Element referer = (Element)linkends.get(i);
				String ref = referer.getAttributeValue("linkend");
				Element referredTo = getGlossEntryByID(ref, allGlossentries);
				if(referredTo!=null && !contains(usedGlossEntries, referredTo)) {
					newUsedGlossEntries.add(referredTo);
				}				
			}
		}
		return newUsedGlossEntries;
	}


	private Element getGlossEntryByID(String id, Elements allGlossentries) {
		for (int i = 0; i < allGlossentries.size(); i++) {
			Element entry = (Element) allGlossentries.get(i);
			String eid = entry.getAttributeValue("id", xmlns);
			if(id.equals(eid)) {
				return entry;
			}
		}
		return null;
	}

	private boolean contains(List<Element> usedGlossEntries, Element entry) {
		String id = entry.getAttributeValue("id", xmlns);
		for(Element used : usedGlossEntries) {
			String usid = used.getAttributeValue("id", xmlns);
			if(id.equals(usid)) return true;
		}
		return false;
	}


	/**
	 * True if a linkend has the value of id and carrier is not descendant of glosslist
	 * @param id
	 * @param linkends 
	 * @param glosslist 
	 * @return
	 */
	private boolean referencedFromOutside(String id, Nodes linkends, Element glosslist) {
		
		for (int i = 0; i < linkends.size(); i++) {
			Element linkend= (Element) linkends.get(i);
			String ref = linkend.getAttributeValue("linkend");
			if(id.equals(ref)) {
				if(getAncestor(linkend, "glosslist", dbns) == null) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Retrieve the nearest ancestor element that has the given name,
	 * or null if no such ancestor exists.
	 */
	public Element getAncestor(Element element, String localName, String namespaceURI) {
		ParentNode parent = element.getParent();
		if(parent!=null && parent instanceof Element) {			
			Element eparent = (Element)parent;
			if(eparent.getLocalName().equals(localName)
					&& eparent.getNamespaceURI().equals(namespaceURI)){
				return eparent;
			}
			return getAncestor(eparent, localName, namespaceURI);
		}	
		return null;
	}

	public static void serialize(Document grammar, File output) throws Exception {
		  output.getParentFile().mkdirs();	 
		  FileOutputStream fos = new FileOutputStream(output);
		  Serializer serializer = new Serializer(fos, "utf-8");		  		  
	      serializer.write(grammar);  
	      fos.close();
	}

	/**
	 * 
	 * @param args 0: input dir, 1: output dir
	 * @throws IOException 
	 */
	public static void main(String[] args) throws Exception {
		
		new GlosslistHandler(args[0], args[1]);
		System.out.println("done");

	}

}
