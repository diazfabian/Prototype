@RestResource(urlMapping='/TheController/*')
global with sharing  class TheController
{    
@HttpGet
    global static list <Tickets__c> getTicketByID()
    {
       Id backId = ApexPages.CurrentPage().getParameters().get('id');
    RestRequest rep = RestContext.request;
    List <Tickets__c> result = [SELECT Id,Name,Sort_order__c FROM Tickets__c Where Backlog__c=:backId];
    return result;
    }
@HttpPost
    global static List <Tickets__c> createTickets(List<Tickets__c> Sort_order)
    {
     List <Tickets__c> updatearray= new list<Tickets__c>();
       for(Tickets__c t:Sort_order)
        { 
            Tickets__c tick = new Tickets__c(); 
            tick.Sort_order__c = t.Sort_order__c;
            updatearray.add(tick);
        }
    System.debug('Estoy entrando al metodo');
    update updatearray;
    return updatearray;
    }    
}