/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Redevable;
import controler.util.SearchUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class RedevableFacade extends AbstractFacade<Redevable> {

    @PersistenceContext(unitName = "projet_java_taxPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RedevableFacade() {
        super(Redevable.class);
    }

    public List<Redevable> findByCinOrRc(Redevable redevable) {
        String requette = "SELECT r FROM Redevable r WHERE 1=1";
       // requette += SearchUtil.addConstraint("r", "id", "=", redevable.getId());
        if (redevable.getCin()!=null) {
            requette += SearchUtil.addConstraint("r", "cin", "=", redevable.getCin());
        }
        if (redevable.getRc()!=null) {
            requette += SearchUtil.addConstraint("r", "rc", "=", redevable.getRc());
        }
        if (!"".equals(redevable.getPattente())) {
            requette += SearchUtil.addConstraint("r", "pattente", "=", redevable.getPattente());
        }
        return em.createQuery(requette).getResultList();
    }

    public List<Redevable> findByCin(String redevable) {
        return em.createQuery("SELECT r FROM Redevable r WHERE r.cin= '" + redevable + "'").getResultList();
    }

    public List<Redevable> findByRc(String redevable) {
        return em.createQuery("SELECT r FROM Redevable r WHERE r.rc='" + redevable + "'").getResultList();
    }
}
