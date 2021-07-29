package du.species.dao;

import java.util.List;

import du.species.domain.SpeciesVO;

public interface SpeciesDAO {
	public List<SpeciesVO> selectSpeciesList();

}
