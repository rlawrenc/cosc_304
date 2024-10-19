# Tests OrderDB implementation
import unittest
# Note: If using Jupyter Notebook may need to use special package to import notebooks
# pip install import_ipnyb
#import import_ipynb
import OrderDB


class TestOrderDB(unittest.TestCase):
    def setUp(self):
        self.orderDB = OrderDB.OrderDB()
        self.orderDB.con = self.orderDB.connect()
        self.orderDB.init()
        
    def tearDown(self):
        self.orderDB.close()
        
    def testListAllCustomers(self):
        """Tests listing all customers"""
        
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest List All customers.\n")
        
        result = self.orderDB.listAllCustomers()
        
        # Verify result
        answer = ("CustomerId, CustomerName"
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
                        +"\n00025, Z. Zimmerman") 
                
        print(result);
        self.assertEqual(answer, result);          
       
    
    def testListCustomerOrders(self):
        """Tests listing all orders for a customer"""
         
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest List customer orders: 00001.\n")
        
        queryResult = self.orderDB.listCustomerOrders("00001")
        
        # Verify result
        answer =("OrderId, OrderDate, CustomerId, EmployeeId, Total"
                        +"\n01001, 2023-11-08 00:00:00, 00001, E0000, 1610.59"
                        +"\n01031, 2023-11-29 00:00:00, 00001, E0006, 1.90"
                        +"\n01035, 2024-01-02 00:00:00, 00001, E0006, 1.90"
                        +"\n01039, 2024-01-06 00:00:00, 00001, E0006, 1344.97"
                        +"\n01043, 2024-01-10 00:00:00, 00001, E0006, 1099.99"
                        +"\n01047, 2024-01-14 00:00:00, 00001, E0003, 1.90"
                        +"\n01056, 2024-01-18 00:00:00, 00001, E0003, 1.00")                        
                
        print(queryResult)
        self.assertEqual(answer, queryResult)
        
        # Invalid customer id
        print("\nTest List customer orders: 0000X.\n")
        queryResult = self.orderDB.listCustomerOrders("0000X")
        
        answer ="OrderId, OrderDate, CustomerId, EmployeeId, Total"                       
                
        print(queryResult)
        self.assertEqual(answer, queryResult)
       
    def testListLineItemsForOrder(self):
        """Tests listing all line items for an order"""
    
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest List items for order: 01000.\n")
        
        cursor = self.orderDB.listLineItemsForOrder("01000")
        
        # Verify result
        answer = ("Total columns: 4"
                        +"\nOrderId, ProductId, Quantity, Price"
                        +"\n01000, P0005, 1, 3.10"
                        +"\n01000, P0008, 1, 2.50"
                        +"\n01000, P0012, 2, 1.97"
                        +"\n01000, P0014, 3, 2.01"
                        +"\nTotal results: 4")
        
        queryResult = self.orderDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
                
        # Invalid orders id
        print("\nTest List items for order: 2000X.\n")
        cursor = self.orderDB.listLineItemsForOrder("2000X")
        
        answer = ("Total columns: 4"+
                    "\nOrderId, ProductId, Quantity, Price"+
                    "\nTotal results: 0")
        
        queryResult = self.orderDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
    
    def testComputeOrderTotal(self):
        """Tests computing a total amount for an order from individual line items"""
    
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest compute order total for order: 01000.\n")
        
        cursor = self.orderDB.computeOrderTotal("01000")
        
        # Verify result
        answer = ("Total columns: 1"
                        +"\norderTotal"
                        +"\n15.57"
                        +"\nTotal results: 1")
        
        queryResult = self.orderDB.resultSetToString(cursor, 100);
        print(queryResult);
        self.assertEqual(answer, queryResult)    
                  
        # Order with incorrect total
        print("\nTest compute order total for order: 01004.\n")
        cursor = self.orderDB.computeOrderTotal("01004")
        
        answer = ("Total columns: 1"
                +"\norderTotal"
                +"\n24.95"
                +"\nTotal results: 1")
        
        queryResult = self.orderDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)              

    def testAddCustomer(self):
        """Tests add a customer"""
        
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest add customer:\n")
        
        self.orderDB.addCustomer("11111", "Fred Smith")        
        self.orderDB.addCustomer("11112", "George Jeff")
        
        # Verify result
        answer = ("CustomerId, CustomerName"
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
                        +"\n11112, George Jeff")
        
        # Verify add
        result = self.orderDB.listAllCustomers()
        print(result)
        self.assertEqual(answer, result)
        
    def testDeleteCustomer(self):
        """Tests deleting a customer"""
        
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest delete customer:\n")
                       
        self.orderDB.deleteCustomer("00001")
        
        # Verify result
        answer = ("CustomerId, CustomerName"
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
                        +"\n00025, Z. Zimmerman")
        
        # Verify add
        result = self.orderDB.listAllCustomers()
        print(result)
        self.assertEqual(answer, result)                    
    
    def testUpdateCustomer(self):
        """Tests updating a customer"""
        
        # Re-initialize database
        self.orderDB.init();
        
        print("\nTest update customer:\n")
        
        # Make sure customer table does not have added records from other tests
        cursor = self.orderDB.con.cursor()
        sql = "DELETE FROM Customer WHERE customerId = '11111' or customerId = '11112'"
        cursor.execute(sql)
        self.orderDB.con.commit()        
        
        # Add a customer then update
        self.orderDB.addCustomer("11111", "Fred Smith")
        self.orderDB.updateCustomer("11111", "Freddy Smithers")
        
        # Verify result
        answer = ("CustomerId, CustomerName"
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
                        +"\n11111, Freddy Smithers")
        
        # Verify update
        result = self.orderDB.listAllCustomers();
        self.assertEqual(answer, result);                     
        
    def testNewOrder(self):
        """Tests creating a new order"""
        
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest new order:\n")
        
        # Make sure customer table does not have added records from other tests
        cursor = self.orderDB.con.cursor()
        sql = "DELETE FROM Customer WHERE customerId = '11111' or customerId = '11112'"
        cursor.execute(sql)
        self.orderDB.con.commit() 
        
        # Add a customer
        self.orderDB.addCustomer("11111", "Fred Smith")
        
        # Add an order with a customer
        self.orderDB.newOrder("22222", "11111", "2024-10-31", "E0001")
                
        # Verify add order
        answer = ("Total columns: 5"
                        +"\nOrderId, OrderDate, CustomerId, EmployeeId, Total"
                        +"\n22222, 2024-10-31 00:00:00, 11111, E0001, None"
                        +"\nTotal results: 1")
        cursor.execute("SELECT * FROM Orders WHERE orderId = '22222'")
        result = self.orderDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)                     

    def testNewLineItems(self):
        """Tests adding line items"""
        
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest new order items:\n")
        
        # Make sure customer table does not have added records from other tests
        cursor = self.orderDB.con.cursor()
        sql = "DELETE FROM Customer WHERE customerId = '11111' or customerId = '11112'"
        cursor.execute(sql)
        cursor.execute("DELETE FROM Orders WHERE orderId = '22222'")
        self.orderDB.con.commit() 
        
        # Add a customer
        self.orderDB.addCustomer("11111", "Fred Smith")
        
        # Add an order with a customer
        self.orderDB.newOrder("22222", "11111", "2024-10-31", "E0001")
        
        # Verify add order
        answer = ("Total columns: 5"
                        +"\nOrderId, OrderDate, CustomerId, EmployeeId, Total"
                        +"\n22222, 2024-10-31 00:00:00, 11111, E0001, None"
                        +"\nTotal results: 1")
        
        cursor = self.orderDB.con.cursor()
        cursor.execute("SELECT * FROM Orders WHERE orderId = '22222'")
        result = self.orderDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)                     
        
        # Add line items
        self.orderDB.newLineItem("22222", "P0005", 5, "3.10")
        self.orderDB.newLineItem("22222", "P0007", 5, "2.25")
        self.orderDB.newLineItem("22222", "P0008", 5, "2.50")
        
        # Verify add line items
        answer = ("Total columns: 4"
                    +"\nOrderId, ProductId, Quantity, Price"
                    +"\n22222, P0005, 5, 3.10"
                    +"\n22222, P0007, 5, 2.25"
                    +"\n22222, P0008, 5, 2.50"
                    +"\nTotal results: 3")
                        
        cursor.execute("SELECT * FROM OrderedProduct WHERE orderId = '22222'")
        result = self.orderDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)                     
   
    def testUpdateOrderTotal(self):
        """Tests updating order total"""
    
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest updated order total: 01004\n")
        
        self.orderDB.updateOrderTotal("01004", "24.95")
     
        # Verify order total update       
        answer = ("Total columns: 5"
                    +"\nOrderId, OrderDate, CustomerId, EmployeeId, Total"
                    +"\n01004, 2023-11-12 00:00:00, 00002, E0002, 24.95"
                    +"\nTotal results: 1")
                       
        cursor = self.orderDB.con.cursor()
        cursor.execute("SELECT * FROM Orders WHERE orderId = '01004'")
        result = self.orderDB.resultSetToString(cursor, 10)
        self.assertEqual(answer, result)    
    
    def testQuery1(self):
        """Return the list of products that have not been in any order. Hint: Left join can be used instead of a subquery."""
         
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest query 1:\n")
        
        cursor = self.orderDB.query1()
        
        # Verify result
        answer = ("Total columns: 1"
                +"\nProductId"
                +"\nP0002"
                +"\nP0018"
                +"\nTotal results: 2")
                
        queryResult = self.orderDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
    
    def testQuery2(self):
        """Return the order ids and total amount where the order total does not equal the sum of quantity*price for all ordered products in the order."""
         
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest query 2:\n")
        
        cursor = self.orderDB.query2()
        
        # Verify result
        answer = ("Total columns: 2"
                +"\nOrderId, Total"
                +"\n01004, 14.95"
                +"\n01006, 31.25"
                +"\n01014, 12.00"
                +"\n01039, 1344.97"
                +"\nTotal results: 4")
                
        queryResult = self.orderDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
        
    def testQuery3(self):
        """Return for each customer their id, name and average total order amount for orders after January 1, 2024. Only show customers that have placed at least 2 orders. Order by customer id ASC."""
         
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest query 3:\n")
        
        cursor = self.orderDB.query3()
        
        # Verify result
        answer = ("Total columns: 3"
                        +"\nCustomerId, CustomerName, AvgTotal"
                        +"\n00001, B. Brown, 489.952000"
                        +"\n00002, C. Cole, 1.900000"
                        +"\n00003, D. Doe, 1.900000"
                        +"\n00004, E. Elliott, 338.943750"
                        +"\n00005, F. Ford, 1.000000"
                        +"\n00006, G. Grimmer, 1.000000"
                        +"\nTotal results: 6")
                
        queryResult = self.orderDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
        
    def testQuery4(self):
        """Return the employees who have had at least 2 distinct orders where some product on the order had quantity >= 5."""
         
        # Re-initialize database
        self.orderDB.init()
        
        print("\nTest query 4:\n")
        
        cursor = self.orderDB.query4()
        
        # Verify result
        answer = ("Total columns: 3"
                        +"\nEmployeeId, EmployeeName, OrderCount"
                        +"\nE0006, D. Davis, 2"
                        +"\nTotal results: 1")
                
        queryResult = self.orderDB.resultSetToString(cursor, 100)
        print(queryResult)
        self.assertEqual(answer, queryResult)
      
    
unittest.main(argv=[''], verbosity=2, exit=False)

