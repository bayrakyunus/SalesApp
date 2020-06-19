package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import props.Person;
import useforms.Admin;
import useutils.DB;

public class PersonModel {

    List<Person> pls = new ArrayList<>();

    public int personInsert(String pname, String psurname, String pmail, String pphone, String paddress) {
        int statu = -1;
        try {
            DB db = new DB();
            String query = "insert into person values ( null,0, ?, ?, ?, ?, ?, now() )";
            PreparedStatement pre = db.fncPre(query);
            pre.setString(1, pname);
            pre.setString(2, psurname);
            pre.setString(3, pmail);
            pre.setString(4, pphone);
            pre.setString(5, paddress);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("personInsert error : " + e);
            Admin admin = new Admin();
            admin.personMailUniqueError();
        }
        return statu;
    }

    public void personAllResult() {
        pls.clear();
        try {
            DB db = new DB();
            String query = "select * from person";
            ResultSet rs = db.fncPre(query).executeQuery();
            while (rs.next()) {
                Person pr = new Person();
                pr.setPid(rs.getInt("pid"));
                pr.setPname(rs.getString("pname"));
                pr.setPsurname(rs.getString("psurname"));
                pr.setPmail(rs.getString("pmail"));
                pr.setPphone(rs.getString("pphone"));
                pr.setPaddress(rs.getString("paddress"));
                pr.setPdate(rs.getString("pdate"));
                pr.setPregister(rs.getBoolean("pregister"));
                pls.add(pr);
            }
            db.close();
        } catch (Exception e) {
            System.err.println("personAllResult error : " + e);
        }
    }

    public DefaultTableModel personTable() {
        DefaultTableModel dtm = new DefaultTableModel();
        dtm.addColumn("Id");
        dtm.addColumn("Adı");
        dtm.addColumn("Soyadı");
        dtm.addColumn("Mail");
        dtm.addColumn("Telefon");
        dtm.addColumn("Adres");
        dtm.addColumn("Tarih");
        dtm.addColumn("Şifre Ataması");

        for (Person item : pls) {
            String registerStatu = "";
            if (item.getPersonRegister()) {
                registerStatu = "Şifre Atandı";
            } else {
                registerStatu = "Şifre Atanmadı";
            }
            Object[] row = {item.getPid(), item.getPname(), item.getPsurname(), item.getPmail(), item.getPphone(), item.getPaddress(), item.getPdate(), registerStatu};
            dtm.addRow(row);
        }

        return dtm;
    }

    public int personRegister(int pid) {
        int statu = -1;
        try {
            DB db = new DB();
            String query = "update person set pregister = 1 where pid = ?";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, pid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("personRegister error : " + e);
        }
        return statu;
    }

    public int personDelete(int pid) {

        int statu = -1;

        try {
            DB db = new DB();
            String query = "delete from user where upid =?";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, pid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("personDelete-> userDelete Error: " + e);
        }

        try {
            DB db = new DB();
            String query = "delete from person where pid =?";
            PreparedStatement pre = db.fncPre(query);
            pre.setInt(1, pid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("personDelete error : " + e);
        }
        return statu;
    }

    public int personUpdate(int pid, String pname, String psurname, String pphone, String pmail, String paddress) {
        int statu = -1;
        try {
            DB db = new DB();
            String query = "update person set pname = ?, psurname = ?, pphone = ?, pmail = ?, paddress = ? where pid = ?";
            PreparedStatement pre = db.fncPre(query);
            pre.setString(1, pname);
            pre.setString(2, psurname);
            pre.setString(3, pphone);
            pre.setString(4, pmail);
            pre.setString(5, paddress);
            pre.setInt(6, pid);
            statu = pre.executeUpdate();
            db.close();
        } catch (Exception e) {
            System.err.println("personUpdate Error : " + e);
        }
        return statu;
    }

}
