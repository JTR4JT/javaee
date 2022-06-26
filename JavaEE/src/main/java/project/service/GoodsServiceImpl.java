package project.service;

import project.dao.GoodsMapper;
import project.pojo.Goods;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/2 15:32
 */
public class GoodsServiceImpl implements GoodsService{
    private GoodsMapper goodsMapper;

    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Override
    public List<Goods> queryAllGoods() {
        return goodsMapper.queryAllGoods();
    }

    @Override
    public Goods findGoodsById(int id) {
        return goodsMapper.findGoodsById(id);
    }

    @Override
    public int addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    @Override
    public int deleteGoodsById(int id) {
        return goodsMapper.deleteGoodsById(id);
    }

    @Override
    public int updateGoods(Goods goods) {
        return goodsMapper.updateGoods(goods);
    }

    @Override
    public List<Goods> selectGoodsFuzzyByName(String name) {
        return goodsMapper.selectGoodsFuzzyByName(name);
    }

    @Override
    public List<Goods> selectGoodsFuzzyByPrice(double g_price) {
        return goodsMapper.selectGoodsFuzzyByPrice(g_price);
    }

    @Override
    public List<Goods> selectGoodsFuzzyByType(String g_type_name) {
        return goodsMapper.selectGoodsFuzzyByType(g_type_name);
    }

    @Override
    public List<Goods> selectGoodsFuzzyByamt(int g_amt) {
        return goodsMapper.selectGoodsFuzzyByamt(g_amt);
    }
}
