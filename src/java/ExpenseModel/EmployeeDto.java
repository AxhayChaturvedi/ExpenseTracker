package ExpenseModel;

public class EmployeeDto {
  private int id;
  private String eName;
  private String eContact;
  private String eEmail; 

    public EmployeeDto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EmployeeDto(int id,String eName, String eContact, String eEmail) {
        this.id=id;
        this.eName = eName;
        this.eContact = eContact;
        this.eEmail = eEmail;
    }

    EmployeeDto(String eName, String eContact, String eEmail) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String geteName() {
        return eName;
    }

    public String geteContact() {
        return eContact;
    }

    public String geteEmail() {
        return eEmail;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public void seteContact(String eContact) {
        this.eContact = eContact;
    }

    public void seteEmail(String eEmail) {
        this.eEmail = eEmail;
    }
  
  
}