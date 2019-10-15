/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lin
 */
public class Global {
    public static String user_type = "";
    public static int id_user = -1;
    public static int login_result = -1;
    public static List<CatalogueContainer> countriesInfo = new ArrayList<>();
    public static List<CatalogueContainer> nationalitiesInfo = new ArrayList<>();
    public static List<CatalogueContainer> provincesInfo = new ArrayList<>();
    public static List<CatalogueContainer> cantonsInfo = new ArrayList<>();
    public static List<CatalogueContainer> districtsInfo = new ArrayList<>();
    public static List<CatalogueContainer> communitiesInfo = new ArrayList<>();
    public static List<CatalogueContainer> userTypesInfo = new ArrayList<>();
}
