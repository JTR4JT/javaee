package project.pojo;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:16
 */
public class Goods {
//    g_id, g_name, g_price, g_ type _name,g_amt
    private int g_id;
    private String g_name;
    private double g_price;
    private String g_type_name;
    private int g_amt;

    public Goods() {
    }

    public Goods(int g_id, String g_name, int g_price, String g_type_name, int g_amt) {
        this.g_id = g_id;
        this.g_name = g_name;
        this.g_price = g_price;
        this.g_type_name = g_type_name;
        this.g_amt = g_amt;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public String getG_name() {
        return g_name;
    }

    public void setG_name(String g_name) {
        this.g_name = g_name;
    }

    public double getG_price() {
        return g_price;
    }

    public void setG_price(double g_price) {
        this.g_price = g_price;
    }

    public String getG_type_name() {
        return g_type_name;
    }

    public void setG_type_name(String g_type_name) {
        this.g_type_name = g_type_name;
    }

    public int getG_amt() {
        return g_amt;
    }

    public void setG_amt(int g_amt) {
        this.g_amt = g_amt;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "g_id=" + g_id +
                ", g_name='" + g_name + '\'' +
                ", g_price=" + g_price +
                ", g_type_name='" + g_type_name + '\'' +
                ", g_amt=" + g_amt +
                '}';
    }
}
