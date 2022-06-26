package project.service;

import project.dao.GoodsTradeMapper;
import project.pojo.Goods_trade;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/15 8:44
 */
public class GoodsTradeServiceImpl implements GoodsTradeService{
    private GoodsTradeMapper goodsTradeMapper;

    public void setGoodsTradeMapper(GoodsTradeMapper goodsTradeMapper) {
        this.goodsTradeMapper = goodsTradeMapper;
    }

    @Override
    public int addGoodsTradeMsg(Goods_trade goods_trade) {
        return goodsTradeMapper.addGoodsTradeMsg(goods_trade);
    }

    public List<Goods_trade> findAllG_t() {
        return goodsTradeMapper.findAllG_t();
    }

    public List<Goods_trade> findG_t_id(int g_trade_id) {
        return goodsTradeMapper.findG_t_id(g_trade_id);
    }

    public List<Goods_trade> findByu_id(int u_id) { return goodsTradeMapper.findByu_id(u_id); }

    public List<Goods_trade> find_out() {
        return goodsTradeMapper.find_out();
    }

    public List<Goods_trade> find_in() {
        return goodsTradeMapper.find_in();
    }

    public List<Goods_trade> findG_id(int g_id) {
        return goodsTradeMapper.findG_id(g_id);
    }

        public void DeG_t_id(int g_trade_id) {
        goodsTradeMapper.DeG_t_id(g_trade_id);
    }
}
