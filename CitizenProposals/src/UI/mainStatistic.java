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
public class mainStatistic extends javax.swing.JFrame {

    /**
     * Creates new form mainStatistic
     */
    public mainStatistic() {
        initComponents();
        this.setLocationRelativeTo(null);
        this.setVisible(true);	
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
        jLabel1 = new javax.swing.JLabel();
        closeWindow = new javax.swing.JLabel();
        ageButton = new javax.swing.JButton();
        categoryButton = new javax.swing.JButton();
        userZoneButton = new javax.swing.JButton();
        minimize = new javax.swing.JLabel();
        proposalsZoneButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));

        jLabel1.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        jLabel1.setText("Estadísticas");

        closeWindow.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/closeWindow.png"))); // NOI18N
        closeWindow.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        closeWindow.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                closeWindowMouseClicked(evt);
            }
        });

        ageButton.setBackground(new java.awt.Color(16, 123, 16));
        ageButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        ageButton.setForeground(new java.awt.Color(255, 255, 255));
        ageButton.setText("Edad");
        ageButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        ageButton.setPreferredSize(new java.awt.Dimension(95, 25));
        ageButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                ageButtonMouseClicked(evt);
            }
        });
        ageButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ageButtonActionPerformed(evt);
            }
        });

        categoryButton.setBackground(new java.awt.Color(16, 123, 16));
        categoryButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        categoryButton.setForeground(new java.awt.Color(255, 255, 255));
        categoryButton.setText("Categoría");
        categoryButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        categoryButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                categoryButtonMouseClicked(evt);
            }
        });
        categoryButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                categoryButtonActionPerformed(evt);
            }
        });

        userZoneButton.setBackground(new java.awt.Color(16, 123, 16));
        userZoneButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        userZoneButton.setForeground(new java.awt.Color(255, 255, 255));
        userZoneButton.setText("Usuarios por zona");
        userZoneButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        userZoneButton.setPreferredSize(new java.awt.Dimension(163, 25));
        userZoneButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                userZoneButtonMouseClicked(evt);
            }
        });

        minimize.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/minimize.png"))); // NOI18N
        minimize.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        minimize.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                minimizeMouseClicked(evt);
            }
        });

        proposalsZoneButton.setBackground(new java.awt.Color(16, 123, 16));
        proposalsZoneButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        proposalsZoneButton.setForeground(new java.awt.Color(255, 255, 255));
        proposalsZoneButton.setText("Propuestas por zona");
        proposalsZoneButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        proposalsZoneButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                proposalsZoneButtonMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(jLabel1)
                        .addGap(245, 245, 245)
                        .addComponent(minimize)
                        .addGap(6, 6, 6)
                        .addComponent(closeWindow))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addComponent(userZoneButton, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(27, 27, 27)
                        .addComponent(proposalsZoneButton)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(50, 50, 50)
                .addComponent(ageButton, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(categoryButton)
                .addGap(77, 77, 77))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(11, 11, 11)
                        .addComponent(jLabel1))
                    .addComponent(minimize)
                    .addComponent(closeWindow))
                .addGap(27, 27, 27)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(userZoneButton, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(proposalsZoneButton))
                .addGap(15, 15, 15)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ageButton, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(categoryButton)))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void closeWindowMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_closeWindowMouseClicked
        this.setVisible(false);
    }//GEN-LAST:event_closeWindowMouseClicked

    private void minimizeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_minimizeMouseClicked
        this.setState(mainStatistic.ICONIFIED);
    }//GEN-LAST:event_minimizeMouseClicked

    private void ageButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ageButtonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_ageButtonActionPerformed

    private void categoryButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_categoryButtonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_categoryButtonActionPerformed

    private void userZoneButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_userZoneButtonMouseClicked
        UserZoneStatisticWindow  userZone = new UserZoneStatisticWindow();
        this.setVisible(false);
    }//GEN-LAST:event_userZoneButtonMouseClicked

    private void categoryButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_categoryButtonMouseClicked
        CategoryStatisticWindow categoryS = new CategoryStatisticWindow();
        this.setVisible(false);
    }//GEN-LAST:event_categoryButtonMouseClicked

    private void ageButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_ageButtonMouseClicked
        AgeStatisticWindow ageS = new AgeStatisticWindow(); 
        this.setVisible(false);
    }//GEN-LAST:event_ageButtonMouseClicked

    private void proposalsZoneButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_proposalsZoneButtonMouseClicked
        zoneStatisticWindow zoneS = new zoneStatisticWindow();
        this.setVisible(false);
    }//GEN-LAST:event_proposalsZoneButtonMouseClicked

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
            java.util.logging.Logger.getLogger(mainStatistic.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(mainStatistic.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(mainStatistic.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(mainStatistic.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new mainStatistic().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton ageButton;
    private javax.swing.JButton categoryButton;
    private javax.swing.JLabel closeWindow;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel minimize;
    private javax.swing.JButton proposalsZoneButton;
    private javax.swing.JButton userZoneButton;
    // End of variables declaration//GEN-END:variables
}
