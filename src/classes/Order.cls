@RestResource(urlMapping='/Order/*')
global with sharing  class Order {
    global Order(){                
    }
    
@HttpGet
    global static Tickets__c getTicket()
    {
    RestRequest rep = RestContext.request;
    String TicketsID = rep.requestURI.substring(
                       rep.requestURI.lastIndexOf('/')+1);
    Tickets__c result = [SELECT Id,Name,Sort_order__c FROM Tickets__c ];
    return result;
     }
@HttpPost
    global static String createTickets(Double Sort_order)
    {
    Tickets__c t = new Tickets__c(Sort_order__c = Sort_order);
    update t;
    return t.Id;
    }    
}