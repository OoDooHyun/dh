package du.species.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import du.species.dao.SpeciesDAO;
import du.species.domain.SpeciesVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class SpeciesDAOImpl extends EgovAbstractMapper implements SpeciesDAO {

	@Override
	public List<SpeciesVO> selectSpeciesList() {
		return selectList("Species.selectSpeciesList");
	}

}
