public class AccountHandler {
    public static void insertAccount(Integer account_quantity){
        if(account_quantity <= 0){
            throw new IllegalArgumentException('Account quantity must be greater than zero.');
        }
        List<Account> addAccounts = new List<Account>();
        Integer n = 0;
        while(n < account_quantity){
            Account newAccount = new Account();
            newAccount.Name = 'Acme Inc ' + n;
            newAccount.AccountNumber = 'A000' + n;
            addAccounts.add(newAccount);
            n++;
        }
        try {
            insert addAccounts;
        } catch (DmlException e) {
            System.debug('Error inserting accounts: ' + e.getMessage());
            throw new DmlException('Failed to insert accounts: ' + e.getMessage());
        }
        System.debug('Successfully inserted ' + addAccounts.size() + ' accounts.');
    }
}