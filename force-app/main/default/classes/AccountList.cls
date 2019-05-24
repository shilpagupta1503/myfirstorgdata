public class AccountList {
    public List<Account> accounts {
        get;
        private set;
    }
    
    public AccountList() {
        this.accounts = [
            select Name
            from Account
        ];
    }
}