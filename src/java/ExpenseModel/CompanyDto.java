/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExpenseModel;

public class CompanyDto {


  private int id;
  private String cName;
  private String cType;
  private String cAddress;
  private String cContact;
  private String cEmail; 


    public CompanyDto(int id, String cName, String cType, String cAddress, String cContact, String cEmail) {
        this.id = id;
        this.cName = cName;
        this.cType = cType;
        this.cAddress = cAddress;
        this.cContact = cContact;
        this.cEmail = cEmail;
    }

    public CompanyDto() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public void setcType(String cType) {
        this.cType = cType;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress;
    }

    public void setcContact(String cContact) {
        this.cContact = cContact;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
    }

    public int getId() {
        return id;
    }

    public String getcName() {
        return cName;
    }

    public String getcType() {
        return cType;
    }

    public String getcAddress() {
        return cAddress;
    }

    public String getcContact() {
        return cContact;
    }

    public String getcEmail() {
        return cEmail;
    }
 
    
}
