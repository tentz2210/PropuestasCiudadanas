/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UI;

import Connect.ConnectDB;
import Utils.Global;
import com.placeholder.PlaceHolder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
/**
 *
 * @author lin
 */
public class registerWindow extends javax.swing.JFrame {

    /**
     * Creates new form registerWindow
     */
    public registerWindow() throws SQLException {
        initComponents();
        fillCountriesComboBox();
        fillNationalitiesComboBox();
        fillUserTypeComboBox();
        this.setLocationRelativeTo(null);
        this.holders();
        this.setVisible(true);
    }
    
    public void holders(){
        PlaceHolder holder;
        holder = new PlaceHolder(nameField,"Nombre");
        holder = new PlaceHolder(fLastNameField,"Primer Apellido");
        holder = new PlaceHolder(sLastNameField,"Segundo Apellido");
        holder = new PlaceHolder(identificationField,"Cédula o pasaporte");
        holder = new PlaceHolder(phoneField,"Número de teléfono");
        holder = new PlaceHolder(emailField,"Correo electrónico");
        holder = new PlaceHolder(userNameField,"Nombre de usuario");
        holder = new PlaceHolder(passwordField,"Contraseña");
        holder = new PlaceHolder(cPasswordField,"Confirmar contraseña");
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
        panelMinimizeClose = new javax.swing.JPanel();
        closeWndow = new javax.swing.JLabel();
        minizar = new javax.swing.JLabel();
        appName = new javax.swing.JLabel();
        logo = new javax.swing.JLabel();
        createAccount = new javax.swing.JLabel();
        fLastNameField = new javax.swing.JTextField();
        sLastNameField = new javax.swing.JTextField();
        identificationField = new javax.swing.JTextField();
        nameField = new javax.swing.JTextField();
        phoneField = new javax.swing.JTextField();
        emailField = new javax.swing.JTextField();
        dateOfBirth = new javax.swing.JPanel();
        year = new javax.swing.JLabel();
        yearComboBox = new javax.swing.JComboBox<>();
        monthComboBox = new javax.swing.JComboBox<>();
        month = new javax.swing.JLabel();
        dayComboBox = new javax.swing.JComboBox<>();
        Day = new javax.swing.JLabel();
        dateOfBirthLabel = new javax.swing.JLabel();
        passwordField = new javax.swing.JTextField();
        userNameField = new javax.swing.JTextField();
        cPasswordField = new javax.swing.JTextField();
        userType = new javax.swing.JLabel();
        userTypeComboBox = new javax.swing.JComboBox<>();
        nationality = new javax.swing.JLabel();
        nationalityComboBox = new javax.swing.JComboBox<>();
        country = new javax.swing.JLabel();
        countryComboBox = new javax.swing.JComboBox<>();
        province = new javax.swing.JLabel();
        provinceComboBox = new javax.swing.JComboBox<>();
        canton = new javax.swing.JLabel();
        cantonComboBox = new javax.swing.JComboBox<>();
        district = new javax.swing.JLabel();
        districtComboBox = new javax.swing.JComboBox<>();
        community = new javax.swing.JLabel();
        communityComboBox = new javax.swing.JComboBox<>();
        photoButton = new javax.swing.JButton();
        register = new javax.swing.JButton();
        photoLabel = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 255, 255));
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        panelMinimizeClose.setBackground(new java.awt.Color(255, 255, 255));

        closeWndow.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/closeWindow.png"))); // NOI18N
        closeWndow.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        closeWndow.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                closeWndowMouseClicked(evt);
            }
        });

        minizar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/minimize.png"))); // NOI18N
        minizar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        minizar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                minizarMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout panelMinimizeCloseLayout = new javax.swing.GroupLayout(panelMinimizeClose);
        panelMinimizeClose.setLayout(panelMinimizeCloseLayout);
        panelMinimizeCloseLayout.setHorizontalGroup(
            panelMinimizeCloseLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, panelMinimizeCloseLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(minizar)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(closeWndow, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        panelMinimizeCloseLayout.setVerticalGroup(
            panelMinimizeCloseLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelMinimizeCloseLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(panelMinimizeCloseLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(closeWndow, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(panelMinimizeCloseLayout.createSequentialGroup()
                        .addComponent(minizar)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );

        jPanel1.add(panelMinimizeClose, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 939, -1));

        appName.setFont(new java.awt.Font("Arial", 0, 40)); // NOI18N
        appName.setText("Nombre app");
        jPanel1.add(appName, new org.netbeans.lib.awtextra.AbsoluteConstraints(98, 55, 258, 71));

        logo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/user01.png"))); // NOI18N
        jPanel1.add(logo, new org.netbeans.lib.awtextra.AbsoluteConstraints(162, 144, 248, 246));

        createAccount.setFont(new java.awt.Font("Arial", 0, 24)); // NOI18N
        createAccount.setText("Crea una cuenta");
        jPanel1.add(createAccount, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 30, 239, 54));

        fLastNameField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(fLastNameField, new org.netbeans.lib.awtextra.AbsoluteConstraints(730, 80, 173, 35));

        sLastNameField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(sLastNameField, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 120, 173, 35));

        identificationField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(identificationField, new org.netbeans.lib.awtextra.AbsoluteConstraints(730, 120, 173, 35));

        nameField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        nameField.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));
        nameField.setDisabledTextColor(new java.awt.Color(0, 0, 0));
        jPanel1.add(nameField, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 80, 173, 35));

        phoneField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(phoneField, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 160, 173, 35));

        emailField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(emailField, new org.netbeans.lib.awtextra.AbsoluteConstraints(730, 160, 173, 35));

        dateOfBirth.setBackground(new java.awt.Color(255, 255, 255));
        dateOfBirth.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        dateOfBirth.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        year.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        year.setText("Año");
        dateOfBirth.add(year, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 10, -1, -1));

        yearComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        yearComboBox.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "1910", "1911", "1912", "1913", "1914", "1915", "1916", "1917", "1918", "1919", "1920", "1921", "1922", "1923", "1924", "1925", "1926", "1927", "1928", "1929", "1930", "1931", "1932", "1933", "1934", "1935", "1936", "1937", "1938", "1939", "1940", "1941", "1942", "1993", "1944", "1945", "1946", "1947", "1948", "1949", "1950", "1951", "1952", "1953", "1954", "1955", "1956", "1957", "1958", "1959", "1960", "1961", "1962", "1963", "1964", "1965", "1966", "1967", "1968", "1969", "1970", "1971", "1972", "1973", "1974", "1975", "1976", "1977", "1978", "1979", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004" }));
        yearComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        dateOfBirth.add(yearComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 7, -1, -1));

        monthComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        monthComboBox.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre" }));
        monthComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        dateOfBirth.add(monthComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 6, 90, -1));

        month.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        month.setText("Mes");
        dateOfBirth.add(month, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 10, -1, -1));

        dayComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        dayComboBox.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" }));
        dayComboBox.setBorder(null);
        dayComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        dayComboBox.setMinimumSize(new java.awt.Dimension(38, 21));
        dateOfBirth.add(dayComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 6, -1, -1));

        Day.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        Day.setText("Día");
        dateOfBirth.add(Day, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, -1, -1));

        jPanel1.add(dateOfBirth, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 230, 390, -1));

        dateOfBirthLabel.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        dateOfBirthLabel.setText("Fecha de nacimiento");
        dateOfBirthLabel.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jPanel1.add(dateOfBirthLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 200, 158, 29));

        passwordField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(passwordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 320, 173, 35));

        userNameField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(userNameField, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 280, 173, 35));

        cPasswordField.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jPanel1.add(cPasswordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(730, 320, 173, 35));

        userType.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        userType.setText("Tipo de usuario");
        jPanel1.add(userType, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 370, -1, -1));

        userTypeComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        userTypeComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        userTypeComboBox.setMinimumSize(new java.awt.Dimension(103, 21));
        userTypeComboBox.setPreferredSize(new java.awt.Dimension(103, 21));
        userTypeComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                userTypeComboBoxActionPerformed(evt);
            }
        });
        jPanel1.add(userTypeComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 367, -1, -1));

        nationality.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        nationality.setText("Nacionalidad");
        jPanel1.add(nationality, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 400, -1, -1));

        nationalityComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        nationalityComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        nationalityComboBox.setMinimumSize(new java.awt.Dimension(103, 21));
        nationalityComboBox.setPreferredSize(new java.awt.Dimension(103, 21));
        jPanel1.add(nationalityComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 397, -1, -1));

        country.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        country.setText("País");
        jPanel1.add(country, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 430, -1, -1));

        countryComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        countryComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        countryComboBox.setPreferredSize(new java.awt.Dimension(103, 21));
        countryComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                countryComboBoxActionPerformed(evt);
            }
        });
        jPanel1.add(countryComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 427, -1, -1));

        province.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        province.setText("Provincia");
        province.setToolTipText("");
        jPanel1.add(province, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 460, -1, -1));

        provinceComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        provinceComboBox.setPreferredSize(new java.awt.Dimension(103, 22));
        provinceComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                provinceComboBoxActionPerformed(evt);
            }
        });
        jPanel1.add(provinceComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 457, -1, -1));

        canton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        canton.setText("Cantón");
        jPanel1.add(canton, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 490, -1, -1));

        cantonComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        cantonComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        cantonComboBox.setPreferredSize(new java.awt.Dimension(103, 21));
        cantonComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cantonComboBoxActionPerformed(evt);
            }
        });
        jPanel1.add(cantonComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 487, -1, -1));

        district.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        district.setText("Distrito");
        jPanel1.add(district, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 520, -1, -1));

        districtComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        districtComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        districtComboBox.setPreferredSize(new java.awt.Dimension(103, 21));
        districtComboBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                districtComboBoxActionPerformed(evt);
            }
        });
        jPanel1.add(districtComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 517, -1, -1));

        community.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        community.setText("Comunidad");
        jPanel1.add(community, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 550, -1, -1));

        communityComboBox.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        communityComboBox.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        communityComboBox.setPreferredSize(new java.awt.Dimension(103, 21));
        jPanel1.add(communityComboBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 547, -1, -1));

        photoButton.setBackground(new java.awt.Color(222, 4, 11));
        photoButton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        photoButton.setForeground(new java.awt.Color(255, 255, 255));
        photoButton.setText("Foto");
        jPanel1.add(photoButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(790, 540, 110, -1));

        register.setBackground(new java.awt.Color(16, 123, 16));
        register.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        register.setForeground(new java.awt.Color(255, 255, 255));
        register.setText("Registrarse");
        jPanel1.add(register, new org.netbeans.lib.awtextra.AbsoluteConstraints(790, 580, 110, -1));

        photoLabel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/user01.png"))); // NOI18N
        jPanel1.add(photoLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 410, 120, 120));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, 620));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void minizarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_minizarMouseClicked
        this.setState(loginWindow.ICONIFIED);
    }//GEN-LAST:event_minizarMouseClicked

    private void closeWndowMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_closeWndowMouseClicked
        this.setVisible(false);
        loginWindow window = new loginWindow();
    }//GEN-LAST:event_closeWndowMouseClicked

    private void userTypeComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_userTypeComboBoxActionPerformed
        System.out.println(userTypeComboBox.getSelectedItem());
        
        if ("Administrador".equals(Global.userTypesInfo.get(userTypeComboBox.getSelectedIndex()).getName()))
        {   
            String code = JOptionPane.showInputDialog(this,"Digite el código para registrar administrador","Código de acceso",JOptionPane.QUESTION_MESSAGE);
            if (code == null) userTypeComboBox.setSelectedIndex(0);
            else if (!"151622".equals(code))
            {
                JOptionPane.showMessageDialog(this,"Código incorrecto.","Error",JOptionPane.INFORMATION_MESSAGE);
                userTypeComboBox.setSelectedIndex(0);
            }
        }
    }//GEN-LAST:event_userTypeComboBoxActionPerformed

    private void countryComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_countryComboBoxActionPerformed
        try {
            fillProvincesComboBox(Global.countriesInfo.get(countryComboBox.getSelectedIndex()).getId());
        } catch (SQLException ex) {
            Logger.getLogger(registerWindow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_countryComboBoxActionPerformed

    private void provinceComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_provinceComboBoxActionPerformed
        try {
            if (provinceComboBox.getSelectedItem() != null)
                fillCantonsComboBox(Global.provincesInfo.get(provinceComboBox.getSelectedIndex()).getId());
        } catch (SQLException ex) {
            Logger.getLogger(registerWindow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_provinceComboBoxActionPerformed

    private void cantonComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cantonComboBoxActionPerformed
        try {
            if (cantonComboBox.getSelectedItem() != null)
                fillDistrictsComboBox(Global.cantonsInfo.get(cantonComboBox.getSelectedIndex()).getId());
        } catch (SQLException ex) {
            Logger.getLogger(registerWindow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_cantonComboBoxActionPerformed

    private void districtComboBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_districtComboBoxActionPerformed
        try {
            if (districtComboBox.getSelectedItem() != null)
                fillCommunitiesComboBox(Global.districtsInfo.get(districtComboBox.getSelectedIndex()).getId());
        } catch (SQLException ex) {
            Logger.getLogger(registerWindow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_districtComboBoxActionPerformed

    private void fillNationalitiesComboBox() throws SQLException
    {
        ConnectDB.getNationalities();
        for (int nationalityNumber = 0; nationalityNumber < Global.nationalitiesInfo.size(); nationalityNumber++)
        {
            nationalityComboBox.addItem(Global.nationalitiesInfo.get(nationalityNumber).getName());
        }
    }
    
    private void fillCountriesComboBox() throws SQLException
    {
        ConnectDB.getCountries();
        for (int countryNumber = 0; countryNumber < Global.countriesInfo.size(); countryNumber++)
        {
            countryComboBox.addItem(Global.countriesInfo.get(countryNumber).getName());
        }
    }
    
    private void fillProvincesComboBox(int id_country) throws SQLException
    {
        ConnectDB.getProvincesFromCountry(id_country);
        provinceComboBox.removeAllItems();
        for (int provinceNumber = 0; provinceNumber < Global.provincesInfo.size(); provinceNumber++)
        {
            provinceComboBox.addItem(Global.provincesInfo.get(provinceNumber).getName());
        }
    }
    
    private void fillCantonsComboBox(int id_province) throws SQLException
    {
        ConnectDB.getCantonsFromProvince(id_province);
        cantonComboBox.removeAllItems();
        for (int cantonNumber = 0; cantonNumber < Global.cantonsInfo.size(); cantonNumber++)
        {
            cantonComboBox.addItem(Global.cantonsInfo.get(cantonNumber).getName());
        }
    }
    
    private void fillDistrictsComboBox(int id_canton) throws SQLException
    {
        ConnectDB.getDistrictsFromCanton(id_canton);
        districtComboBox.removeAllItems();
        for (int districtNumber = 0; districtNumber < Global.districtsInfo.size(); districtNumber++)
        {
            districtComboBox.addItem(Global.districtsInfo.get(districtNumber).getName());
        }
    }
    
    private void fillCommunitiesComboBox(int id_district) throws SQLException
    {
        ConnectDB.getCommunitiesFromDistrict(id_district);
        communityComboBox.removeAllItems();
        for (int commNumber = 0; commNumber < Global.communitiesInfo.size(); commNumber++)
        {
            communityComboBox.addItem(Global.communitiesInfo.get(commNumber).getName());
        }
    }
    
    private void fillUserTypeComboBox() throws SQLException
    {
        ConnectDB.getUserTypes();
        userTypeComboBox.removeAllItems();
        for (int uTypeNumber = 0; uTypeNumber < Global.userTypesInfo.size(); uTypeNumber++)
        {
            userTypeComboBox.addItem(Global.userTypesInfo.get(uTypeNumber).getName());
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Day;
    private javax.swing.JLabel appName;
    private javax.swing.JTextField cPasswordField;
    private javax.swing.JLabel canton;
    private javax.swing.JComboBox<String> cantonComboBox;
    private javax.swing.JLabel closeWndow;
    private javax.swing.JLabel community;
    private javax.swing.JComboBox<String> communityComboBox;
    private javax.swing.JLabel country;
    private javax.swing.JComboBox<String> countryComboBox;
    private javax.swing.JLabel createAccount;
    private javax.swing.JPanel dateOfBirth;
    private javax.swing.JLabel dateOfBirthLabel;
    private javax.swing.JComboBox<String> dayComboBox;
    private javax.swing.JLabel district;
    private javax.swing.JComboBox<String> districtComboBox;
    private javax.swing.JTextField emailField;
    private javax.swing.JTextField fLastNameField;
    private javax.swing.JTextField identificationField;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel logo;
    private javax.swing.JLabel minizar;
    private javax.swing.JLabel month;
    private javax.swing.JComboBox<String> monthComboBox;
    private javax.swing.JTextField nameField;
    private javax.swing.JLabel nationality;
    private javax.swing.JComboBox<String> nationalityComboBox;
    private javax.swing.JPanel panelMinimizeClose;
    private javax.swing.JTextField passwordField;
    private javax.swing.JTextField phoneField;
    private javax.swing.JButton photoButton;
    private javax.swing.JLabel photoLabel;
    private javax.swing.JLabel province;
    private javax.swing.JComboBox<String> provinceComboBox;
    private javax.swing.JButton register;
    private javax.swing.JTextField sLastNameField;
    private javax.swing.JTextField userNameField;
    private javax.swing.JLabel userType;
    private javax.swing.JComboBox<String> userTypeComboBox;
    private javax.swing.JLabel year;
    private javax.swing.JComboBox<String> yearComboBox;
    // End of variables declaration//GEN-END:variables
}
