public class myController {

    public string select1{get; set;}
    public string select2{get; set;}

    public List<SelectOption> getItems()
    {
        List<SelectOption> option = new List<SelectOption>(); 
            option.add(new SelectOption('op1','Option 1'));
            option.add(new SelectOption('op2','Option 2'));
            option.add(new SelectOption('op3','Option 3'));
        return option;
    }
 
    public List<SelectOption> getItems2()
    {
        List<SelectOption> option = new List<SelectOption>();
        if( select1 == 'op3')
            {
                option.add(new SelectOption('op3_1','Option 3.1'));
                option.add(new SelectOption('op3_2','Option 3.2'));
                option.add(new SelectOption('op3_3','Option 3.3'));
            }
        return option;
    }
 
}