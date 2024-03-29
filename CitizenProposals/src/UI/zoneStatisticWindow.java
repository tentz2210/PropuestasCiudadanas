/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UI;

/**
 *
 * @author mapac
 */
import AppPackage.AnimationClass;
import Connect.ConnectDB;
import Utils.Global;
import com.sun.javafx.application.PlatformImpl;
import java.awt.BorderLayout;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javax.swing.JOptionPane;
import javafx.embed.swing.JFXPanel;
import javafx.scene.Scene;
import javafx.scene.chart.PieChart;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.GridPane;
import javax.swing.GroupLayout.Group;
public class zoneStatisticWindow extends javax.swing.JFrame {

    /**
     * Creates new form citizenWindow
     */
    public zoneStatisticWindow() {
        initComponents();
        this.fillOptionComboBox();
        this.setLocationRelativeTo(null);
        this.setVisible(true);
        final JFXPanel panel = new JFXPanel();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        minimize = new javax.swing.JLabel();
        closeWindow = new javax.swing.JLabel();
        optionComboBox = new javax.swing.JComboBox<>();
        jLabel1 = new javax.swing.JLabel();
        chartPanel = new javax.swing.JPanel();
        queryButton = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 255, 255));
        setMinimumSize(new java.awt.Dimension(579, 658));
        setUndecorated(true);
        setPreferredSize(new java.awt.Dimension(580, 658));
        setSize(new java.awt.Dimension(1366, 710));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setPreferredSize(new java.awt.Dimension(1366, 710));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        minimize.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/minimize.png"))); // NOI18N
        minimize.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        minimize.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                minimizeMouseClicked(evt);
            }
        });
        jPanel1.add(minimize, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 10, -1, -1));

        closeWindow.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/closeWindow.png"))); // NOI18N
        closeWindow.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        closeWindow.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                closeWindowMouseClicked(evt);
            }
        });
        jPanel1.add(closeWindow, new org.netbeans.lib.awtextra.AbsoluteConstraints(540, 10, -1, -1));

        optionComboBox.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        optionComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                optionComboBoxActionPerformed(evt);
            }
        });
        jPanel1.add(optionComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 60, 100, 20));
        optionComboBox.getAccessibleContext().setAccessibleName("");

        jLabel1.setText("Filtrar por:");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 60, -1, 20));

        chartPanel.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        chartPanel.setLayout(new java.awt.BorderLayout());
        jPanel1.add(chartPanel, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 150, 510, 480));

        queryButton.setText("Consultar");
        queryButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                queryButtonActionPerformed(evt);
            }
        });
        jPanel1.add(queryButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 60, -1, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 36)); // NOI18N
        jLabel2.setText("Estadísticas por Zona");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 90, -1, -1));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 580, 730));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void minimizeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_minimizeMouseClicked
        this.setState(loginWindow.ICONIFIED);
    }//GEN-LAST:event_minimizeMouseClicked

    private void closeWindowMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_closeWindowMouseClicked
        this.setVisible(false);
    }//GEN-LAST:event_closeWindowMouseClicked

    private void optionComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_optionComboBoxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_optionComboBoxActionPerformed

    private void queryButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_queryButtonActionPerformed
        generateZoneChart();
    }//GEN-LAST:event_queryButtonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(zoneStatisticWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(zoneStatisticWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(zoneStatisticWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(zoneStatisticWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new zoneStatisticWindow().setVisible(true);
            }
        });
    }
    
    private void fillOptionComboBox()
    {
        optionComboBox.removeAllItems();
        String[] filterOptions = {"País", "Provincia", "Cantón", "Distrito", "Comunidad"};
        for (int filterIndex = 0; filterIndex < filterOptions.length; filterIndex++)
        {
            optionComboBox.addItem(filterOptions[filterIndex]);
        }
    }
    
    private Scene setChartScene(PieChart chart)
    {
        ScrollPane sp = new ScrollPane();
        sp.setContent(chart);
        
        Scene scene = new Scene(sp, 1050, 500);
        return scene;
    }
    
    private void generateChart(ResultSet r) throws SQLException
    {
        ArrayList<PieChart.Data> pieChartDataList = new ArrayList<PieChart.Data>();
        DecimalFormat dblFormat = new DecimalFormat("#.##");
        while(r.next())
        {
            String percentage = dblFormat.format(r.getDouble(3));
            String dataLabel = r.getString(1)+": "+r.getInt(2)+"/"+percentage+"%";
            pieChartDataList.add(new PieChart.Data(dataLabel, r.getInt(2)));
        }
        ObservableList<PieChart.Data> pieChartData = FXCollections.observableArrayList(pieChartDataList);
        
        
        final JFXPanel fxPanel = new JFXPanel();
        final PieChart chart = new PieChart(pieChartData);
        chart.setLabelsVisible(false);
        fxPanel.setScene(setChartScene(chart));
        this.chartPanel.removeAll();
        this.chartPanel.add(fxPanel, BorderLayout.CENTER);
        this.chartPanel.repaint();
    }
    
    private static void initFX(JFXPanel fxPanel, Scene scene) {
             // This method is invoked on JavaFX thread
             fxPanel.setScene(scene);
    }
    
    private void generateZoneChart()
    {
        String option = (String)optionComboBox.getSelectedItem();
        try{
            ResultSet r;
            switch (option)
            {
                case "País":
                    r = ConnectDB.getStatisticsPerCountry();
                    generateChart(r);
                    break;
                case "Provincia":
                    r = ConnectDB.getStatisticsPerProvince();
                    generateChart(r);
                    break;
                case "Cantón":
                    r = ConnectDB.getStatisticsPerCanton();
                    generateChart(r);
                    break;
                case "Distrito":
                    r = ConnectDB.getStatisticsPerDistrict();
                    generateChart(r);
                    break;
                case "Comunidad":
                    r = ConnectDB.getStatisticsPerCommunity();
                    generateChart(r);
                    break;
                default:
            }
        } catch (SQLException ex) {
            Logger.getLogger(registerWindow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel chartPanel;
    private javax.swing.JLabel closeWindow;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel minimize;
    private javax.swing.JComboBox<String> optionComboBox;
    private javax.swing.JButton queryButton;
    // End of variables declaration//GEN-END:variables
}
