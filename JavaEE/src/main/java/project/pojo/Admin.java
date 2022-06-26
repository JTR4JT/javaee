package project.pojo;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:22
 */
public class Admin {
//    admin(ad_id,ad_account,ad_password)
    private int ad_id;
    private String ad_account;
    private String ad_password;

    public Admin() {
    }

    public Admin(int ad_id, String ad_account, String ad_password) {
        this.ad_id = ad_id;
        this.ad_account = ad_account;
        this.ad_password = ad_password;
    }

    public int getAd_id() {
        return ad_id;
    }

    public void setAd_id(int ad_id) {
        this.ad_id = ad_id;
    }

    public String getAd_account() {
        return ad_account;
    }

    public void setAd_account(String ad_account) {
        this.ad_account = ad_account;
    }

    public String getAd_password() {
        return ad_password;
    }

    public void setAd_password(String ad_password) {
        this.ad_password = ad_password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "ad_id=" + ad_id +
                ", ad_account='" + ad_account + '\'' +
                ", ad_password='" + ad_password + '\'' +
                '}';
    }
}
