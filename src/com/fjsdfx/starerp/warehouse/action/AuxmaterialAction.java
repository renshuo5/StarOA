package com.fjsdfx.starerp.warehouse.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Scope;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.item.model.ItemType;
import com.fjsdfx.starerp.item.service.ItemTypeService;
import com.fjsdfx.starerp.purchase.model.Quaprolist;
import com.fjsdfx.starerp.purchase.model.Supplierinfo;
import com.fjsdfx.starerp.purchase.service.QuaprolistService;
import com.fjsdfx.starerp.purchase.service.SupplierinfoService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.warehouse.model.Auxmaterial;
import com.fjsdfx.starerp.warehouse.model.Maccounting;
import com.fjsdfx.starerp.warehouse.service.AuxmaterialService;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;
import com.sun.org.apache.bcel.internal.classfile.PMGClass;

@Controller
@Scope("prototype")
public class AuxmaterialAction {

	private Auxmaterial auxmaterial;

	private Integer auxmaterialId;

	private List<Auxmaterial> auxmaterials;

	private AuxmaterialService auxmaterialService;

	private Quaprolist quaprolist;

	private Integer quaprolistId;

	private QuaprolistService quaprolistService;

	private Logger logger = LoggerFactory.getLogger(AuxmaterialAction.class);

	private PagerModel pm;

	private Supplierinfo supplierinfo;

	private Integer supplierinfoId;

	private SupplierinfoService supplierinfoService;

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {

		quaprolist = quaprolistService.findById(Quaprolist.class, quaprolistId);
		auxmaterial.setQuaprolist(quaprolist);
		auxmaterialService.saveAndRefresh(auxmaterial);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger.warn(currentUser.getId() + " save auxmaterial  " + auxmaterial.getId());
		return "pub_add_success";
	}

	public String addInput() {
		return "add_input";
	}

	/***
	 * 删除
	 * 
	 * @return
	 */
	public String del() {
		auxmaterialService.deleteById(Auxmaterial.class, auxmaterialId);
		User currentUser = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		logger
				.warn(currentUser.getId() + " delete auxmaterial  "
						+ auxmaterialId);
		return "pub_del_success";
	}

	public String list() {
		pm = auxmaterialService.getPagerDesc(Auxmaterial.class);
		return "list";
	}

	/**
	 *查询
	 * 
	 * @return
	 */
	public String search() {
		Map<String, String> like = new HashMap<String, String>();
		like.put("quaprolist.supplierinfo.supcname", auxmaterial
				.getQuaprolist().getSupplierinfo().getSupcname());
		pm = auxmaterialService.fuzzyQuery(Auxmaterial.class, like);
		return "list";
	}

	public void setAuxmaterial(Auxmaterial auxmaterial) {
		this.auxmaterial = auxmaterial;
	}

	public void setAuxmaterialId(Integer auxmaterialId) {
		this.auxmaterialId = auxmaterialId;
	}

	public void setAuxmaterials(List<Auxmaterial> auxmaterials) {
		this.auxmaterials = auxmaterials;
	}

	@Resource
	public void setAuxmaterialService(AuxmaterialService auxmaterialService) {
		this.auxmaterialService = auxmaterialService;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}

	public void setSupplierinfo(Supplierinfo supplierinfo) {
		this.supplierinfo = supplierinfo;
	}

	public void setSupplierinfoId(Integer supplierinfoId) {
		this.supplierinfoId = supplierinfoId;
	}

	@Resource
	public void setSupplierinfoService(SupplierinfoService supplierinfoService) {
		this.supplierinfoService = supplierinfoService;
	}

	public Quaprolist getQuaprolist() {
		return quaprolist;
	}

	public void setQuaprolist(Quaprolist quaprolist) {
		this.quaprolist = quaprolist;
	}

	public Integer getQuaprolistId() {
		return quaprolistId;
	}

	public void setQuaprolistId(Integer quaprolistId) {
		this.quaprolistId = quaprolistId;
	}

	public QuaprolistService getQuaprolistService() {
		return quaprolistService;
	}

	@Resource
	public void setQuaprolistService(QuaprolistService quaprolistService) {
		this.quaprolistService = quaprolistService;
	}

	public Auxmaterial getAuxmaterial() {
		return auxmaterial;
	}

	public Integer getAuxmaterialId() {
		return auxmaterialId;
	}

	public List<Auxmaterial> getAuxmaterials() {
		return auxmaterials;
	}

	public AuxmaterialService getAuxmaterialService() {
		return auxmaterialService;
	}

	public Logger getLogger() {
		return logger;
	}

	public PagerModel getPm() {
		return pm;
	}

	public Supplierinfo getSupplierinfo() {
		return supplierinfo;
	}

	public Integer getSupplierinfoId() {
		return supplierinfoId;
	}

	public SupplierinfoService getSupplierinfoService() {
		return supplierinfoService;
	}
}
