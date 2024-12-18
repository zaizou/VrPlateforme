package dz.ifa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import dz.ifa.model.EcritureComptableElementaire;
import dz.ifa.model.EngagementElementaire;
import dz.ifa.model.PieceComptable;
import dz.ifa.service.CompteService;
import dz.ifa.service.EngagementService;
import dz.ifa.service.OperationService;
import dz.ifa.service.PieceComptableService;

@RestController
public class OpBudgWebServiceController {
	@Autowired
	private PieceComptableService pieceComptableService;
	
	@Autowired
	private OperationService operationService;
	
	@Autowired
	private CompteService compteService;
	
	@Autowired
	private EngagementService engagementService;
	
	@RequestMapping(value = "/findPieces", method = RequestMethod.GET)
	public List<PieceComptable> findPieceByTierId(@RequestParam(name="tierId") long tierId,@RequestParam("engaId") long engaId) {
		if (tierId!=0)return  pieceComptableService.findPiecesByTierId(tierId);
		else return engagementService.findPicesByEngaId(engaId);
	}
	
	@RequestMapping(value = "/compteExists", method = RequestMethod.GET)
	public boolean compteExistsByNum(@RequestParam(name="num") String num) {
		if(compteService.findCptByName(num)!=null) return true;
		else return false;
	}
	
	@RequestMapping(value = "/numOpExists", method = RequestMethod.GET)
	public boolean numOpExists(@RequestParam(name="num") String num) {
		if(operationService.getOperationComptableByNum(num)==null) return false;
		else return true;
	}
	
	@RequestMapping(value = "/deleteOpComptById", method = RequestMethod.GET)
	public boolean deleteOpById(@RequestParam(name="opId") long opId) {
		if(operationService.getOperationComptableById(opId)!=null){
			operationService.deleteOperationComptById(opId);
			if(operationService.getOperationComptableById(opId)==null){
				return true;
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
		
		@RequestMapping(value = "/validateOpComptById", method = RequestMethod.GET)
		public boolean validateOpById(@RequestParam(name="opId") long opId) {
			if(operationService.getOperationComptableById(opId)!=null){
				operationService.validateOperationComptById(opId);
				if(operationService.getOperationComptableById(opId).isValide()){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				return true;
			}
		
	}
		@RequestMapping(value = "/getMontantPieceById", method = RequestMethod.GET)
		public double getMontantPieceById(@RequestParam(name="pId") long pId){
			return pieceComptableService.findPieceById(pId).getMontantGlobal();
		}
		
		@RequestMapping(value = "/getEngaElemById", method = RequestMethod.GET)
		public List<EngagementElementaire>getEngaElemById(@RequestParam(name="engaId") long engaId){
			return engagementService.findEngagementById(engaId).getEngagementsElementaires();
		}

}
