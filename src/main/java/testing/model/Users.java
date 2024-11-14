package testing.model;

public class Users {
    private int id;
    private String fname;
    private String pswd;
    private String email;
    private long pnumber;
    private String anumber;
    
    // Default constructor
    public Users() {}

    // Constructor with all fields
    public Users(int id, String anumber, String fname, String email, long pnumber, String pswd) {
        this.id = id;
        this.anumber = anumber;
        this.fname = fname;
        this.email = email;
        this.pnumber = pnumber;
        this.pswd = pswd;
    }

    public Users(String anumber2, String fname2, String email2, long pnumber2, String pswd2) {
		// TODO Auto-generated constructor stub
	}

    public long getPnumber() {
		return pnumber;
	}

	public void setPnumber(long pnumber) {
		this.pnumber = pnumber;
	}

	public String getAnumber() {
		return anumber;
	}

	public void setAnumber(String anumber) {
		this.anumber = anumber;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return fname;
	}
	public void setUsername(String username) {
		this.fname = username;
	}
	public String getPassword() {
		return pswd;
	}
	public void setPassword(String password) {
		this.pswd = password;
	}
    
}