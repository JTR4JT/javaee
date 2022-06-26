package project.pojo;

import java.sql.Date;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:20
 */
public class Goods_trade {
//    goods_trade(g_trade_id, g_trade_amt, g_trade_type, g_trade_ date,u_id,g_id)
    private int g_trade_id;
    private int g_trade_amt;
    private String g_trade_type;
    private Date g_trade_date;
    private int u_id;
    private int g_id;

    public Goods_trade() {
    }

    public Goods_trade(int g_trade_id, int g_trade_amt, String g_trade_type, Date g_trade_date, int u_id, int g_id) {
        this.g_trade_id = g_trade_id;
        this.g_trade_amt = g_trade_amt;
        this.g_trade_type = g_trade_type;
        this.g_trade_date = g_trade_date;
        this.u_id = u_id;
        this.g_id = g_id;
    }

    public int getG_trade_id() {
        return g_trade_id;
    }

    public void setG_trade_id(int g_trade_id) {
        this.g_trade_id = g_trade_id;
    }

    public int getG_trade_amt() {
        return g_trade_amt;
    }

    public void setG_trade_amt(int g_trade_amt) {
        this.g_trade_amt = g_trade_amt;
    }

    public String getG_trade_type() {
        return g_trade_type;
    }

    public void setG_trade_type(String g_trade_type) {
        this.g_trade_type = g_trade_type;
    }

    public Date getG_trade_date() {
        return g_trade_date;
    }

    public void setG_trade_date(Date g_trade_date) {
        this.g_trade_date = g_trade_date;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    @Override
    public String toString() {
        return "Goods_trade{" +
                "g_trade_id=" + g_trade_id +
                ", g_trade_amt=" + g_trade_amt +
                ", g_trade_type='" + g_trade_type + '\'' +
                ", g_trade_date=" + g_trade_date +
                ", u_id=" + u_id +
                ", g_id=" + g_id +
                '}';
    }
}
