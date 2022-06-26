package project.dao;

import org.apache.ibatis.annotations.Param;
import project.pojo.Goods_type;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/8 11:00
 */
public interface GoodsTypeMapper {
    //增加商品类型
    int addGoodType(Goods_type goods_type);
    //通过id删除商品类型
    int deleteGoodsTypeById(@Param("g_type_id") int id);
    //一次性删除多个
    int deleteGoodsTypeByList(List<Integer> list);
    //更新商品类型
    int updateGoodsType(Goods_type goods_type);
    //通过id查询商品类型信息
    Goods_type selectGoodsType(@Param("g_type_id")int id);
    //通过id查询商品类型
    List<Goods_type> selectGoodsTypeByFuzzy(@Param("g_type_name") String g_type_name);
    //查询全部商品类型
    List<Goods_type> selectAllGoodsType();

}
