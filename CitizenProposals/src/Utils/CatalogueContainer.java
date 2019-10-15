/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author lin
 */
public class CatalogueContainer {
    private String name;
    private int id;
    
    public CatalogueContainer(int id, String name)
    {
        this.id = id;
        this.name = name;
    }
    
    public String getName()
    {
        return this.name;
    }
    
    public int getId()
    {
        return this.id;
    }
}
