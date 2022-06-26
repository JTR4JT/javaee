package project.service;

import project.dao.GoodsTypeMapper;
import project.pojo.Goods_type;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/8 11:14
 */
public class GoodsTypeServiceImpl implements GoodsTypeService{

    private GoodsTypeMapper goodsTypeMapper;

    public void setGoodsTypeMapper(GoodsTypeMapper goodsTypeMapper) {
        this.goodsTypeMapper = goodsTypeMapper;
    }

    @Override
    public int addGoodType(Goods_type goods_type) {
        return goodsTypeMapper.addGoodType(goods_type);
    }

    @Override
    public int deleteGoodsTypeById(int id) {
        return goodsTypeMapper.deleteGoodsTypeById(id);
    }

    @Override
    public int deleteGoodsTypeByList(List<Integer> list) {
        return goodsTypeMapper.deleteGoodsTypeByList(list);
    }

    @Override
    public int updateGoodsType(Goods_type goods_type) {
        return goodsTypeMapper.updateGoodsType(goods_type);
    }

    @Override
    public Goods_type selectGoodsType(int id) {
        return goodsTypeMapper.selectGoodsType(id);
    }

    @Override
    public List<Goods_type> selectGoodsTypeByFuzzy(String g_type_name) {
        return goodsTypeMapper.selectGoodsTypeByFuzzy(g_type_name);
    }

    @Override
    public List<Goods_type> selectAllGoodsType() {
        return goodsTypeMapper.selectAllGoodsType();
    }

}
