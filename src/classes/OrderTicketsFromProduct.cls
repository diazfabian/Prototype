public class OrderTicketsFromProduct {
    public Backlog__c back;
    public OrderTicketsFromProduct(ApexPages.StandardSetController controller) {
    back = (Backlog__c ) controller.getRecord();
    }

   public List<Tickets__c> getBacklog (){
       List <Tickets__c> tick =[SELECT Id,Name FROM Tickets__c]; 
       return  tick;       
   }
    
    public void updateSortOrder() {
        String str = ApexPages.CurrentPage().getParameters().get('strSerialVal');
        system.debug('Serialized String = ' + str);
    }
    
    public PageReference processProjectTaskListBacklogUpdates() {
        
        return null;
    }
}