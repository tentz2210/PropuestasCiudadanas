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
public class passwordWindow extends javax.swing.JFrame {

    /**
     * Creates new form passwordWindow
     */
    public passwordWindow() {
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
        iconPassword = new javax.swing.JLabel();
        actualPasswordLabel = new javax.swing.JLabel();
        actualPasswordField = new javax.swing.JPasswordField();
        newPasswordLabel = new javax.swing.JLabel();
        newPasswordField = new javax.swing.JPasswordField();
        cNewPasswordLabel = new javax.swing.JLabel();
        cNewPasswordField = new javax.swing.JPasswordField();
        acceptButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        iconPassword.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/password.png"))); // NOI18N
        jPanel1.add(iconPassword, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 10, 90, 84));

        actualPasswordLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        actualPasswordLabel.setText("Contraseña actual");
        jPanel1.add(actualPasswordLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 130, -1));

        actualPasswordField.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(actualPasswordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(155, 18, 120, -1));

        newPasswordLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        newPasswordLabel.setText("Nueva contraseña");
        jPanel1.add(newPasswordLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 63, -1, -1));

        newPasswordField.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(newPasswordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(155, 62, 120, -1));

        cNewPasswordLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        cNewPasswordLabel.setText("Confirmar contraseña");
        jPanel1.add(cNewPasswordLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 106, -1, -1));

        cNewPasswordField.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(cNewPasswordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(155, 105, 120, -1));

        acceptButton.setBackground(new java.awt.Color(16, 123, 16));
        acceptButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        acceptButton.setForeground(new java.awt.Color(255, 255, 255));
        acceptButton.setText("Aceptar");
        acceptButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jPanel1.add(acceptButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 140, 90, -1));

        cancelButton.setBackground(new java.awt.Color(222, 4, 11));
        cancelButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        cancelButton.setForeground(new java.awt.Color(255, 255, 255));
        cancelButton.setText("Cancelar");
        cancelButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        cancelButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cancelButtonMouseClicked(evt);
            }
        });
        jPanel1.add(cancelButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 140, -1, -1));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 400, 180));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cancelButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cancelButtonMouseClicked
        this.setVisible(false);
    }//GEN-LAST:event_cancelButtonMouseClicked

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
            java.util.logging.Logger.getLogger(passwordWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(passwordWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(passwordWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(passwordWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new passwordWindow().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton acceptButton;
    private javax.swing.JPasswordField actualPasswordField;
    private javax.swing.JLabel actualPasswordLabel;
    private javax.swing.JPasswordField cNewPasswordField;
    private javax.swing.JLabel cNewPasswordLabel;
    private javax.swing.JButton cancelButton;
    private javax.swing.JLabel iconPassword;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPasswordField newPasswordField;
    private javax.swing.JLabel newPasswordLabel;
    // End of variables declaration//GEN-END:variables
}