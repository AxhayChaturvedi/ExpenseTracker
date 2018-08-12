package ExpenseModel;
public class Category {
  private int id;
  private int cId;
  private String cName;

    public Category(int id, int cId, String cName) {
        this.id = id;
        this.cId = cId;
        this.cName = cName;
    }

    public Category(int id, String cName) {
        this.id = id;
        this.cName = cName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }
  
}
