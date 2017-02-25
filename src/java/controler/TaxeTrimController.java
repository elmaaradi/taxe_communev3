package controler;

import bean.Locale;
import bean.Redevable;
import bean.TaxeTrim;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import service.TaxeTrimFacade;

import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import service.LocaleFacade;
import service.RedevableFacade;

@Named("taxeTrimController")
@SessionScoped
public class TaxeTrimController implements Serializable {

    @EJB
    private service.TaxeTrimFacade ejbFacade;
    @EJB
    private RedevableFacade redevableFacade;
    @EJB
    private LocaleFacade localeFacade;
    private List<TaxeTrim> items = null;
    private TaxeTrim selected;
    private String cin;
    private String rc;
    private Redevable redevable;

    public void findRedevableByCin() {
        redevable.setLocales(localeFacade.findByRedevableCin(cin));
        redevable = findRedevable();
    }

    public void findRedevableByRc() {
        redevable.setLocales(localeFacade.findByRedevableRc(rc));
        redevable = findRedevable();
    }

    public Redevable findRedevable() {
        Redevable redevable1 = new Redevable(rc, cin);
        if (!redevableFacade.findByCinOrRc(redevable1).isEmpty()) {
            return redevableFacade.findByCinOrRc(redevable1).get(0);
        } else {
            return null;
        }

    }

    public TaxeTrimController() {
    }

    public TaxeTrim getSelected() {
        if (selected == null) {
            selected = new TaxeTrim();
        }
        return selected;
    }

    public void setSelected(TaxeTrim selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private TaxeTrimFacade getFacade() {
        return ejbFacade;
    }

    public TaxeTrim prepareCreate() {
        selected = new TaxeTrim();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("TaxeTrimCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("TaxeTrimUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("TaxeTrimDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<TaxeTrim> getItems() {
        if (items == null) {
            items = getFacade().findAll();
        }
        return items;
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction != PersistAction.DELETE) {
                    getFacade().edit(selected);
                } else {
                    getFacade().remove(selected);
                }
                JsfUtil.addSuccessMessage(successMessage);
            } catch (EJBException ex) {
                String msg = "";
                Throwable cause = ex.getCause();
                if (cause != null) {
                    msg = cause.getLocalizedMessage();
                }
                if (msg.length() > 0) {
                    JsfUtil.addErrorMessage(msg);
                } else {
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            }
        }
    }

    public TaxeTrim getTaxeTrim(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<TaxeTrim> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<TaxeTrim> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    public RedevableFacade getRedevableFacade() {
        if (redevableFacade == null) {
            redevableFacade = new RedevableFacade();
        }
        return redevableFacade;
    }

    public void setRedevableFacade(RedevableFacade redevableFacade) {
        this.redevableFacade = redevableFacade;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getRc() {
        return rc;
    }

    public void setRc(String rc) {
        this.rc = rc;
    }

    @FacesConverter(forClass = TaxeTrim.class)
    public static class TaxeTrimControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            TaxeTrimController controller = (TaxeTrimController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "taxeTrimController");
            return controller.getTaxeTrim(getKey(value));
        }

        java.lang.Long getKey(String value) {
            java.lang.Long key;
            key = Long.valueOf(value);
            return key;
        }

        String getStringKey(java.lang.Long value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof TaxeTrim) {
                TaxeTrim o = (TaxeTrim) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), TaxeTrim.class.getName()});
                return null;
            }
        }

    }

    public LocaleFacade getLocaleFacade() {
        return localeFacade;
    }

    public void setLocaleFacade(LocaleFacade localeFacade) {
        this.localeFacade = localeFacade;
    }

    public Redevable getRedevable() {
        if(redevable==null){
            redevable=new Redevable();
        }
        return redevable;
    }

    public void setRedevable(Redevable redevable) {
        this.redevable = redevable;
    }

}
