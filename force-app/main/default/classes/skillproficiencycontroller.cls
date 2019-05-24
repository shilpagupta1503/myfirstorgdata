public class skillproficiencycontroller {

    public class SkillWrapper {
        // holds the sobject from the query
        public Contact theSkillRecord { get; set; }

        // stores the selection from the radio button
        public String proficiencyLevel { get; set; }
    }

    public List<SkillWrapper> skillWrappers { get; set; }

    public skillproficiencycontroller() {

        // new up the list for the wrappers
        skillWrappers = new List<SkillWrapper>();

        // query for the skills and wrap each one in an
        // instance of the wrapper class to be used in the page
        for (Contact skill : [SELECT Id, firstName FROM Contact]) {
            SkillWrapper sWrapper = new SkillWrapper();
            sWrapper.theSkillRecord = skill;
            sWrapper.proficiencyLevel = ''; // a default selection (blank)
        }
    }

    public List <SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption> ();
        options.add(new SelectOption('Basic Knowledge', 'Basic Knowledge'));
        options.add(new SelectOption('Intermediate', 'Intermediate'));
        options.add(new SelectOption('Advanced', 'Advanced'));
        return options;
    }

    public void Save() {

        List<Account> skilldetailslist = new List<Account>();

        // loop our wrappers and get the data out of the sObject and the selected value
        for (SkillWrapper sWrapper: skillWrappers) {

            // only do the work if a value was selected
            if (sWrapper.proficiencyLevel != '') {
                Account sd = new Account();
                sd.Name = sWrapper.theSkillRecord.Id;
                
                skilldetailslist.add(sd);    
            }

        }
        insert skilldetailslist;
    }
}