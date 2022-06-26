package project.dao;

import org.apache.ibatis.annotations.Param;
import project.pojo.Apply;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/6 23:41
 */
public interface ApplyMapper {
    //增加申请信息
    int addApply(Apply apply);
    //
    public void updatede_state(int u_id);
    //
    public void Debyu_id(int u_id);
    //通过申请者id查询申请信息
    public List<Apply> findU_id(int u_id);
    //查询未处理申请
    public List<Apply> find_state();
    //查询已处理申请
    public List<Apply> findfi_state();
    //通过申请者id查询申请信息
    public List<Apply> findap_power(int ap_power);
    //查询所有申请者id查询申请信息
    public List<Apply> findAll();
    //通过申请者id修改申请事件状态
    public void updateag_state(@Param("u_id")int u_id);
    //通过申请者id修改申请者权限类型
    public void updateuser_type(@Param("u_id")int u_id,@Param("ap_power")int ap_power);
    //添加申请信息
    public void insertAp(Apply apply);
}
