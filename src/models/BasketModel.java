package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import props.Basket;
import useutils.DB;
import useutils.Util;

public class BasketModel {

    List<Basket> bls = new ArrayList<>();
    public static double basketPrice = 0;

    public int basketInsert(int bprid, double bprprice, int bpid) {
        int statu = -1;
        try {
            DB db = new DB();
            String query = "insert into basket values ( null , ? ,?, 1 , ? ,now() )";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, bprid);
            pre.setDouble(2, bprprice);
            pre.setInt(3, bpid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("basketInsert error : " + e);
        }
        return statu;
    }

    public void basketAllResult() {
        bls.clear();
        basketPrice = 0;
        try {
            DB db = new DB();
            int upid = (int) Util.us.getUpid();
            System.out.println("upid="+upid);
            String query = "SELECT * FROM basket where bstatu = 1 and bpid = '"+upid+"'";
            ResultSet rs = db.fncPre(query).executeQuery();
            while (rs.next()) {
                Basket bs = new Basket();
                bs.setBid(rs.getInt("bid"));
                bs.setBprid(rs.getInt("bprid"));
                bs.setBprprice(rs.getDouble("bprprice"));
                bs.setBstatu(rs.getInt("bstatu"));
                bs.setBpid(rs.getInt("bpid"));
                bs.setBdate(rs.getString("bdate"));
                basketPrice += rs.getDouble("bprprice");
                bls.add(bs);
            }
            db.close();
        } catch (Exception e) {
            System.err.println("basketAllResult error : " + e);
        }
    }

    public DefaultTableModel basketTable() {
        DefaultTableModel dtm = new DefaultTableModel();
        dtm.addColumn("ID");
        dtm.addColumn("Ürün ID");
        dtm.addColumn("Fiyat");
        dtm.addColumn("Personel ID");
        dtm.addColumn("Tarih");

        for (Basket item : bls) {
            Object[] row = {item.getBid(), item.getBprid(), item.getBprprice(), item.getBpid(), item.getBdate()};
            dtm.addRow(row);
        }
        return dtm;
    }

    public int basketStatuChange(int bid, int newStatu) {
        int statu = -1;
        try {
            DB db = new DB();
            String query = "update basket set bstatu = ? where bid = ?";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, newStatu);
            pre.setInt(2, bid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("basketStatuChange Error : " + e);
        }
        return statu;
    }

    

}
