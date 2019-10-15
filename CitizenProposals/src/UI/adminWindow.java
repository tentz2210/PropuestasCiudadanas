/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UI;

import AppPackage.AnimationClass;

/**
 *
 * @author mapac
 */
public class adminWindow extends javax.swing.JFrame {

    /**
     * Creates new form adminWindow
     */
    public adminWindow() {
        initComponents();
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
        closeWindow = new javax.swing.JLabel();
        minimize = new javax.swing.JLabel();
        menu = new javax.swing.JLabel();
        statistics = new javax.swing.JLabel();
        settings = new javax.swing.JLabel();
        catalogues = new javax.swing.JLabel();
        query = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 255, 255));
        setUndecorated(true);
        setPreferredSize(new java.awt.Dimension(1366, 730));
        setSize(new java.awt.Dimension(1366, 710));

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        closeWindow.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/closeWindow.png"))); // NOI18N
        closeWindow.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        closeWindow.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                closeWindowMouseClicked(evt);
            }
        });
        jPanel1.add(closeWindow, new org.netbeans.lib.awtextra.AbsoluteConstraints(1330, 10, 30, 30));

        minimize.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/minimize.png"))); // NOI18N
        minimize.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        minimize.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                minimizeMouseClicked(evt);
            }
        });
        jPanel1.add(minimize, new org.netbeans.lib.awtextra.AbsoluteConstraints(1300, 10, 30, 30));

        menu.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/menu.png"))); // NOI18N
        menu.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        menu.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                menuMouseClicked(evt);
            }
        });
        jPanel1.add(menu, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, -1));

        statistics.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        statistics.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/statistics.png"))); // NOI18N
        statistics.setText("Módulo Estadísticas");
        statistics.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        statistics.setPreferredSize(new java.awt.Dimension(132, 32));
        jPanel1.add(statistics, new org.netbeans.lib.awtextra.AbsoluteConstraints(-185, 60, 170, -1));

        settings.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        settings.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/userSettings.png"))); // NOI18N
        settings.setText("Configuración");
        settings.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        settings.setPreferredSize(new java.awt.Dimension(132, 32));
        jPanel1.add(settings, new org.netbeans.lib.awtextra.AbsoluteConstraints(-185, 180, -1, -1));

        catalogues.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        catalogues.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/catalogues.png"))); // NOI18N
        catalogues.setText("Catálogos");
        catalogues.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jPanel1.add(catalogues, new org.netbeans.lib.awtextra.AbsoluteConstraints(-185, 140, -1, -1));

        query.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        query.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/query.png"))); // NOI18N
        query.setText("Consultas");
        query.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jPanel1.add(query, new org.netbeans.lib.awtextra.AbsoluteConstraints(-185, 100, 100, -1));

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void closeWindowMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_closeWindowMouseClicked
        this.setVisible(false);
        loginWindow login = new loginWindow();
    }//GEN-LAST:event_closeWindowMouseClicked

    private void minimizeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_minimizeMouseClicked
        this.setState(loginWindow.ICONIFIED);
    }//GEN-LAST:event_minimizeMouseClicked

    private void menuMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_menuMouseClicked
        AnimationClass statisticsR = new AnimationClass();
        statisticsR.jLabelXRight(-185, 10, 10, 5, statistics);
        AnimationClass settingR = new AnimationClass();
        settingR.jLabelXRight(-185, 10, 10, 5, settings);
        AnimationClass cataloguesR = new AnimationClass();
        cataloguesR.jLabelXRight(-185, 10, 10, 5, catalogues);
        AnimationClass queriesR = new AnimationClass();
        queriesR.jLabelXRight(-185, 10, 10, 5, query);
        
        //<--
        AnimationClass statisticsL = new AnimationClass();
        statisticsL.jLabelXLeft(10, -185, 10, 5, statistics);
        AnimationClass settingL = new AnimationClass();
        settingL.jLabelXLeft(10, -185, 10, 5, settings);
        AnimationClass cataloguesL = new AnimationClass();
        cataloguesL.jLabelXLeft(10,-185,10,5,catalogues);
        AnimationClass queriesL = new AnimationClass();
        queriesL.jLabelXLeft(10,-185,10,5,query);
    }//GEN-LAST:event_menuMouseClicked

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
            java.util.logging.Logger.getLogger(adminWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(adminWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(adminWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(adminWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new adminWindow().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel catalogues;
    private javax.swing.JLabel closeWindow;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel menu;
    private javax.swing.JLabel minimize;
    private javax.swing.JLabel query;
    private javax.swing.JLabel settings;
    private javax.swing.JLabel statistics;
    // End of variables declaration//GEN-END:variables
}
