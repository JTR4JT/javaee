package project.pojo;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:14
 */
public class Goods_type {
//    g_ type _id,g_ type _name
    private int g_type_id;
    private String g_type_name;

    public Goods_type() {
    }

    public Goods_type(int g_type_id, String g_type_name) {
        this.g_type_id = g_type_id;
        this.g_type_name = g_type_name;
    }

    public int getG_type_id() {
        return g_type_id;
    }

    public void setG_type_id(int g_type_id) {
        this.g_type_id = g_type_id;
    }

    public String getG_type_name() {
        return g_type_name;
    }

    public void setG_type_name(String g_type_name) {
        this.g_type_name = g_type_name;
    }

    @Override
    public String toString() {
        return "Good_type{" +
                "g_type_id=" + g_type_id +
                ", g_type_name='" + g_type_name + '\'' +
                '}';
    }
}
