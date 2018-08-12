package ExpenseModel;


/**
 *
 * @author manikka
 */
public class AdminDto {
   
    private String a_id;
    private String a_name;
    private String email_id;
    private String password;
    private String contact_no;

    public AdminDto() {
    }

    public AdminDto(String a_id, String a_name, String email_id, String password, String contact_no) {
        this.a_id = a_id;
        this.a_name = a_name;
        this.email_id = email_id;
        this.password = password;
        this.contact_no = contact_no;
    }

    public String getA_id() {
        return a_id;
    }

    public void setA_id(String a_id) {
        this.a_id = a_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact_no() {
        return contact_no;
    }

    public void setContact_no(String contact_no) {
        this.contact_no = contact_no;
    }

    @Override
    public String toString() {
        return "AdminDto{" + "a_id=" + a_id + ", a_name=" + a_name + ", email_id=" + email_id + ", password=" + password + ", contact_no=" + contact_no + '}';
    }
    
    
    
}