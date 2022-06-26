package project.service;

import project.pojo.Goods_trade;

import java.util.List;

/**
 * @author BXO
 * @version 1.0
 * @description: TODO
 * @date 2022/6/15 8:43
 */
public interface GoodsTradeService {
    int addGoodsTradeMsg(Goods_trade goods_trade);
    //查询所有货单信息
    public List<Goods_trade> findAllG_t();
    //通过货单id查询货单信息
    public List<Goods_trade> findG_t_id(int g_trade_id);
    //按用户id查询对应的所有货单信息
    public List<Goods_trade> findByu_id(int u_id);
    //查询出库信息
    public List<Goods_trade> find_out();
    //查询所有入库信息
    public List<Goods_trade> find_in();
    //按货物种类查询
    public List<Goods_trade> findG_id(int g_id);
        //通过货单id删除货单
    public void DeG_t_id(int g_trade_id);
}
