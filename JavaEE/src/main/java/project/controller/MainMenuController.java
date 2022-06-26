package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/2 15:07
 */
@Controller
@RequestMapping("/main")
public class MainMenuController {
    /**
     * 跳转到主页面
     * @param model
     * @return
     */
    @RequestMapping("/tomain")
    public String list(Model model) {
        //设定具体跳转的页面
        return "MainMenu/main";
    }

    /**
     * 跳转到主要的信息页面
     * @param model
     * @return
     */
    @RequestMapping("/tochange")
    public String tochange(Model model) {
        //设定具体跳转的页面
        return "Goods/goods_modal";
    }

    /**
     * 回到登录页面
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin()
    {
        System.out.println("用户信息修改");

        return "redirect:http://localhost:8080/login.jsp";
    }
}
