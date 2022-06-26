package project.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import project.pojo.User;
import project.service.ApplyService;
import project.service.UserService;
import project.tool.DesEncrypt;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/1 0:31
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("ApplyServiceImpl")
    private ApplyService applyService;

    /**
     * 显示用户的全部信息
     * @param model
     * @return
     */
    @RequestMapping("/allUser")
    public String list(Model model) {
        List<User> list = userService.queryAllUser();
        model.addAttribute("list_user", list);
        System.out.println("访问到 UserAllController!");
        //设定具体跳转的页面
        return "allUser";
    }

    /**
     * 添加用户，注册
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    public String addUser(User user,Model model) throws Exception {
        List<User> list = userService.queryAllUser();
        for (User u: list) {
            if(u.getU_idcard().equals(user.getU_idcard())||u.getU_account().equals(user.getU_account()))
            {   //返回信息为身份证不能反复注册或者账号已经被注册
                String errorMsg = "返回信息为身份证不能反复注册或者账号已经被注册";
                model.addAttribute("errorMsg",errorMsg);
                return "fail";
            }

        }
        DesEncrypt desEncrypt = new DesEncrypt();
        user.setU_psd(desEncrypt.desRncript(user.getU_psd()));
//        System.out.println(user);
        userService.addUser(user);
        return "success";
    }

    /***
     * 用户登录
     * @param user
     * @return
     */
    @RequestMapping("/userLogin")
    public String userLogin(HttpSession session, User user,Model model) throws Exception {
        List<User> list = userService.queryAllUser();
        DesEncrypt desEncrypt = new DesEncrypt();
        for (User u: list) {
            String psd = desEncrypt.desDecript(u.getU_psd());
            if(u.getU_account().equals(user.getU_account())&&psd.equals(user.getU_psd()))
            {   //跳转到主页面
                u.setU_psd(psd);
                session.setAttribute("USER_SESSION",u);

                return "redirect:/main/tomain";
            }

        }
        String errorMsg = "账号或密码错误";
        model.addAttribute("errorMsg",errorMsg);
        return "fail";
    }

    /***
     * 个人中心
     * @param
     * @return
     */
    @RequestMapping("/userPersonalMsg")
    public String personalMsg()
    {
        System.out.println("访问到信息修改页面");
        return "personalMsg";
    }

    /***
     * 修改个人信息
     * @param
     * @return
     */
    @RequestMapping("/updateMsg")
    public String updateMsg(User user,Model model) throws Exception
    {
        System.out.println("用户信息修改");
//        System.out.println(user);
        String errorMsg = null;
        System.out.println(user.getU_idcard().equals(""));
        if(user.getU_account().equals("")||user.getU_idcard().equals("")||user.getU_psd().equals("")||user.getU_address().equals("")||user.getU_address().equals("")){
            errorMsg = "是不是有信息没有填写？"+user.toString();
            model.addAttribute("errorMsg",errorMsg);
            return "fail";
        }
       String regex = "^([1-6][1-9]|50)\\d{4}(18|19|20)\\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";//判断身份证格式
        if(!user.getU_idcard().matches(regex))
        {
          errorMsg = "你的身份证信息不满足格式要求";
            model.addAttribute("errorMsg",errorMsg);
            return "fail";

        }
        String regex2 = "^[^0-9][a-zA-Z0-9*_]{0,9}$";//判断首位是不是字母
        if(!user.getU_account().matches(regex2))
        {
            errorMsg = "你的   账号  "+user.getU_account()+"信息不满足格式要求";
            model.addAttribute("errorMsg",errorMsg);
            return "fail";
        }
        if(user.getU_psd().length()<6||user.getU_psd().length()>16)
        {
            errorMsg = "你的密码信息不满足格式要求";
            model.addAttribute("errorMsg",errorMsg);
            return "fail";
        }
        String regex3 = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";//判断电话号码
        if(!user.getU_phone().matches(regex3))
        {
            errorMsg = "你的电话信息  "+user.getU_phone()+"  不满足格式要求";
            model.addAttribute("errorMsg",errorMsg);
            return "fail";
        }
        DesEncrypt desEncrypt = new DesEncrypt();
        user.setU_psd(desEncrypt.desRncript(user.getU_psd()));
        userService.updateUser(user);
        return "redirect:/main/toLogin";
    }

    //通过id查询个人信息，返回list到"/user/user"
    @RequestMapping("/finduserById1")
    public String userfind1(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model, Integer u_id){
        PageHelper.startPage(pn,6);
        List<User> list = userService.findU_id(u_id.intValue());
        PageInfo<User> userPageInfo = new PageInfo<User>(list,6);
        model.addAttribute("userPageInfo",userPageInfo);
        return "/user/user";
    }

    //通过id查询个人信息，返回list时@ResponseBody将数据转换未]为ajax类型
    @RequestMapping("/finduserById")
    @ResponseBody
    public List<User> userfindbyid(Integer u_id) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        List<User> list = userService.findU_id(u_id);
        DesEncrypt desEncrypt = new DesEncrypt();
        for (User u:list
        ) {
            u.setU_psd(desEncrypt.desDecript(u.getU_psd()));
        }
        System.out.println(u_id);
        return list;
    }

    @RequestMapping("/powerUser")
    @ResponseBody
    public void userpower(Integer u_id,Integer u_type,Integer User_type) {
        System.out.println(User_type);
        if(User_type == 4 && u_type<4) {
            userService.Updatetpower(u_type.intValue(), u_id.intValue());
        }
        if(User_type == 5){
            userService.Updatetpower(u_type.intValue(), u_id.intValue());
        }
    }
    @RequestMapping("/updateUser")
    @ResponseBody
    public void userupdate(@RequestParam String u_idcard
            ,@RequestParam String u_account,@RequestParam String u_psd
            ,@RequestParam String u_address,@RequestParam String u_phone
            ,@RequestParam Integer u_id,@RequestParam Integer u_type) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        User user = new User();
        DesEncrypt desEncrypt = new DesEncrypt();
        user.setU_idcard(u_idcard);
        user.setU_account(u_account);
        user.setU_psd(desEncrypt.desRncript(u_psd));
        user.setU_address(u_address);
        user.setU_phone(u_phone);
        user.setU_type(u_type.intValue());
        user.setU_id(u_id.intValue());
        userService.Updatetuser(user);
    }
    @RequestMapping(value = "/SearchUser",method = RequestMethod.POST)
    public String usersearch(@RequestParam(value = "pn", defaultValue = "1")Integer pn,HttpSession session1,Model model , @RequestParam String sellist1, String hiden) throws UnsupportedEncodingException {
//        String sellist =new String(sellist1.getBytes("iso-8859-1"),"UTF-8");
        List<User> list = null;
        PageHelper.startPage(pn,6);
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        if(hiden.equals("")!=true&&hiden!=null){
        switch (sellist1){
            case "按用户身份证":list =userService.findU_idcard(hiden); PageInfo<User> userPageInfo = new PageInfo<User>(list,6);
                model.addAttribute("userPageInfo",userPageInfo); break;
            case "按用户ID":
                if(pattern.matcher(hiden).matches()){
                    list =userService.findU_id(Integer.parseInt(hiden)); PageInfo<User> userPageInfo1 = new PageInfo<User>(list,6);
                    model.addAttribute("userPageInfo",userPageInfo1);
                }else{
                    String message = "";
                    message = "抱歉，可能输入的数据格式不对！";
                    session1.setAttribute("mes",message);}
                break;
            case "按用户性别":list =userService.findU_sex(hiden); PageInfo<User> userPageInfo2 = new PageInfo<User>(list,6);
                model.addAttribute("userPageInfo",userPageInfo2);break;
            case "按用户账号":list =userService.findU_Allaccount(hiden); PageInfo<User> userPageInfo3 = new PageInfo<User>(list,6);
                model.addAttribute("userPageInfo",userPageInfo3);break;
            case "按用户权限":
                if(pattern.matcher(hiden).matches()){
                    list =userService.findU_type(Integer.parseInt(hiden)); PageInfo<User> userPageInfo4 = new PageInfo<User>(list,6);
                    model.addAttribute("userPageInfo",userPageInfo4);
                }else{
                    String message = "";
                    message = "抱歉，可能输入的数据格式不对！";
                    session1.setAttribute("mes",message);}
                break;
        }}else{
            String message = "";
            message = "抱歉，输入不能为空！";
            session1.setAttribute("mes",message);}
        return "/user/user";
    }
    @RequestMapping("/DeUser")
    public String userDelete(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model, Integer u_id){
        userService.DeU_id(u_id);
        //在清理用户的同时，清理该用户相关的权限申请信息
        applyService.Debyu_id(u_id);
        PageHelper.startPage(pn,6);
        List<User> list = userService.findAllU();
        PageInfo<User> userPageInfo = new PageInfo<User>(list,6);
        model.addAttribute("userPageInfo",userPageInfo);
        return "/user/user";
    }
    @RequestMapping("/selectAllUserMsg")
    public String selectAllUserTypeMsg(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException, NoSuchPaddingException {
        //pn 当前页码， 6：一页显示几条数据
        PageHelper.startPage(pn,6);
        List<User> list = userService.findAllU();
        //下面可以显示的页数
        PageInfo<User> userPageInfo = new PageInfo<User>(list,6);
        model.addAttribute("userPageInfo",userPageInfo);
        return "/user/user";
    }

}
