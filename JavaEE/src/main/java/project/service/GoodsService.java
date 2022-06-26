package project.service;

import project.pojo.Goods;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/2 15:31
 */
public interface GoodsService {
    List<Goods> queryAllGoods();
    Goods findGoodsById(int id);
    int addGoods(Goods goods);
    int deleteGoodsById(int id);
    int updateGoods(Goods goods);
    List<Goods> selectGoodsFuzzyByName(String name);
    List<Goods> selectGoodsFuzzyByPrice(double g_price);
    List<Goods> selectGoodsFuzzyByType(String g_type_name);
    List<Goods> selectGoodsFuzzyByamt(int g_amt);
}
