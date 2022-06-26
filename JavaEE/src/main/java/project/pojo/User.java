package project.pojo;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/3u_account1 17:07
 */
public class User {
    private int u_id;
    private String u_account;
    private String u_sex;
    private String u_idcard;
    private String u_psd;
    private int u_type;
    private String u_address;
    private String u_phone;
    public User() {
    }

    public User(int u_id, String u_account, String u_sex, String u_idcard, String u_psd, int u_type, String u_address, String u_phone) {
        this.u_id = u_id;
        this.u_account = u_account;
        this.u_sex = u_sex;
        this.u_idcard = u_idcard;
        this.u_psd = u_psd;
        this.u_type = u_type;
        this.u_address = u_address;
        this.u_phone = u_phone;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_account() {
        return u_account;
    }

    public void setU_account(String u_account) {
        this.u_account = u_account;
    }

    public String getU_sex() {
        return u_sex;
    }

    public void setU_sex(String u_sex) {
        this.u_sex = u_sex;
    }

    public String getU_idcard() {
        return u_idcard;
    }

    public void setU_idcard(String u_idcard) {
        this.u_idcard = u_idcard;
    }

    public String getU_psd() {
        return u_psd;
    }

    public void setU_psd(String u_psd) {
        this.u_psd = u_psd;
    }

    public int getU_type() {
        return u_type;
    }

    public void setU_type(int u_type) {
        this.u_type = u_type;
    }

    public String getU_address() {
        return u_address;
    }

    public void setU_address(String u_address) {
        this.u_address = u_address;
    }

    public String getU_phone() {
        return u_phone;
    }

    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + u_id +
                ", 账号='" + u_account + '\'' +
                ", 性别='" + u_sex + '\'' +
                ", 身份证号码='" + u_idcard + '\'' +
                ", 密码='" + u_psd + '\'' +
                ", 权限等级='" + u_type + '\'' +
                ", 地址信息='" + u_address + '\'' +
                ", 电话号码='" + u_phone + '\'' +
                '}';
    }
}
