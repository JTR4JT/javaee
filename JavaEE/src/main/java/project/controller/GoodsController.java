package project.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import project.pojo.Goods;
import project.pojo.Goods_type;
import project.service.GoodsService;
import project.service.GoodsTypeService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/2 15:40
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    @Qualifier("GoodsServiceImpl")
    private GoodsService goodsService;
    @Autowired
    @Qualifier("GoodsTypeServiceImpl")
    private GoodsTypeService goodsTypeService;
    /**
     * 查询商品信息，返回的是首页
     * @param model
     * @return
     */
    @RequestMapping("/selectNewgoods")
    public String list(Model model) {
        List<Goods> list_goodsall = goodsService.queryAllGoods();
        model.addAttribute("list_goodsall", list_goodsall);
        System.out.println("访问到全部商品");
        //设定具体跳转的页面
        return "Goods/goods_new";
    }


    /**
     * 查询全部商品信息，返回到商品管理界面
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/selectGoods")
    public String selectGoods(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model) {
        PageHelper.startPage(pn,10);
        List<Goods> list_goodsall = goodsService.queryAllGoods();
        PageInfo<Goods> goodsPageInfo = new PageInfo<Goods>(list_goodsall, 6);
//        model.addAttribute("list_goodsall", list_goodsall);
        model.addAttribute("goodsPageInfo", goodsPageInfo);
        List<Goods_type> goods_types = goodsTypeService.selectAllGoodsType();
        model.addAttribute("goods_types",goods_types);
        System.out.println("访问到全部商品");
        //设定具体跳转的页面
        return "Goods/goods";
    }

    /**
     * 通过id查询商品，方便ajax获取数据
     * @param id
     * @return
     */
    @RequestMapping("/findById")
    @ResponseBody
    public List<Goods> findById(int id)
    {
        List<Goods> list = new ArrayList<Goods>();
        Goods goods = goodsService.findGoodsById(id);
        list.add(goods);
        return list;
    }

    /**
     * 增加商品，成功返回1，失败返回0
     * @param goods
     * @return
     */
    @RequestMapping("/addGoods")
    @ResponseBody
    public int addGoods(Goods goods)
    {
        System.out.println("访问到增加商品");
        System.out.println(goods.getG_type_name());
        String temp = goods.getG_type_name();
        int i = goodsService.addGoods(goods);
        if (i>0)
        {
            System.out.println("插入成功");
            return 1;
        }
        else {
            System.out.println("插入失败");
            return 0;
        }
    }

    /**
     * 通过id删除商品，成功则返回商品页面，失败返回失败页面
     * @param id
     * @return
     */
    @RequestMapping("/deleteGoodsById")
    public String deleteGoodsById(int id)
    {
        int result = goodsService.deleteGoodsById(id);
        System.out.println("删除商品信息操作");
        if(result>0)
        return "redirect:/goods/selectGoods";
        else {
            System.out.println("商品之前已经被删除");
            return "fail";
        }
    }

    /**
     * 修改商品信息
     * @param goods
     * @return
     */
    @RequestMapping("/updateGoods")
    public String updateGoods(Goods goods)
    {
        int result = goodsService.updateGoods(goods);
        System.out.println("修改商品信息操作");
        if(result>0)
        return "redirect:/goods/selectGoods";
        else {
            System.out.println("商品修改失败");
            return "fail";
        }
    }

    /**
     * 各种方式的删除，返回到信息显示页面
     * @param pn 显示的页码
     * @param model
     * @param type 按早什么查询(按照id查询、按商品名称查询、查询斗鱼输入价格的商品、按照库存查询、按照商品类型查询)
     * @param msg 输入框的信息
     * @return
     */
    @RequestMapping("selectGoodsByEach")
    public String selectGoodsByEach(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model,String type,String msg)
    {
        List<Goods> list = new ArrayList<Goods>();
        System.out.println("按类型查询");
        System.out.println("类型："+type+" 信息"+msg);
        switch (type){
            case "按商品名称":{
                list = goodsService.selectGoodsFuzzyByName(msg);
            }
                break;
            case "按商品ID": {
                try {
                    int id = Integer.parseInt(msg);
                    Goods goods = goodsService.findGoodsById(id);
                    list.add(goods);
                }catch (Exception e)
                {
                    String errorMsg = "你确定输入的id信息("+msg+")是正确的吗?";
                    model.addAttribute("errorMsg",errorMsg);
                    return "fail";
                }


            }
                break;
            case "按商品单价":{
                try {
                    Double g_price = Double.parseDouble(msg);
                    list = goodsService.selectGoodsFuzzyByPrice(g_price);
                }catch (Exception e)
                {
                    String errorMsg = "你确定输入的价格信息("+msg+")是正确的吗?";
                    model.addAttribute("errorMsg",errorMsg);
                    return "fail";
                }

            }
                break;
            case "按商品类型名":{
                list = goodsService.selectGoodsFuzzyByType(msg);
            }
                break;
            case "按商品可销售量":{
                try {
                    int g_amt = Integer.parseInt(msg);
                    list = goodsService.selectGoodsFuzzyByamt(g_amt);
                }catch (Exception e)
                {
                    String errorMsg = "你确定输入的销售量信息("+msg+")是正确的吗?";
                    model.addAttribute("errorMsg",errorMsg);
                    return "fail";
                }
            }
                break;


        }
        PageHelper.startPage(pn,10);
        PageInfo<Goods> goodsPageInfo = new PageInfo<Goods>(list, 6);
//        model.addAttribute("list_goodsall", list_goodsall);
        model.addAttribute("goodsPageInfo", goodsPageInfo);
        List<Goods_type> goods_types = goodsTypeService.selectAllGoodsType();
        model.addAttribute("goods_types",goods_types);
        model.addAttribute("list_goodsall", list);
        return "Goods/goods";
    }


}
