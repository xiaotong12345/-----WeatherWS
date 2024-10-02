package example;

import example.client.CalTaxServiceLocator;
import example.client.CalTax_PortType;

import javax.jws.WebService;

@WebService
public class Test {
    public static void main(String[] argv) {
        try {
            CalTaxServiceLocator locator = new CalTaxServiceLocator();
            CalTax_PortType service = locator.getCalTax();
            String str="20000";
            System.out.println(str+"元，个人所得税为："+service.calTax(str));
//            Endpoint.publish("http://localhost:8080/test",new Test());
        } catch (javax.xml.rpc.ServiceException ex) {
            ex.printStackTrace();
        } catch (java.rmi.RemoteException ex) {
            ex.printStackTrace();
        }
    }
}