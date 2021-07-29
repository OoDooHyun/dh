package du.species.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import du.species.Service.SpeciesService;
import du.species.dao.SpeciesDAO;
import du.species.domain.SpeciesVO;

@Service
public class SpeciesServiceImpl implements SpeciesService{
	@Autowired
	private SpeciesDAO SpeciesDAO;
	
	@Override
	public List<SpeciesVO> selectSpeciesList() {
		return SpeciesDAO.selectSpeciesList();
	}

}
