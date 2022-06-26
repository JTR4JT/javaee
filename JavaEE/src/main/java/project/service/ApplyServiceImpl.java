package project.service;

import project.dao.ApplyMapper;
import project.pojo.Apply;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/6 23:45
 */
public class ApplyServiceImpl implements ApplyService {
    private ApplyMapper applyMapper;

    public void setApplyMapper(ApplyMapper applyMapper) {
        this.applyMapper = applyMapper;
    }

    @Override
    public int addApply(Apply apply) {
        return applyMapper.addApply(apply);
    }
    @Override
    public void Debyu_id(int u_id) { applyMapper.Debyu_id(u_id); }

    public void updatede_state(int u_id){applyMapper.updatede_state(u_id);}
    //实现通过申请人id查询申请信息的方法
    public List<Apply> findU_id(int u_id) {
        return applyMapper.findU_id(u_id);
    }

    //查询未处理申请
    public List<Apply> find_state() { return applyMapper.find_state(); }

    //查询已处理申请
    public List<Apply> findfi_state() { return applyMapper.findfi_state(); }

    //按申请权限等级查询
    public List<Apply> findap_power(int ap_power) { return applyMapper.findap_power(ap_power); }

    //查询所有申请事件
    public List<Apply> findAll() { return applyMapper.findAll(); }
    //实现通过申请人id处理申请信息的方法
    public void updateag_state(int u_id) { applyMapper.updateag_state(u_id); }
    //实现通过申请人id处理申请人的权限的方法
    public void updateuser_type(int u_id,int ap_power) { applyMapper.updateuser_type(u_id,ap_power); }
    //添加申请信息
    public void insertAp(Apply apply){
        applyMapper.insertAp(apply);
    }
}
