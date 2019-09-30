/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UI;

import AppPackage.AnimationClass;
import javax.swing.ImageIcon;

/**
 *
 * @author lin
 */
public class MainWindow extends javax.swing.JFrame {

    AnimationClass AC = new AnimationClass();
    /**
     * Creates new form Login
     */
    public MainWindow() {
        initComponents();
        SlideShow();
        this.setLocationRelativeTo(null);
        
    }
    
    public void SlideShow()
    {
        new Thread()
        {
            int count;
            
            @Override
            public void run()
            {
                try
                {
                    while(true)
                    {
                        switch(count)
                        {
                            case 0:
                                ImageIcon logoIcon = new ImageIcon(getClass().getResource("/Images/logo.png"));
                                slide1.setIcon(logoIcon);
                                Thread.sleep(4500);
                                AC.jLabelXLeft(0, -650, 15, 5, slide1);
                                AC.jLabelXLeft(650, 0, 15, 5, slide2);
                                count = 1;
                                break;
                            
                            case 1:
                                ImageIcon invitacionIcon = new ImageIcon(getClass().getResource("/Images/invitación.png"));
                                slide2.setIcon(invitacionIcon);
                                Thread.sleep(4500);
                                AC.jLabelXRight(-650,0, 15, 5, slide1);
                                AC.jLabelXRight(0,650, 15, 5, slide2);
                                count = 2;
                                break;
                                
                            case 2:
                                ImageIcon cat1Icon = new ImageIcon(getClass().getResource("/Images/cat01.png"));
                                slide1.setIcon(cat1Icon);
                                Thread.sleep(4500);
                                AC.jLabelXLeft(0, -650, 15, 5, slide1);
                                AC.jLabelXLeft(650, 0, 15, 5, slide2);
                                count = 3;
                                break;
                                
                            case 3:
                                ImageIcon cat2Icon = new ImageIcon(getClass().getResource("/Images/cat02.png"));
                                slide2.setIcon(cat2Icon);
                                Thread.sleep(4500);
                                AC.jLabelXRight(-650,0, 15, 5, slide1);
                                AC.jLabelXRight(0,650, 15, 5, slide2);
                                count = 4;
                                break;
                                
                            case 4:
                                ImageIcon cat3Icon = new ImageIcon(getClass().getResource("/Images/cat03.png"));
                                slide1.setIcon(cat3Icon);
                                Thread.sleep(4500);
                                AC.jLabelXLeft(0, -650, 15, 5, slide1);
                                AC.jLabelXLeft(650, 0, 15, 5, slide2);
                                count = 5;
                                break;
                                
                            case 5:
                                ImageIcon cat4Icon = new ImageIcon(getClass().getResource("/Images/cat04.png"));
                                slide2.setIcon(cat4Icon);
                                Thread.sleep(4500);
                                AC.jLabelXRight(-650,0, 15, 5, slide1);
                                AC.jLabelXRight(0,650, 15, 5, slide2);
                                count = 0;
                                break;
                        }
                    }
                }
                catch(Exception e)
                {
                    
                }
            }
        }.start();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        login = new javax.swing.JPanel();
        labelPassword = new javax.swing.JLabel();
        labelUser = new javax.swing.JLabel();
        user01Img = new javax.swing.JLabel();
        keyImg = new javax.swing.JLabel();
        user02Img = new javax.swing.JLabel();
        userNameField = new javax.swing.JTextField();
        passwordField = new javax.swing.JPasswordField();
        jSeparator1 = new javax.swing.JSeparator();
        jSeparator2 = new javax.swing.JSeparator();
        loginButton = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        panelSlides = new javax.swing.JPanel();
        slide1 = new javax.swing.JLabel();
        slide2 = new javax.swing.JLabel();
        panelMinimizeClose = new javax.swing.JPanel();
        minizar = new javax.swing.JLabel();
        closeWindow = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 255, 255));
        setUndecorated(true);
        setResizable(false);
        setSize(new java.awt.Dimension(1000, 500));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        login.setBackground(new java.awt.Color(255, 255, 255));
        login.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        login.setForeground(new java.awt.Color(255, 255, 255));
        login.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        labelPassword.setBackground(new java.awt.Color(0, 0, 0));
        labelPassword.setFont(new java.awt.Font("Arial", 0, 24)); // NOI18N
        labelPassword.setText("Contraseña:");
        login.add(labelPassword, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 260, -1, -1));

        labelUser.setBackground(new java.awt.Color(0, 0, 0));
        labelUser.setFont(new java.awt.Font("Arial", 0, 24)); // NOI18N
        labelUser.setText("Usuario:");
        login.add(labelUser, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 150, -1, -1));

        user01Img.setBackground(new java.awt.Color(255, 153, 153));
        user01Img.setForeground(new java.awt.Color(255, 51, 102));
        user01Img.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/user01.png"))); // NOI18N
        user01Img.setAlignmentX(0.5F);
        login.add(user01Img, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 50, 90, 80));

        keyImg.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/key.png"))); // NOI18N
        login.add(keyImg, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 310, 30, -1));

        user02Img.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/user02.png"))); // NOI18N
        login.add(user02Img, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 200, -1, -1));

        userNameField.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        userNameField.setToolTipText("");
        userNameField.setBorder(null);
        userNameField.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));
        login.add(userNameField, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 200, 260, 30));

        passwordField.setFont(new java.awt.Font("Arial", 0, 18)); // NOI18N
        passwordField.setBorder(null);
        login.add(passwordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 310, 250, 30));
        login.add(jSeparator1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 340, 290, 10));
        login.add(jSeparator2, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 230, 290, 10));

        loginButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/Ingresar01.png"))); // NOI18N
        loginButton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        loginButton.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/Ingresar02.png"))); // NOI18N
        login.add(loginButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 380, 100, 40));

        jButton1.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/register01.png"))); // NOI18N
        jButton1.setBorder(null);
        jButton1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton1.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/register02.png"))); // NOI18N
        login.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 440, 240, 40));

        getContentPane().add(login, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 350, 500));

        panelSlides.setBackground(new java.awt.Color(255, 255, 255));
        panelSlides.setForeground(new java.awt.Color(255, 255, 255));
        panelSlides.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        panelSlides.add(slide1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 650, 450));

        slide2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        slide2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/invitación.png"))); // NOI18N
        panelSlides.add(slide2, new org.netbeans.lib.awtextra.AbsoluteConstraints(650, 0, 650, 450));

        getContentPane().add(panelSlides, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 50, 650, 450));

        panelMinimizeClose.setBackground(new java.awt.Color(255, 255, 255));
        panelMinimizeClose.setForeground(new java.awt.Color(255, 255, 255));
        panelMinimizeClose.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        minizar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/minimize.png"))); // NOI18N
        minizar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        minizar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                minizarMouseClicked(evt);
            }
        });
        panelMinimizeClose.add(minizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(580, 3, 30, -1));

        closeWindow.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/closeWindow.png"))); // NOI18N
        closeWindow.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        closeWindow.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                closeWindowMouseClicked(evt);
            }
        });
        panelMinimizeClose.add(closeWindow, new org.netbeans.lib.awtextra.AbsoluteConstraints(620, 0, 30, 30));

        getContentPane().add(panelMinimizeClose, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 0, 650, 50));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void minizarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_minizarMouseClicked
        this.setState(MainWindow.ICONIFIED);
    }//GEN-LAST:event_minizarMouseClicked

    private void closeWindowMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_closeWindowMouseClicked
        System.exit(0);
    }//GEN-LAST:event_closeWindowMouseClicked

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
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainWindow.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainWindow().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel closeWindow;
    private javax.swing.JButton jButton1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JLabel keyImg;
    private javax.swing.JLabel labelPassword;
    private javax.swing.JLabel labelUser;
    private javax.swing.JPanel login;
    private javax.swing.JButton loginButton;
    private javax.swing.JLabel minizar;
    private javax.swing.JPanel panelMinimizeClose;
    private javax.swing.JPanel panelSlides;
    private javax.swing.JPasswordField passwordField;
    private javax.swing.JLabel slide1;
    private javax.swing.JLabel slide2;
    private javax.swing.JLabel user01Img;
    private javax.swing.JLabel user02Img;
    private javax.swing.JTextField userNameField;
    // End of variables declaration//GEN-END:variables
}
