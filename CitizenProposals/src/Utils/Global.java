/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFileChooser;

/**
 *
 * @author lin
 */
public class Global {
    public static String user_type = "";
    public static int id_user = -1;
    public static int login_result = -1;
    public static int insert_result = -1;
    public static List<CatalogueContainer> countriesInfo = new ArrayList<>();
    public static List<CatalogueContainer> nationalitiesInfo = new ArrayList<>();
    public static List<CatalogueContainer> provincesInfo = new ArrayList<>();
    public static List<CatalogueContainer> cantonsInfo = new ArrayList<>();
    public static List<CatalogueContainer> districtsInfo = new ArrayList<>();
    public static List<CatalogueContainer> communitiesInfo = new ArrayList<>();
    public static List<CatalogueContainer> userTypesInfo = new ArrayList<>();
    public static JFileChooser photoChooser = new JFileChooser("C:\\Users\\lin\\OneDrive - Estudiantes ITCR\\TEC\\2019 - II\\BD I\\Proyectos\\P1\\Imágenes Usuarios");
    
        public static boolean isNumeric(String s) {

        boolean result;

        try {
            Integer.parseInt(s);
            result = true;
        } catch (NumberFormatException excepcion) {
            result = false;
        }

        return result;
    }
    
    public static boolean hasNumbers(String s){
        for(char c : s.toCharArray()) {
            if(Character.isDigit(c)) {
                return true;
            }
        }
        return false;
    }
}
