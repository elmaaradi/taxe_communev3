/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Quartier;
import bean.Rue;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class RueFacade extends AbstractFacade<Rue> {

    @PersistenceContext(unitName = "projet_java_taxPU")
    private EntityManager em;

    public List<Rue> findByQuartier(Quartier quartier) {
        if (quartier != null) {
            return em.createQuery("SELECT r FROM Rue r WHERE r.quartier.id ='" + quartier.getId()+ "'").getResultList();
        }else{
            return findAll();
        }
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RueFacade() {
        super(Rue.class);
    }

}
