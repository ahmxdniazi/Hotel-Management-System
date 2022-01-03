/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hotelmanagementsystem;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Laiba
 */
public class DBManager {
    private static  Connection con=null;
    
  private DBManager()
  {
  }
  
  public static Connection  getDbManger()
  {
      if(con==null)
      {
          try 
          {
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelsystem1","root","");

          }
          catch (Exception e) 
          {
              con=null;
          }
      }
      return con;
  }
}
