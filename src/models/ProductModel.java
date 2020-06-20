package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import props.Product;
import useutils.DB;

public class ProductModel {

    List<Product> prls = new ArrayList<>();

    public int productInsert(int prcid, String prtitle, double prprice, String prbarcode, String prshelf, int prstock, String prnote) {
        int statu = -1;

        try {
            DB db = new DB();
            String query = "insert into product values ( null,?, ?, ?, ?, ?, ?,?, now() )";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, prcid);
            pre.setString(2, prtitle);
            pre.setDouble(3, prprice);
            pre.setString(4, prbarcode);
            pre.setString(5, prshelf);
            pre.setInt(6, prstock);
            pre.setString(7, prnote);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("productInsert Error : " + e);
        }
        return statu;
    }

    public void productAllResult(String txt) {
        prls.clear();
        String query = "";
        if (txt.equals("")) {
            query = "SELECT * FROM product INNER JOIN category ON product.prcid = category.cid";
        } else {
            query = "SELECT * FROM product INNER JOIN category ON product.prcid = category.cid WHERE prtitle like '%" + txt + "%' or ctitle like '%" + txt + "%' or prprice like '%" + txt + "%' "
                    + "or prbarcode like '%" + txt + "%' or prshelf like '%" + txt + "%' or prstock like '%" + txt + "%' "
                    + "or prnote like '%" + txt + "%' ";
        }
        try {
            DB db = new DB();
            ResultSet rs = db.fncPre(query).executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setPrid(rs.getInt("prid"));
                pro.setPrcid(rs.getInt("prcid"));
                pro.setPrctitle(rs.getString("ctitle"));
                pro.setPrtitle(rs.getString("prtitle"));
                pro.setPrprice(rs.getDouble("prprice"));
                pro.setPrbarcode(rs.getString("prbarcode"));
                pro.setPrshelf(rs.getString("prshelf"));
                pro.setPrstock(rs.getInt("prstock"));
                pro.setPrnote(rs.getString("prnote"));
                pro.setPrdate(rs.getString("prdate"));
                prls.add(pro);
            }
            db.close();
        } catch (Exception e) {
            System.err.println("productAllResult error : " + e);
        }

    }

    public DefaultTableModel productTable() {
        DefaultTableModel dtm = new DefaultTableModel();
        dtm.addColumn("ID");
        dtm.addColumn("PrCid");
        dtm.addColumn("Kategori Adı");
        dtm.addColumn("Başlık");
        dtm.addColumn("Fiyat");
        dtm.addColumn("Barkod");
        dtm.addColumn("Raf");
        dtm.addColumn("Stok");
        dtm.addColumn("Not");
        dtm.addColumn("Tarih");

        for (Product item : prls) {
            Object[] row = {item.getPrid(), item.getPrcid(), item.getPrctitle(), item.getPrtitle(), item.getPrprice(), item.getPrbarcode(),
                item.getPrshelf(), item.getPrstock(), item.getPrnote(), item.getPrdate()};
            dtm.addRow(row);
        }

        return dtm;
    }

    public int productUpdate(int prid, String prtitle, double prprice, String prbarcode, String prshelf, int prstock, String prnote) {
        int statu = -1;
        try {
            DB db = new DB();
            String query = "update product set prtitle = ?, prprice = ?, prbarcode = ?, prshelf = ?, prstock = ?, prnote = ? where prid = ?";
            PreparedStatement pre = db.fncPre(query);
            pre.setString(1, prtitle);
            pre.setDouble(2, prprice);
            pre.setString(3, prbarcode);
            pre.setString(4, prshelf);
            pre.setInt(5, prstock);
            pre.setString(6, prnote);
            pre.setInt(7, prid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("productUpdate Error : " + e);
        }
        return statu;
    }

    public int productDelete(int prid) {

        int statu = -1;

        try {
            DB db = new DB();
            String query = "delete from product where prid =?";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, prid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("productDelete error : " + e);
        }
        return statu;
    }

    public int stockDecrease(int quantity, int prid) {
        int statu = -1;
        int stock = 155;
        try {
            DB db = new DB();
            String query = "select * from product where prid = '" + prid + "' ";
            ResultSet rs = db.fncPre(query).executeQuery();
            while (rs.next()) {
                stock = rs.getInt("prstock");
                stock -= quantity;
            }
            db.close();
        } catch (Exception e) {
            System.err.println("stockDecrease Error : " + e);
        }
        try {
            DB db = new DB();
            String query = " update product set prstock = ? where prid = ? ";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, stock);
            pre.setInt(2, prid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("stockDecrease Error : " + e);
        }
        return statu;
    }

}
