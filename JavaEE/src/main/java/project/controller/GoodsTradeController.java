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
import project.pojo.Goods_trade;
import project.service.GoodsTradeService;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/15 14:48
 */
@Controller
@RequestMapping("/goods_trade")
public class GoodsTradeController {
    @Autowired
    @Qualifier("GoodsTradeServiceImpl")
    private GoodsTradeService goodsTradeService;

    /**
     * 出库，入库信息的增加记录
     * @param goods_trade
     * @return
     */
    @RequestMapping("/addGoodsTrade")
    public String addGoodsTrade(Goods_trade goods_trade)
    {
//        System.out.println(id);
        if(goods_trade.getG_trade_type().equals("出库"))
            goods_trade.setG_trade_amt(-goods_trade.getG_trade_amt());
        System.out.println("插入订单");
        System.out.println(goods_trade.getG_trade_amt()+"  "+goods_trade.getU_id());
        goodsTradeService.addGoodsTradeMsg(goods_trade);
        return "successAddGoodsTrade";
    }

    @RequestMapping("/goods_trade1")
    public String FindAllG_Trade1(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model, Integer u_id){
        List<Goods_trade> list = goodsTradeService.findByu_id(u_id);
        PageHelper.startPage(pn,6);
        PageInfo<Goods_trade> G_tPageInfo = new PageInfo<Goods_trade>(list,6);
        model.addAttribute("G_tPageInfo",G_tPageInfo);
        return "/GoodsTrade/goods_trade";
    }
    @RequestMapping(value = "/SearchGoods",method = RequestMethod.POST)
    public String usersearch(@RequestParam(value = "pn", defaultValue = "1")Integer pn, HttpSession session3, Model model , @RequestParam String sellist2, String hiden) throws UnsupportedEncodingException {
//        String sellist =new String(sellist2.getBytes("iso-8859-1"),"UTF-8");
        List<Goods_trade> list = null;
        if(hiden.equals("")!=true&&hiden!=null){
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        if(pattern.matcher(hiden).matches()&& hiden.equals("")!=true){
            switch (sellist2){
                case "按货物id查询":list = goodsTradeService.findG_id(Integer.parseInt(hiden));break;
                case "按用户id查询":list = goodsTradeService.findByu_id(Integer.parseInt(hiden));break;
                case "按交易单id查询":list = goodsTradeService.findG_t_id(Integer.parseInt(hiden));break;
            }
            PageHelper.startPage(pn,6);
            PageInfo<Goods_trade> G_tPageInfo = new PageInfo<Goods_trade>(list,6);
            model.addAttribute("G_tPageInfo",G_tPageInfo);
        }else{
            String message = "";
            message = "抱歉，可能输入的数据格式不对！";
            session3.setAttribute("mes2",message);}
        }else{
            String message = "";
            message = "抱歉，输入不能为空！";
            session3.setAttribute("mes2",message);}

        return "/GoodsTrade/goods_trade";
    }
    @RequestMapping("/Find_in")
    public String Find_state(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model){
        List<Goods_trade> list= goodsTradeService.find_in();
        PageHelper.startPage(pn,6);
        PageInfo<Goods_trade> G_tPageInfo = new PageInfo<Goods_trade>(list,6);
        model.addAttribute("G_tPageInfo",G_tPageInfo);
        return "/GoodsTrade/goods_trade";
    }
    @RequestMapping("/Findfi_out")
    public String Findfi_state(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model){
        List<Goods_trade> list = goodsTradeService.find_out();
        PageHelper.startPage(pn,6);
        PageInfo<Goods_trade> G_tPageInfo = new PageInfo<Goods_trade>(list,6);
        model.addAttribute("G_tPageInfo",G_tPageInfo);
        return "/GoodsTrade/goods_trade";
    }
    @RequestMapping("/selectAllGoods_tradeMsg")
    public String selectAllUserTypeMsg(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model)
    {
        //pn 当前页码， 6：一页显示几条数据
        PageHelper.startPage(pn,6);
        List<Goods_trade> list = goodsTradeService.findAllG_t();
        System.out.println(list.get(0).getG_trade_date());
        //下面可以显示的页数
        PageInfo<Goods_trade> G_tPageInfo = new PageInfo<Goods_trade>(list,6);
        model.addAttribute("G_tPageInfo",G_tPageInfo);
        return "/GoodsTrade/goods_trade";
    }
    @RequestMapping("/DeGoods_trade")
    public String userDelete(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model,@RequestParam Integer g_trade_id){
        goodsTradeService.DeG_t_id(g_trade_id);
        PageHelper.startPage(pn,6);
        List<Goods_trade> list = goodsTradeService.findAllG_t();
        PageInfo<Goods_trade> userPageInfo = new PageInfo<Goods_trade>(list,6);
        model.addAttribute("G_tPageInfo",userPageInfo);
        return "/GoodsTrade/goods_trade";
    }
}
