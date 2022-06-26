package project.pojo;

import java.sql.Date;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:24
 */
public class Apply {
//    apply(ap_id,u_id,ap_power,ap_date,ap_state)
    private int ap_id;
    private int u_id;
    private int ap_power;
    private Date ap_date;
    private String ap_state;

    public Apply() {
    }



    public int getAp_id() {
        return ap_id;
    }

    public void setAp_id(int ap_id) {
        this.ap_id = ap_id;
    }

    public int getAp_power() {
        return ap_power;
    }

    public void setAp_power(int ap_power) {
        this.ap_power = ap_power;
    }

    public Date getAp_date() {
        return ap_date;
    }

    public void setAp_date(Date ap_date) {
        this.ap_date = ap_date;
    }

    public String getAp_state() {
        return ap_state;
    }

    public void setAp_state(String ap_state) {
        this.ap_state = ap_state;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public Apply(int ap_id, int u_id, int ap_power, Date ap_date, String ap_state) {
        this.ap_id = ap_id;
        this.u_id = u_id;
        this.ap_power = ap_power;
        this.ap_date = ap_date;
        this.ap_state = ap_state;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "ap_id=" + ap_id +
                ", u_id=" + u_id +
                ", ap_power=" + ap_power +
                ", ap_date=" + ap_date +
                ", ap_state='" + ap_state + '\'' +
                '}';
    }
}
