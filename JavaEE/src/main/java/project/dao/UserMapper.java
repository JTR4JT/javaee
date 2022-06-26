package project.dao;

import org.apache.ibatis.annotations.Param;
import project.pojo.User;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:34
 */
public interface UserMapper {
    //查询所有用户
    List<User> queryAllUser();
    //注册用户
    int addUser(User user);
    //用于登录
    int login(User user);
    //修改用户信息
    int updateUser(User user);
    //通过id查询用户信息的查询
    public List<User> findU_id(int u_id);
    //通过账户查询用户信息的查询
    public User findU_account(String u_account);
    //通过账户查询所有用户信息的查询
    public List<User> findU_Allaccount(String u_account);
    //通过身份证查询用户信息的查询
    public List<User> findU_idcard(String u_idcard);
    //通过性别查询用户信息的查询
    public List<User> findU_sex(String u_sex);
    //通过权限查询用户信息的查询
    public List<User> findU_type(int u_type);
    //查询所有用户
    public List<User> findAllU();
    //通过申请者id删除用户账户
    public void DeU_id(int u_id);
    //删除所有用户
    public void DeAllU();
    //修改用户信息
    public void Updatetuser(User user);
    //权限修改
    public void Updatetpower(@Param("u_type")int u_type, @Param("u_id") int u_id);
}
