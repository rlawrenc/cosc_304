import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 * Tests Order database program.
 */
public class TestOrderJDBC
{
	/**
	 * Class being tested
	 */
	private static OrderJDBC q;
	
	/**
	 * Connection to the database
	 */
	private static Connection con;
	
	
	/**
	 * Requests a connection to the database.
	 * 
	 * @throws Exception
	 * 		if an error occurs
	 */
	@BeforeClass
	public static void init() throws Exception 
	{		
		q = new OrderJDBC();
		try
		{
			con = q.connect();		
			
			// Load data and initialize the database
			q.init();
		}
		catch (Exception e)
		{
			System.out.println("Failed to initialize connection and database. Verify OrderJDBC.connect() method has your user id and password.");
			throw e;
		}
	}
	
	/**
	 * Closes connection.
	 * 
	 * @throws Exception
	 * 		if an error occurs
	 */
	@AfterClass
	public static void end() throws Exception 
	{
		q.close();        
	}
	
	/**
     * Tests listing all customers.
     */
    @Test
    public void testListAllCustomers() throws SQLException
    {   
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest List All customers.\n");
        
        String result = q.listAllCustomers();
        
        // Verify result
        String answer = "CustomerId, CustomerName"
                        +"\n00000, A. Anderson"
                        +"\n00001, B. Brown"
                        +"\n00002, C. Cole"
                        +"\n00003, D. Doe"
                        +"\n00004, E. Elliott"
                        +"\n00005, F. Ford"
                        +"\n00006, G. Grimmer"
                        +"\n00007, H. Hoover"
                        +"\n00008, I. Irving"
                        +"\n00009, J. Jordan"
                        +"\n00010, K. Kurtz"
                        +"\n00011, L. Lamb"
                        +"\n00012, M. Miller"
                        +"\n00013, N. Norris"
                        +"\n00014, O. Olsen"
                        +"\n00015, P. Pitt"
                        +"\n00016, Q. Quirrel"
                        +"\n00017, Steve Raet"
                        +"\n00018, Fred Smith"
                        +"\n00019, T. Thomas"
                        +"\n00020, U. Underwood"
                        +"\n00021, V. Voss"
                        +"\n00022, W. Williams"
                        +"\n00023, X. Xu"
                        +"\n00024, Y. Yoder"
                        +"\n00025, Z. Zimmerman";                        
                
        System.out.println(result);
        assertEquals(answer, result);          
    }
    
    /**
     * Tests listing all orders for a customer.
     */
    @Test
    public void testListCustomerOrders() throws SQLException
    {                    
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest List customer orders: 00001.\n");
        
        String queryResult = q.listCustomerOrders("00001");
        
        // Verify result
        String answer = "OrderId, OrderDate, CustomerId, EmployeeId, Total"
                        +"\n01001, 2023-11-08, 00001, E0000, 1610.59"
                        +"\n01031, 2023-11-29, 00001, E0006, 1.90"
                        +"\n01035, 2024-01-02, 00001, E0006, 1.90"
                        +"\n01039, 2024-01-06, 00001, E0006, 1344.97"
                        +"\n01043, 2024-01-10, 00001, E0006, 1099.99"
                        +"\n01047, 2024-01-14, 00001, E0003, 1.90"
                        +"\n01056, 2024-01-18, 00001, E0003, 1.00";                        
                
        System.out.println(queryResult);
        assertEquals(answer, queryResult);                 
        
        // Invalid customer id
        System.out.println("\nTest List customer orders: 0000X.\n");
        queryResult = q.listCustomerOrders("0000X");
        
        answer ="OrderId, OrderDate, CustomerId, EmployeeId, Total";                       
                
        System.out.println(queryResult);
        assertEquals(answer, queryResult);              
    }
    
    /**
     * Tests listing all line items for an order.
     */
    @Test
    public void testListLineItemsForOrder() throws SQLException
    {                 
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest List items for order: 01000.\n");
        
        ResultSet rst = q.listLineItemsForOrder("01000");
        
        // Verify result
        String answer = "Total columns: 4"
                        +"\nOrderId, ProductId, Quantity, Price"
                        +"\n01000, P0005, 1, 3.10"
                        +"\n01000, P0008, 1, 2.50"
                        +"\n01000, P0012, 2, 1.97"
                        +"\n01000, P0014, 3, 2.01"
                        +"\nTotal results: 4";                       
        
        String queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);    
        
