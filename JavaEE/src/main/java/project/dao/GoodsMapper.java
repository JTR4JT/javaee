package project.dao;

import org.apache.ibatis.annotations.Param;
import project.pojo.Goods;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/2 15:30
 */
public interface GoodsMapper {
    //查询所有商品
    List<Goods> queryAllGoods();

    //通过id查找商品
    Goods findGoodsById(@Param("g_id") int id);

    //添加商品
    int addGoods(Goods goods);

    //通过id删除信息
    int deleteGoodsById(@Param("g_id") int id);

    //修改信息
    int updateGoods(Goods goods);

    //通过商品名模糊查询
    List<Goods> selectGoodsFuzzyByName(@Param("g_name") String name);

    //通过商品价格查询
    List<Goods> selectGoodsFuzzyByPrice(@Param("g_price") double g_price);

    //通过类型名查询
    List<Goods> selectGoodsFuzzyByType(@Param("g_type_name") String g_type_name);

    //通过商品剩余量查询
    List<Goods> selectGoodsFuzzyByamt(@Param("g_amt") int g_amt);
}
