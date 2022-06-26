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
import project.pojo.Apply;
import project.service.ApplyService;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/6 23:50
 */
@Controller
@RequestMapping("/apply")
public class ApplyController {
    @Autowired
    @Qualifier("ApplyServiceImpl")
    private ApplyService applyService;

    /**
     * 跳转到权限申请页面
     * @return
     */
    @RequestMapping("/powerRequestMsg")
    public String powerRequestMsg()
    {
        System.out.println("访问申请");
        return "powerRequest";
    }

    /**
     * 权限的申请
     * @param apply
     * @return
     */
    @RequestMapping("/addApply")
    public String addApply(Apply apply)
    {
        applyService.addApply(apply);
        return "redirect:";
    }

    @RequestMapping("/apply1")
    public String ApplyFind1(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model, Integer u_id){
        List<Apply> list= applyService.findU_id(u_id.intValue());
        PageHelper.startPage(pn,6);
        PageInfo<Apply> applyPageInfo = new PageInfo<Apply>(list,6);
        model.addAttribute("applyPageInfo",applyPageInfo);
        return "/user/usertype";
    }
    //查询未处理
    @RequestMapping("/Find_state")
    public String Find_state(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model){
        List<Apply> list= applyService.find_state();
        PageHelper.startPage(pn,6);
        PageInfo<Apply> applyPageInfo = new PageInfo<Apply>(list,6);
        model.addAttribute("applyPageInfo",applyPageInfo);
        return "/user/usertype";
    }
    //查询已处理
    @RequestMapping("/Findfi_state")
    public String Findfi_state(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model){
        PageHelper.startPage(pn,6);
        List<Apply> list= applyService.findfi_state();
        PageInfo<Apply> applyPageInfo = new PageInfo<Apply>(list,6);
        model.addAttribute("applyPageInfo",applyPageInfo);
        return "/user/usertype";
    }
    @RequestMapping("/Detype")
    public String ApplyDe(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model,int u_id){
        applyService.updatede_state(u_id);
        PageHelper.startPage(pn,6);
        List<Apply> list= applyService.findAll();
        PageInfo<Apply> applyPageInfo = new PageInfo<Apply>(list,6);
        model.addAttribute("applyPageInfo",applyPageInfo);
        return "/user/usertype";
    }
    @RequestMapping("/powerapply")
    @ResponseBody
    public void userpower(Integer u_id,Integer u_type) {
        applyService.updateuser_type(u_id,u_type);
        applyService.updateag_state(u_id);
    }
    @RequestMapping("/findtypeById")
    @ResponseBody
    public List<Apply> findtypeById(Integer u_id){
        List<Apply> list =  applyService.findU_id(u_id.intValue());
        return list;
    }
    @RequestMapping(value = "/SearchApply",method = RequestMethod.POST)
    public String usersearch(@RequestParam(value = "pn", defaultValue = "1")Integer pn, HttpSession session2, Model model , @RequestParam String sellist1, String hiden) throws UnsupportedEncodingException {
//        String sellist =new String(sellist1.getBytes("iso-8859-1"),"UTF-8");
        List<Apply> list = null;
//        System.out.println(sellist1+" "+hiden);
        PageHelper.startPage(pn,6);
        if(hiden.equals("")!=true&&hiden!=null){
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        if(pattern.matcher(hiden).matches()){
            switch (sellist1){
                case "按用户id查询":list =applyService.findU_id(Integer.parseInt(hiden)); break;
                case "按用户申请权限等级查询":list =applyService.findap_power(Integer.parseInt(hiden));break;
            }PageInfo<Apply> applyPageInfo = new PageInfo<Apply>(list,6);
            model.addAttribute("applyPageInfo",applyPageInfo);
        }else{
            String message = "";
            message = "抱歉，可能输入的数据格式不对！";
            session2.setAttribute("mes1",message);}
        }else{
            String message = "";
            message = "抱歉，输入不能为空！";
            session2.setAttribute("mes1",message);}
        return "/user/usertype";
    }
    @RequestMapping("/selectAllApplyMsg")
    public String selectAllUserTypeMsg(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model)
    {
        //pn 当前页码， 6：一页显示几条数据
        PageHelper.startPage(pn,6);
        List<Apply> list = applyService.findAll();
        //下面可以显示的页数
        PageInfo<Apply> applyPageInfo = new PageInfo<Apply>(list,6);
        model.addAttribute("applyPageInfo",applyPageInfo);
        return "/user/usertype";
    }
}