        // Verify it is a PreparedStatement that was used
        if (!(rst.getStatement() instanceof PreparedStatement))
            fail("You must use PreparedStatements for this query.");
        
        // Invalid orders id
        System.out.println("\nTest List items for order: 2000X.\n");
        rst = q.listLineItemsForOrder("2000X");
        
        answer =  "Total columns: 4"
                +"\nOrderId, ProductId, Quantity, Price"
                +"\nTotal results: 0"; 
        
        queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);              
    }
    
    /**
     * Tests computing a total amount for an order from individual line items.
     */
    @Test
    public void testComputeOrderTotal() throws SQLException
    {             
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest compute order total for order: 01000.\n");
        
        ResultSet rst = q.computeOrderTotal("01000");
        
        // Verify result
        String answer = "Total columns: 1"
                        +"\norderTotal"
                        +"\n15.57"
                        +"\nTotal results: 1";                       
        
        String queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);    
        
        // Verify it is a PreparedStatement that was used
        if (!(rst.getStatement() instanceof PreparedStatement))
            fail("You must use PreparedStatements for this query.");
        
        // Order with incorrect total
        System.out.println("\nTest compute order total for order: 01004.\n");
        rst = q.computeOrderTotal("01004");
        
        answer = "Total columns: 1"
                +"\norderTotal"
                +"\n24.95"
                +"\nTotal results: 1";     
        
        queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);              
    }
	
    /**
     * Tests add a customer.
     */
    @Test
    public void testAddCustomer() throws SQLException
    {            
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest add customer:\n");
        
        q.addCustomer("11111", "Fred Smith");        
        q.addCustomer("11112", "George Jeff");
        
        // Verify result
        String answer = "CustomerId, CustomerName"
                        +"\n00000, A. Anderson"
                        +"\n00001, B. Brown"
                        +"\n00002, C. Cole"
                        +"\n00003, D. Doe"
                        +"\n00004, E. Elliott"
                        +"\n00005, F. Ford"
                        +"\n00006, G. Grimmer"
                        +"\n00007, H. Hoover"
                        +"\n00008, I. Irving"
                        +"\n00009, J. Jordan"
                        +"\n00010, K. Kurtz"
                        +"\n00011, L. Lamb"
                        +"\n00012, M. Miller"
                        +"\n00013, N. Norris"
                        +"\n00014, O. Olsen"
                        +"\n00015, P. Pitt"
                        +"\n00016, Q. Quirrel"
                        +"\n00017, Steve Raet"
                        +"\n00018, Fred Smith"
                        +"\n00019, T. Thomas"
                        +"\n00020, U. Underwood"
                        +"\n00021, V. Voss"
                        +"\n00022, W. Williams"
                        +"\n00023, X. Xu"
                        +"\n00024, Y. Yoder"
                        +"\n00025, Z. Zimmerman"                                                
                        +"\n11111, Fred Smith"
                        +"\n11112, George Jeff";
        
        // Verify add
        String result = q.listAllCustomers();
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests delete a customer.
     */
    @Test
    public void testDeleteCustomer() throws SQLException
    {     
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest delete customer:\n");
                       
        q.deleteCustomer("00001");
        
        // Verify result
        String answer = "CustomerId, CustomerName"
                        +"\n00000, A. Anderson"
                        +"\n00002, C. Cole"
                        +"\n00003, D. Doe"
                        +"\n00004, E. Elliott"
                        +"\n00005, F. Ford"
                        +"\n00006, G. Grimmer"
                        +"\n00007, H. Hoover"
                        +"\n00008, I. Irving"
                        +"\n00009, J. Jordan"
                        +"\n00010, K. Kurtz"
                        +"\n00011, L. Lamb"
                        +"\n00012, M. Miller"
                        +"\n00013, N. Norris"
                        +"\n00014, O. Olsen"
                        +"\n00015, P. Pitt"
                        +"\n00016, Q. Quirrel"
                        +"\n00017, Steve Raet"
                        +"\n00018, Fred Smith"
                        +"\n00019, T. Thomas"
                        +"\n00020, U. Underwood"
                        +"\n00021, V. Voss"
                        +"\n00022, W. Williams"
                        +"\n00023, X. Xu"
                        +"\n00024, Y. Yoder"
                        +"\n00025, Z. Zimmerman";                                                                     
        
        // Verify add
        String result = q.listAllCustomers();
        System.out.println(result);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests update a customer.
     */
    @Test
    public void testUpdateCustomer() throws SQLException
    {   
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest update customer:\n");
        
        // Make sure customer table does not have added records from other tests
        Statement stmt = con.createStatement();
        stmt.executeUpdate("DELETE FROM Customer WHERE customerId = '11111' or customerId = '11112'");
        
        // Add a customer then update
        q.addCustomer("11111", "Fred Smith");
        q.updateCustomer("11111", "Freddy Smithers");                
        
        // Verify result
        String answer = "CustomerId, CustomerName"
                        +"\n00000, A. Anderson"
                        +"\n00001, B. Brown"
                        +"\n00002, C. Cole"
                        +"\n00003, D. Doe"
                        +"\n00004, E. Elliott"
                        +"\n00005, F. Ford"
                        +"\n00006, G. Grimmer"
                        +"\n00007, H. Hoover"
                        +"\n00008, I. Irving"
                        +"\n00009, J. Jordan"
                        +"\n00010, K. Kurtz"
                        +"\n00011, L. Lamb"
                        +"\n00012, M. Miller"
                        +"\n00013, N. Norris"
                        +"\n00014, O. Olsen"
                        +"\n00015, P. Pitt"
                        +"\n00016, Q. Quirrel"
                        +"\n00017, Steve Raet"
                        +"\n00018, Fred Smith"
                        +"\n00019, T. Thomas"
                        +"\n00020, U. Underwood"
                        +"\n00021, V. Voss"
                        +"\n00022, W. Williams"
                        +"\n00023, X. Xu"
                        +"\n00024, Y. Yoder"
                        +"\n00025, Z. Zimmerman"                        
                        +"\n11111, Freddy Smithers";                        
        
        // Verify update
        String result = q.listAllCustomers();
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests adding a new order.
     */
    @Test
    public void testNewOrder() throws SQLException
    { 
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest new order:\n");
        
        // Make sure customer table does not have added records from other tests
        Statement stmt = con.createStatement();
        stmt.executeUpdate("DELETE FROM Customer WHERE customerId = '11111' or customerId = '11112'");
        
        // Add a customer
        q.addCustomer("11111", "Fred Smith");
        
        // Add an order with a customer
        q.newOrder("22222", "11111", "2023-10-31", "E0001");
                
        // Verify add order
        String answer = "Total columns: 5"
                        +"\nOrderId, OrderDate, CustomerId, EmployeeId, Total"
                        // +"\n22222, 2023-10-31 00:00:00.0, 11111, E0001, null"
                        +"\n22222, 2023-10-31T00:00, 11111, E0001, null"
                        +"\nTotal results: 1";
        ResultSet rst = stmt.executeQuery("SELECT * FROM Orders WHERE orderId = '22222'");
        String result = OrderJDBC.resultSetToString(rst, 10);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests adding order line items.
     */
    @Test
    public void testNewLineItems() throws SQLException
    { 
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest new order items:\n");
        
        // Make sure customer table does not have added records from other tests
        Statement stmt = con.createStatement();
        stmt.executeUpdate("DELETE FROM Customer WHERE customerId = '11111' or customerId = '11112'");
        stmt.executeUpdate("DELETE FROM Orders WHERE orderId = '22222'");
        
        // Add a customer
        q.addCustomer("11111", "Fred Smith");
        
        // Add an order with a customer
        q.newOrder("22222", "11111", "2024-10-31", "E0001");
        
        // Verify add order
        String answer = "Total columns: 5"
                        +"\nOrderId, OrderDate, CustomerId, EmployeeId, Total"
                        +"\n22222, 2024-10-31T00:00, 11111, E0001, null"
                        // +"\n22222, 2024-10-31 00:00:00.0, 11111, E0001, null"
                        +"\nTotal results: 1";
        ResultSet rst = stmt.executeQuery("SELECT * FROM Orders WHERE orderId = '22222'");
        String result = OrderJDBC.resultSetToString(rst, 10);
        assertEquals(answer, result);                     
        
        // Add line items
        q.newLineItem("22222", "P0005", 5, "3.10");
        q.newLineItem("22222", "P0007", 5, "2.25");
        q.newLineItem("22222", "P0008", 5, "2.50");
        
        // Verify add line items
        answer = "Total columns: 4"
                    +"\nOrderId, ProductId, Quantity, Price"
                    +"\n22222, P0005, 5, 3.10"
                    +"\n22222, P0007, 5, 2.25"
                    +"\n22222, P0008, 5, 2.50"
                    +"\nTotal results: 3";
                        
        rst = stmt.executeQuery("SELECT * FROM OrderedProduct WHERE orderId = '22222'");
        result = OrderJDBC.resultSetToString(rst, 10);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests updating order total.
     */
    @Test
    public void testUpdateOrderTotal() throws SQLException
    { 
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest updated order total: 01004\n");
        
        q.updateOrderTotal("01004", new BigDecimal("24.95"));
     
        // Verify order total update       
        String answer = "Total columns: 5"
                    +"\nOrderId, OrderDate, CustomerId, EmployeeId, Total"
                    // +"\n01004, 2023-11-12 00:00:00.0, 00002, E0002, 24.95"
                    +"\n01004, 2023-11-12T00:00, 00002, E0002, 24.95"
                    +"\nTotal results: 1";                    
                  
        Statement stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery("SELECT * FROM Orders WHERE orderId = '01004'");
        String result = OrderJDBC.resultSetToString(rst, 10);
        assertEquals(answer, result);                     
    }
    
    /**
     * Tests first query:
     * Return the list of products that have not been in any order. Hint: Left join can be used instead of a subquery.
     */
    @Test
    public void testQuery1() throws SQLException
    {             
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest query 1:\n");
        
        ResultSet rst = q.query1();
        
        // Verify result
        String answer = "Total columns: 1"
                +"\nProductId"
                +"\nP0002"
                +"\nP0018"
                +"\nTotal results: 2";
                
        String queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Tests second query:
     * Return the order ids and total amount where the order total does not equal the sum of quantity*price for all ordered products in the order.
     */
    @Test
    public void testQuery2() throws SQLException
    {   
        // Re-initialize all data
        q.init();
        
        System.out.println("\nTest query 2:\n");
                      
        ResultSet rst = q.query2();
        
        // Verify result
        String answer = "Total columns: 2"
                +"\nOrderId, Total"
                +"\n01004, 14.95"
                +"\n01006, 31.25"
                +"\n01014, 12.00"
                +"\n01039, 1344.97"
                +"\nTotal results: 4";
        String queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Tests third query:
     * Return for each customer their id, name and average total order amount for orders starting on January 1, 2024 (inclusive). Only show customers that have placed at least 2 orders.
     * Sort customers in ascending order by customer id.
     */
    @Test
    public void testQuery3() throws SQLException
    {              
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest query 3:\n");
        
        ResultSet rst = q.query3();
        
        // Verify result
        String answer = "Total columns: 3"
                        +"\nCustomerId, CustomerName, avgTotal"
                        +"\n00001, B. Brown, 489.952000"
                        +"\n00002, C. Cole, 1.900000"
                        +"\n00003, D. Doe, 1.900000"
                        +"\n00004, E. Elliott, 338.943750"
                        +"\n00005, F. Ford, 1.000000"
                        +"\n00006, G. Grimmer, 1.000000"
                        +"\nTotal results: 6";
        String queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Tests fourth query:
     * Return the employees who have had at least 2 distinct orders where some product on the order had quantity >= 5.
     */
    @Test
    public void testQuery4() throws SQLException
    {             
        // Re-initialize database
        q.init();
        
        System.out.println("\nTest query 4:\n");
        
        ResultSet rst = q.query4();
        
        // Verify result
        String answer = "Total columns: 3"
                        +"\nEmployeeId, EmployeeName, orderCount"
                        +"\nE0006, D. Davis, 2"
                        +"\nTotal results: 1";
        String queryResult = OrderJDBC.resultSetToString(rst, 100);
        System.out.println(queryResult);
        assertEquals(answer, queryResult);          
    }
    
    /**
     * Runs an SQL query and compares answer to expected answer.  
     * 
     * @param sql
     * 		SQL query
     * @param answer
     * 		expected answer          
     */
    public static void runSQLQuery(String sql, String answer)
    {    	 
         try
         {
        	Statement stmt = con.createStatement();
 	    	ResultSet rst = stmt.executeQuery(sql);	    	
 	    	
 	    	String st = OrderJDBC.resultSetToString(rst, 1000);
 	    	System.out.println(st);	    			
 	    		
 	    	assertEquals(answer, st);	           	             
            
 	    	stmt.close();
         }            
         catch (SQLException e)
         {	
        	 System.out.println(e);
        	 fail("Incorrect exception: "+e);
         }              
    }
}
