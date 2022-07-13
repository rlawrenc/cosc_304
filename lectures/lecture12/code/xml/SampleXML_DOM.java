/**
FILE: 			SampleXML_DOM.java
PROVIDES: 		This is sample code showing how to use some of the features of an XML DOM parser in Java.
PROGRAM BY:     Ramon Lawrence
CREATION DATE:  November 2006
MODIFIED:		
*/

import java.io.IOException;

import javax.xml.parsers.*;

import org.w3c.dom.Document;				
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


public class SampleXML_DOM
{
	public static void main(String[] argv) 
	{
		String fileName = "sampleDOM.xml";											// File name to parse
		boolean validate = false;													// Set to true if want to validate document using a supplied DTD	
		
		try 
		{
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();		// Ask for a parser object capable of parsing an XML document
			dbf.setValidating(validate);											// Set if parser performs validation
			dbf.setNamespaceAware(true);											// Asks the parse to support XML namespaces						
			DocumentBuilder domBuilder = dbf.newDocumentBuilder();					// DocumentBuilder is now the parser that we wanted.  It is built for us by the factory, and we can use it to parse XML documents.

			Document doc = null;													// This is the object that represents our XML document in code (once it has been parsed).
	
			doc = domBuilder.parse(fileName);										// The parser builds the document object in memory during this call. 
			System.out.println("Document successfully parsed and loaded into memory object.");
			
			// Now that we have the object in memory.  Let's traverse it.  Remember it is a tree.
			// For more information on the methods, see the Java API for the Document class.
			
			Node rootNode = doc.getDocumentElement();								// Get the root node of the document
																					// Note that the Document class itself extends Node, so you could just do this:  Node root = (Node) doc;
			// List all children nodes of the root
			// Note that the blank lines arise as the values of some nodes (level1, testSum) really contain end-of-line characters.
			System.out.println("\nTEST #1:  All element nodes directly under root node in document");
			NodeList list = rootNode.getChildNodes();
		    for(int i=0; i< list.getLength(); i++)
		    {	Node n = list.item(i);
		    	if (n.getNodeType() == Node.ELEMENT_NODE)
		    		System.out.println("Node name: "+n.getNodeName()+"  Node value: "+getValue(n));
		    }
			System.out.println("TEST #1 COMPLETED.\n");
			
			// Look for specific tags.  Search for level1C then print its value.
		    // Step #1.  Find level1 node under root node.  We will search instead of assuming a particular location.
			System.out.println("TEST #2: Find node level1C.");
		    list = rootNode.getChildNodes();
		    Node level1Node = null;
		    for(int i=0; i< list.getLength(); i++)
		    {	Node n = list.item(i);
		    	if (n.getNodeName().equals("level1"))
		    	{	level1Node = n;
		    		break;
		    	}
		    }
		    if (level1Node == null)
		    	System.out.println("Failed to find level1 node.  Stopping this test.");
		    else
		    {	// Do similar search to find level1C node.
		    	list = level1Node.getChildNodes();
			    Node level1CNode = null;
			    for(int i=0; i< list.getLength(); i++)
			    {	Node n = list.item(i);
			    	if (n.getNodeName().equals("level1C"))
			    	{	level1CNode = n;
			    		break;
			    	}
			    }
			    if (level1CNode == null)
			    	System.out.println("Failed to find level1C node.  Stopping this test.");
			    else
			    	System.out.println("Found level1C node.  Name: "+level1CNode.getNodeName()+"  Value: "+getValue(level1CNode));
		    }
		    System.out.println("TEST #2 COMPLETED.\n");
		    
			System.out.println("TEST #3: Assign string values based on known tags.");
			String string1=null, string2=null, string3=null, string4=null;
			list = rootNode.getChildNodes();
			for(int i=0; i < list.getLength(); i++)
			{	Node n = list.item(i);
				String nodeName = n.getNodeName();
			
				if (nodeName.equals("string1"))
					string1 = getValue(n);
				else if (nodeName.equals("string2"))
					string2 = getValue(n);
				else if (nodeName.equals("string3"))
					string3 = getValue(n);
				else if (nodeName.equals("string4"))
					string4 = getValue(n);
			}
			System.out.println("Retrieved these strings:");
			System.out.println("String1: "+string1);
			System.out.println("String2: "+string2);
			System.out.println("String3: "+string3);
			System.out.println("String4: "+string4);
			System.out.println("TEST #3 COMPLETED.\n");
			
			System.out.println("TEST #4: Add up all value tags under testSum element.");
			// Find testSum element.  Use a helper method.
			Node sumNode = findNode(rootNode, "testSum");
			if (sumNode == null)
		    	System.out.println("Failed to find testSum node.  Stopping this test.");
		    else
		    {		    	
				int total = 0;
				int count = 0;		
				list = sumNode.getChildNodes();
			    for(int i=0; i< list.getLength(); i++)
			    {	Node n = list.item(i);
			    	if (n.getNodeName().equals("value"))
			    	{	total = total + Integer.parseInt(getValue(n));
			    		count++;		    		
			    	}
			    }
			    System.out.println("Found "+count+" value nodes.  Total sum = "+total);
		    }
			System.out.println("TEST #4 COMPLETED.\n");
			
			System.out.println("ALL TESTS COMPLETED.");
		} 
		catch (SAXException e) 
		{	System.out.println("Error: "+e);										// Note that we get SAXException because the DocumentBuilder classes using some SAX APIs.  
			System.exit(1);															// However, we still ARE using DOM.
		}	
		catch (ParserConfigurationException e) 
		{
		      System.out.println("Parser configuration error: "+e);
		      System.exit(1);
		}
		catch (IOException e)
		{	System.out.println("I/O Error: "+e);
			System.exit(1);
		}
   }
	
	// Helper method to retrieve string value of a given Element
	public static String getValue(Node n)
	{	
		if (n==null)
			return "";
		else
		{
			Node data = n.getFirstChild();
			if(data==null)
				return "";
			else
				return data.getNodeValue();
		}
	}
	
	// Helper method to find a child node by name under a given node (non-recursive)
	public static Node findNode(Node parentNode, String nodeName)
	{	// Return null if not found.
		NodeList list = parentNode.getChildNodes();	    
	    for(int i=0; i < list.getLength(); i++)
	    {	Node n = list.item(i);
	    	if (n.getNodeName().equals(nodeName))
	    		return n;	    	
	    }
	    return null;
	}
}