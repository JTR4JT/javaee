package project.service;

import project.pojo.Apply;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/6 23:45
 */
public interface ApplyService {
    int addApply(Apply apply);
    //
    public void Debyu_id(int u_id);
    //通过id拒绝申请信息
    public void updatede_state(int u_id);
    //通过申请人id查询申请信息
    public List<Apply> findU_id(int u_id);
    //查询未处理申请
    public List<Apply> find_state();
    //查询已处理申请
    public List<Apply> findfi_state();
    //通过申请者id查询申请信息
    public List<Apply> findap_power(int ap_power);
    //通过申请人id查询申请信息
    public List<Apply> findAll();
    //通过申请人id同意申请
    public void updateag_state(int u_id);
    //通过申请人id处理申请人的权限
    public void updateuser_type(int u_id,int ap_power);
    //添加申请信息
    public void insertAp(Apply apply);
}
