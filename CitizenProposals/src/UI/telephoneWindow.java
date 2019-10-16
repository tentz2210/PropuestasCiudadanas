/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package UI;

import Connect.ConnectDB;
import Utils.Global;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author mapac
 */
public class telephoneWindow extends javax.swing.JFrame {

    /** Creates new form telephoneWindow */
    public telephoneWindow() {
        initComponents();
        this.setLocationRelativeTo(null);
        this.setVisible(true);
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        iconPhone = new javax.swing.JLabel();
        addTitle = new javax.swing.JLabel();
        addNewPhoneLabel = new javax.swing.JLabel();
        addNewPhoneField = new javax.swing.JTextField();
        addButton = new javax.swing.JButton();
        eliminateTitle = new javax.swing.JLabel();
        eliminateLabel = new javax.swing.JLabel();
        eliminateField = new javax.swing.JTextField();
        eliminateButton = new javax.swing.JButton();
        modifyTitle = new javax.swing.JLabel();
        oldPhoneLabel = new javax.swing.JLabel();
        oldPhoneField = new javax.swing.JTextField();
        actualPhoneLabel = new javax.swing.JLabel();
        actualPhoneField = new javax.swing.JTextField();
        modifyButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(456, 425));
        setUndecorated(true);
        setPreferredSize(new java.awt.Dimension(456, 434));
        setResizable(false);
        setSize(new java.awt.Dimension(445, 550));

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setMinimumSize(new java.awt.Dimension(456, 430));
        jPanel1.setPreferredSize(new java.awt.Dimension(456, 600));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        iconPhone.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/phone.png"))); // NOI18N
        jPanel1.add(iconPhone, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 0, -1, 100));

        addTitle.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        addTitle.setText("Agregar");
        jPanel1.add(addTitle, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 80, 20));

        addNewPhoneLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        addNewPhoneLabel.setText("Agregar número de teléfono");
        jPanel1.add(addNewPhoneLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 40, -1, 20));

        addNewPhoneField.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(addNewPhoneField, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 37, 140, -1));

        addButton.setBackground(new java.awt.Color(0, 0, 102));
        addButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        addButton.setForeground(new java.awt.Color(255, 255, 255));
        addButton.setText("Agregar");
        addButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        addButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                addButtonMouseClicked(evt);
            }
        });
        jPanel1.add(addButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 80, 90, -1));

        eliminateTitle.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        eliminateTitle.setText("Eliminar");
        jPanel1.add(eliminateTitle, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 120, 90, -1));

        eliminateLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        eliminateLabel.setText("Eliminar número de teléfono");
        jPanel1.add(eliminateLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 150, 180, -1));

        eliminateField.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(eliminateField, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 145, 140, -1));

        eliminateButton.setBackground(new java.awt.Color(0, 0, 102));
        eliminateButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        eliminateButton.setForeground(new java.awt.Color(255, 255, 255));
        eliminateButton.setText("Eliminar");
        eliminateButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        eliminateButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                eliminateButtonMouseClicked(evt);
            }
        });
        jPanel1.add(eliminateButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 190, 90, -1));

        modifyTitle.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        modifyTitle.setText("Modificar");
        jPanel1.add(modifyTitle, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 230, -1, -1));

        oldPhoneLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        oldPhoneLabel.setText("Número de teléfono anterior");
        jPanel1.add(oldPhoneLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 260, 180, -1));

        oldPhoneField.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(oldPhoneField, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 260, 140, -1));

        actualPhoneLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        actualPhoneLabel.setText("Número de teléfono actual");
        jPanel1.add(actualPhoneLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 300, 170, -1));

        actualPhoneField.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(actualPhoneField, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 300, 140, -1));

        modifyButton.setBackground(new java.awt.Color(0, 0, 102));
        modifyButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        modifyButton.setForeground(new java.awt.Color(255, 255, 255));
        modifyButton.setText("Modificar");
        modifyButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        modifyButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                modifyButtonMouseClicked(evt);
            }
        });
        jPanel1.add(modifyButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 340, -1, -1));

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
        jPanel1.add(cancelButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 390, -1, -1));

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cancelButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cancelButtonMouseClicked
        this.setVisible(false);
    }//GEN-LAST:event_cancelButtonMouseClicked

    private void addButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_addButtonMouseClicked
        if (Global.isNumeric(addNewPhoneField.getText()) && !"".equals(addNewPhoneField.getText())){
            try {
                int newPhone = Integer.valueOf(addNewPhoneField.getText());
                ConnectDB.insertPhoneNumber(newPhone,Global.id_person);
                if (Global.insert_result == 1) JOptionPane.showMessageDialog(this,"Se ha insertado el nuevo número telefónico","Inserción exitosa",JOptionPane.INFORMATION_MESSAGE);
                else JOptionPane.showMessageDialog(this,"Error al agregar el nuevo número de teléfono","Error de inserción",JOptionPane.ERROR_MESSAGE);
            } catch (SQLException ex) {
                Logger.getLogger(telephoneWindow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else JOptionPane.showMessageDialog(this,"Error al agregar el nuevo número de teléfono","Error de inserción",JOptionPane.ERROR_MESSAGE);
    }//GEN-LAST:event_addButtonMouseClicked

    private void eliminateButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_eliminateButtonMouseClicked
        if (Global.isNumeric(eliminateField.getText()) && !"".equals(eliminateField.getText())){
            try {
                int phoneNumb = Integer.valueOf(eliminateField.getText());
                ConnectDB.deletePhoneNumber(phoneNumb,Global.id_person);
                if (Global.delete_result==1) JOptionPane.showMessageDialog(this,"Se ha eliminado el número telefónico","Borrado exitoso",JOptionPane.INFORMATION_MESSAGE);
                else JOptionPane.showMessageDialog(this,"Error al eliminar el número telefónico","Error de borrado",JOptionPane.ERROR_MESSAGE);
            } catch (SQLException ex) {
                Logger.getLogger(telephoneWindow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else JOptionPane.showMessageDialog(this,"Error al eliminar el número telefónico","Error de borrado",JOptionPane.ERROR_MESSAGE);
    }//GEN-LAST:event_eliminateButtonMouseClicked

    private void modifyButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_modifyButtonMouseClicked
        if (!"".equals(oldPhoneField.getText()) && Global.isNumeric(oldPhoneField.getText()) && !"".equals(actualPhoneField.getText()) && Global.isNumeric(actualPhoneField.getText()))
        {
            try {
                int oldPhone = Integer.valueOf(oldPhoneField.getText());
                int newPhone = Integer.valueOf(actualPhoneField.getText());
                ConnectDB.modifyPhoneNumber(Global.id_person,oldPhone,newPhone);
                if (Global.update_result == 1) JOptionPane.showMessageDialog(this,"Número telefónico modificado correctamente","Modificación exitosa",JOptionPane.INFORMATION_MESSAGE);
                else JOptionPane.showMessageDialog(this,"Error al modificar el número telefónico","Error de modificación",JOptionPane.ERROR_MESSAGE);
            } catch (SQLException ex) {
                Logger.getLogger(telephoneWindow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else JOptionPane.showMessageDialog(this,"Error al modificar el número telefónico","Error de modificación",JOptionPane.ERROR_MESSAGE);
    }//GEN-LAST:event_modifyButtonMouseClicked

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
            java.util.logging.Logger.getLogger(telephoneWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(telephoneWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(telephoneWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(telephoneWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new telephoneWindow().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField actualPhoneField;
    private javax.swing.JLabel actualPhoneLabel;
    private javax.swing.JButton addButton;
    private javax.swing.JTextField addNewPhoneField;
    private javax.swing.JLabel addNewPhoneLabel;
    private javax.swing.JLabel addTitle;
    private javax.swing.JButton cancelButton;
    private javax.swing.JButton eliminateButton;
    private javax.swing.JTextField eliminateField;
    private javax.swing.JLabel eliminateLabel;
    private javax.swing.JLabel eliminateTitle;
    private javax.swing.JLabel iconPhone;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JButton modifyButton;
    private javax.swing.JLabel modifyTitle;
    private javax.swing.JTextField oldPhoneField;
    private javax.swing.JLabel oldPhoneLabel;
    // End of variables declaration//GEN-END:variables

}