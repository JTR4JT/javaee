package project.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.pojo.Goods_type;
import project.service.GoodsTypeService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/8 12:01
 */
@Controller
@RequestMapping("/goods_type")
public class GoodsTypeController {
    @Autowired
    @Qualifier("GoodsTypeServiceImpl")
    private GoodsTypeService goodsTypeService;

    /**
     * 查询所有的商品类型
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/selectAllGoodsTypeMsg")
    public String selectAllGoodsTypeMsg(@RequestParam(value = "pn", defaultValue = "1")Integer pn, Model model)
    {
        //pn 当前页码， 6：一页显示几条数据
        PageHelper.startPage(pn,6);
        List<Goods_type> goods_types = goodsTypeService.selectAllGoodsType();
        //下面可以显示的页数
        PageInfo<Goods_type> goods_typePageInfo = new PageInfo<Goods_type>(goods_types,6);

        System.out.println("商品类型全部");
//         model.addAttribute("goods_types",goods_types);
         model.addAttribute("goods_typePageInfo",goods_typePageInfo);
        return "GoodsType/goodsTypeMsg";
    }

    /**
     * 通过类型名进行模糊查询，成功后返回到类型信息显示页面
     * @param pn
     * @param model
     * @param g_type_name
     * @return
     */
    @RequestMapping("/selectGoodsTypeByFuzzy")
    public String selectGoodsTypeByFuzzy(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Model model,String g_type_name)
    {
        PageHelper.startPage(pn,6);
        List<Goods_type> goods_types = goodsTypeService.selectGoodsTypeByFuzzy(g_type_name);
        PageInfo<Goods_type> goods_typePageInfo = new PageInfo<Goods_type>(goods_types,6);
        System.out.println("模糊查询 商品类型");
        model.addAttribute("goods_typePageInfo",goods_typePageInfo);
        return "GoodsType/goodsTypeMsg";
    }

    /**
     * 通过id删除信息，ids为全选商品的信息,提供单独的通过id删除和一键删除所选的全部商品
     * @param model
     * @param ids
     * @return
     */
    @RequestMapping("/deleteGoodsType")
    public String deleteGoodsTypeBy(Model model,String ids)
    {
        List<Integer> list = new ArrayList<Integer>();
        if (ids.contains("-"))
        {
            System.out.println("删除勾选的商品类型");
            String[] split = ids.split("-");
            for (int i =0;i<split.length;i++) {
                list.add(Integer.parseInt(split[i]));
            }
            //多选删除

            goodsTypeService.deleteGoodsTypeByList(list);

        }else {
        //单个删除
            int id = Integer.parseInt(ids);
            goodsTypeService.deleteGoodsTypeById(id);
        }

        return "redirect:/goods_type/selectAllGoodsTypeMsg";
    }

    /**
     * 跳转到商品类型详细信息页面
     * @return
     */
    @RequestMapping("toTypeModal")
    public String toTypeModal()
    {
        return "GoodsType/goods_type_modal";
    }

    /**
     * 添加商品类型
     * @param goods_type
     * @return
     */
    @RequestMapping("addGoods_type")
    public String addGoodsType(Goods_type goods_type,Model model)
    {
        List<Goods_type> goods_types = goodsTypeService.selectAllGoodsType();
        String errorMsg = null;
        if(goods_type.getG_type_name().trim().equals(""))
        {
            errorMsg = "商品类型名称为空!!";
            model.addAttribute("errorMsg",errorMsg);
            return "fail";
        }
        for (Goods_type g:goods_types
             ) {
            if(g.getG_type_name().equals(goods_type.getG_type_name())){
                errorMsg = "已经有改品牌的合约了";
                model.addAttribute("errorMsg",errorMsg);
                return "fail";
            }
        }
        int i = goodsTypeService.addGoodType(goods_type);
        if(i>0){
            return "redirect:/goods_type/selectAllGoodsTypeMsg";
        }
        else
        {
            errorMsg = "加入失败了，请重新尝试一下";
            model.addAttribute("errorMsg",errorMsg);
            return "fail";
        }
    }

    /**
     * 通过id查询商品类型信息，方便显示到修改页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("toUpdateGoodsType")
    public String toUpdateGoodsType(Model model, int id)
    {
        Goods_type goods_type = goodsTypeService.selectGoodsType(id);
        model.addAttribute("goods_typebyid",goods_type);
        return "GoodsType/goods_type_updatemodal";
    }

    /**
     *  修改商品类型信息
     * @param goods_type
     * @return
     */
    @RequestMapping("updateGoods_type")
    public String updateGoodsType(Goods_type goods_type ,Model model)
    {
        String Msg = null;
        List<Goods_type> goods_types = goodsTypeService.selectAllGoodsType();
        if(goods_type.getG_type_name().trim().equals(""))
        {
            Msg = "输入的商品类型信息不能为空！！";
            model.addAttribute("errorMsg",Msg);
            return "fail";
        }
        for (Goods_type g:goods_types
             ) {
            if(g.getG_type_name().equals(goods_type.getG_type_name()))
            {
                Msg = "不是和该品牌 <"+goods_type.getG_type_name()+">有合约吗?";
                model.addAttribute("errorMsg",Msg);
                return "fail";
            }
        }
        goodsTypeService.updateGoodsType(goods_type);
        return "redirect:/goods_type/selectAllGoodsTypeMsg";
    }


}
