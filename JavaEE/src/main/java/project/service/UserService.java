package project.service;

import project.pojo.User;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/5/31 17:35
 */
public interface UserService {
    List<User> queryAllUser();
    int addUser(User user);
    int login(User user);
    int updateUser(User user);
    //查询所有用户
    public List<User> findAllU();
    //通过账户查询用户信息的查询
    public User findU_account(String u_account);
    //通过账户查询用户信息的查询
    public List<User> findU_Allaccount(String u_account);
    //通过身份证查询用户信息的查询
    public List<User> findU_idcard(String u_idcard);
    //通过性别查询用户信息的查询
    public List<User> findU_sex(String u_sex);
    //通过权限查询用户信息的查询
    public List<User> findU_type(int u_type);
    //通过用户id删除用户账户
    public void DeU_id(int u_id);
    //通过用户id查询用户信息
    public List<User> findU_id(int u_id);
    //删除所有用户
    public void DeAllU();
    //
    public void Updatetuser(User user);
    //
    public void Updatetpower(int u_type,int u_id);
}
