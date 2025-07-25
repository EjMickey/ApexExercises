public class ContactCreator {
    /*
    1. Create a static method within this class. Name it "createContacts"
        - input parameters: numberOfContacts, contactName, accountName
        - the method should create an amount of Contacts specified by the numberOfContacts parameter
        - the Contacts should be related to an Account that has a Name equal to the accountName parameter value. For the relation use standard field
        - the Contacts' names should consist of contactName + order number. For example, if contactName equals "Doe" and the numberOfContacts is 3, the Contacts' names would be Doe1, Doe2, Doe3 (or Doe0, Doe1, Doe2, depending how You start counting)
        - save the Contacts in the database
        2. Create a static method called "deleteContact"
        - input parameters: contactId
        - the method should delete a Contact that has Id equal to contactId
        - implement error handling - if contact with the Id doesn't exist return 'No contact found' string. If it exists, delete it and return 'Success' string
        - try to catch specific error type instead of generic Exception
        3. Create a static method called "getNumberOfContacts"
        - input parameters: accountName
        - return a number of contacts associated with the Account that has Name equal to accountName
        4. Create a static method called "getContactByLastName"
        - input parameters: lastName
        - query for contacts with a LastName equal to the value of lastName. The fields to retrieve: accountId, first and last name, email and phone number
        - return a Set of found contact Ids
         */
    //1
    public static void createContacts(Integer numberOfContacts, String contactName, String accountName) {
        if(numberOfContacts<=0){
            throw new IllegalArgumentException('numberOfContacts must be greater than 0');
        }
        List<Account> accList = [SELECT Name FROM Account WHERE Name =: accountName LIMIT 1];
        if(accList.isEmpty()){
            throw new IllegalArgumentException('passed accountName='+accountName+' not found');
        }
        List<Contact> contactsToInsert = new List<Contact>();
        for(Integer i=0; i<numberOfContacts; i++){
            Contact c = new Contact();
            c.LastName=contactName+i;
            c.AccountId = accList[0].Id;
            contactsToInsert.add(c);
        }
        try{
            insert contactsToInsert;
        }
        catch(DmlException e){
            System.debug(e.getMessage());
        }
    }
    
    //2
    public static String deleteContact(Id contactId)
    {
        List<Contact> contactToDelete = [SELECT Id FROM Contact WHERE Id =: contactId];
        if(contactToDelete.isEmpty()){
            return 'No contact found';
        }
        try{
            delete contactToDelete[0];
            return 'Success';
        }
        catch(DmlException e){
            System.debug(e.getMessage());
            return 'Delete failed: ' + e.getMessage();
        }
    }

    //3
    public static Integer getNumberOfContacts(String accountName){
        List<Account> accList = [SELECT Id FROM Account WHERE Name =: accountName LIMIT 1];
        if(accList.isEmpty()){
            throw new IllegalArgumentException('passed accountName='+accountName+' not found');
        }
        Integer numberOfContacts = [SELECT COUNT() FROM Contact WHERE AccountId =: accList[0].Id];
        return numberOfContacts;
    }

    //4
    public static Set<Id> getContactByLastName(String lastName) {
        Set<Id> contactIds = new Set<Id>();
        List<Contact> contacts = [SELECT Id, AccountId, FirstName, LastName, Email, Phone FROM Contact WHERE LastName = :lastName];
        for(Contact c : contacts) {
            contactIds.add(c.Id);
        }
        return contactIds;
    }
}