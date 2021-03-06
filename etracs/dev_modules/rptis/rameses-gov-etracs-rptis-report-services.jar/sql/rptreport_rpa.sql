[getTaxables]
SELECT 
	pc.objid AS classid,
	pc.name AS classname, 
	SUM(1) AS rpucount,
	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareasqm ELSE 0.0 END ) AS areasqm, 
	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareaha ELSE 0.0 END ) AS areaha, 

	SUM( CASE WHEN r.rputype = 'land' THEN r.totalmv ELSE 0.0 END ) AS landmv,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv <= 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmv175less,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv > 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmvover175,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( r.totalmv ) AS totalmv,
	
	SUM( CASE WHEN r.rputype = 'land' THEN r.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv <= 175000 THEN r.totalav ELSE 0.0 END ) AS bldgav175less,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv > 175000 THEN r.totalav ELSE 0.0 END ) AS bldgavover175,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalav ELSE 0.0 END ) AS otherav, 
	SUM( r.totalav ) AS totalav,
	
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE' and restrictiontype_objid = 'CARP' ) THEN r.totalav ELSE 0.0 END ) AS carpav,
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE' and restrictiontype_objid = 'UNDER_LITIGATION' ) THEN r.totalav ELSE 0.0 END ) AS litigationav,
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE' and restrictiontype_objid  NOT IN ('CARP', 'UNDER_LITIGATION')) THEN r.totalav ELSE 0.0 END ) AS otherrestrictionav,
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE') THEN r.totalav ELSE 0.0 END ) AS totalrestrictionav

FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
WHERE r.taxable = 1 
  AND (
		(f.dtapproved < $P{enddate} AND f.state = 'CURRENT' ) OR 
		(f.dtapproved < $P{enddate} AND f.canceldate >= $P{enddate} AND f.state = 'CANCELLED' )
  )
  ${filter}
GROUP BY pc.objid, pc.name, pc.orderno
ORDER BY pc.orderno  


[getExempts]
SELECT 
	e.objid AS classid,
	e.name AS classname, 
	SUM(1) AS rpucount,
	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareasqm ELSE 0.0 END ) AS areasqm, 
	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareaha ELSE 0.0 END ) AS areaha, 

	SUM( CASE WHEN r.rputype = 'land' THEN r.totalmv ELSE 0.0 END ) AS landmv,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv <= 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmv175less,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv > 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmvover175,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( r.totalmv ) AS totalmv,
	
	SUM( CASE WHEN r.rputype = 'land' THEN r.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv <= 175000 THEN r.totalav ELSE 0.0 END ) AS bldgav175less,
	SUM( CASE WHEN r.rputype = 'bldg' AND r.totalmv > 175000 THEN r.totalav ELSE 0.0 END ) AS bldgavover175,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalav ELSE 0.0 END ) AS otherav, 
	SUM( r.totalav ) AS totalav,
	
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE' and restrictiontype_objid = 'CARP' ) THEN r.totalav ELSE 0.0 END ) AS carpav,
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE' and restrictiontype_objid = 'UNDER_LITIGATION' ) THEN r.totalav ELSE 0.0 END ) AS litigationav,
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE' and restrictiontype_objid  NOT IN ('CARP', 'UNDER_LITIGATION')) THEN r.totalav ELSE 0.0 END ) AS otherrestrictionav,
	SUM( CASE WHEN exists(select * from faas_restriction where parent_objid = f.objid and state = 'ACTIVE') THEN r.totalav ELSE 0.0 END ) AS totalrestrictionav

FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN exemptiontype e ON r.exemptiontype_objid = e.objid 
WHERE r.taxable = 0
  AND (
		(f.dtapproved < $P{enddate} AND f.state = 'CURRENT' ) OR 
		(f.dtapproved < $P{enddate} AND f.canceldate >= $P{enddate} AND f.state = 'CANCELLED' )
  )
  ${filter}
GROUP BY e.objid, e.name, e.orderno 
ORDER BY e.orderno  







[getLiftTaxables]
SELECT 
	pc.objid AS classid,
	pc.name AS classname, 

	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareasqm ELSE 0.0 END ) AS areasqm, 

	SUM( CASE WHEN r.rputype = 'land' THEN 1 ELSE 0 END ) AS countland,
	SUM( CASE WHEN r.rputype = 'bldg' THEN 1 ELSE 0 END ) AS countbldg,
	SUM( CASE WHEN r.rputype = 'mach' THEN 1 ELSE 0 END ) AS countmach,
	SUM( CASE WHEN r.rputype not in ('land', 'bldg', 'mach') THEN 1 ELSE 0 END ) AS countother,
	SUM( 1 ) AS counttotal,


	SUM( CASE WHEN r.rputype = 'land' THEN r.totalmv ELSE 0.0 END ) AS landmv,
	SUM( CASE WHEN pc.name='RESIDENTIAL' and r.rputype = 'bldg' AND r.totalmv <= 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmv175less,
	SUM( CASE WHEN pc.name='RESIDENTIAL' and r.rputype = 'bldg' AND r.totalmv > 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmvover175,
	SUM( CASE WHEN  pc.name <> 'RESIDENTIAL' and r.rputype = 'bldg' THEN r.totalmv ELSE 0.0 END ) AS bldgmv,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( r.totalmv ) AS totalmv,
	
	SUM( CASE WHEN r.rputype = 'land' THEN r.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN r.rputype = 'bldg' THEN r.totalav ELSE 0.0 END ) AS bldgav,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalav ELSE 0.0 END ) AS otherav, 
	SUM( r.totalav ) AS totalav
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
WHERE r.taxable = 1 
  AND (
		(f.dtapproved < $P{enddate} AND f.state = 'CURRENT' ) OR 
		(f.dtapproved < $P{enddate} AND f.canceldate >= $P{enddate} AND f.state = 'CANCELLED' )
  )
  ${filter}
GROUP BY pc.objid, pc.name, pc.orderno
ORDER BY pc.orderno  


[getLiftExempts]
SELECT 
	e.objid AS classid,
	e.name AS classname, 
	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareasqm ELSE 0.0 END ) AS areasqm, 

	SUM( CASE WHEN r.rputype = 'land' THEN 1 ELSE 0 END ) AS countland,
	SUM( CASE WHEN r.rputype = 'bldg' THEN 1 ELSE 0 END ) AS countbldg,
	SUM( CASE WHEN r.rputype = 'mach' THEN 1 ELSE 0 END ) AS countmach,
	SUM( CASE WHEN r.rputype not in ('land', 'bldg', 'mach') THEN 1 ELSE 0 END ) AS countother,
	SUM( 1 ) AS counttotal,


	SUM( CASE WHEN r.rputype = 'land' THEN r.totalmv ELSE 0.0 END ) AS landmv,
	SUM( 0 ) AS bldgmv175less,
	SUM( 0 ) AS bldgmvover175,
	SUM( case when r.rputype = 'bldg' THEN r.totalmv ELSE 0.0 END ) AS bldgmv,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( r.totalmv ) AS totalmv,
	
	SUM( CASE WHEN r.rputype = 'land' THEN r.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN r.rputype = 'bldg' THEN r.totalav ELSE 0.0 END ) AS bldgav,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalav ELSE 0.0 END ) AS otherav, 
	SUM( r.totalav ) AS totalav

FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc on r.classification_objid = pc.objid
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN exemptiontype e ON r.exemptiontype_objid = e.objid 
WHERE r.taxable = 0
  AND (
		(f.dtapproved < $P{enddate} AND f.state = 'CURRENT' ) OR 
		(f.dtapproved < $P{enddate} AND f.canceldate >= $P{enddate} AND f.state = 'CANCELLED' )
  )
  ${filter}
GROUP BY e.objid, e.name, e.orderno 
ORDER BY e.orderno  




[getLiftIdleLandTaxables]
SELECT 
	pc.objid AS classid,
	pc.name AS classname, 

	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareasqm ELSE 0.0 END ) AS areasqm, 

	SUM( CASE WHEN r.rputype = 'land' THEN 1 ELSE 0 END ) AS countland,
	SUM( CASE WHEN r.rputype = 'bldg' THEN 1 ELSE 0 END ) AS countbldg,
	SUM( CASE WHEN r.rputype = 'mach' THEN 1 ELSE 0 END ) AS countmach,
	SUM( CASE WHEN r.rputype not in ('land', 'bldg', 'mach') THEN 1 ELSE 0 END ) AS countother,
	SUM( 1 ) AS counttotal,


	SUM( CASE WHEN r.rputype = 'land' THEN r.totalmv ELSE 0.0 END ) AS landmv,
	SUM( CASE WHEN pc.name='RESIDENTIAL' and r.rputype = 'bldg' AND r.totalmv <= 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmv175less,
	SUM( CASE WHEN pc.name='RESIDENTIAL' and r.rputype = 'bldg' AND r.totalmv > 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmvover175,
	SUM( CASE WHEN  pc.name <> 'RESIDENTIAL' and r.rputype = 'bldg' THEN r.totalmv ELSE 0.0 END ) AS bldgmv,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( r.totalmv ) AS totalmv,
	
	SUM( CASE WHEN r.rputype = 'land' THEN r.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN r.rputype = 'bldg' THEN r.totalav ELSE 0.0 END ) AS bldgav,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalav ELSE 0.0 END ) AS otherav, 
	SUM( r.totalav ) AS totalav
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN landrpu lr ON f.rpuid = lr.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
WHERE r.taxable = 1 and lr.idleland = 1 
  AND (
		(f.dtapproved < $P{enddate} AND f.state = 'CURRENT' ) OR 
		(f.dtapproved < $P{enddate} AND f.canceldate >= $P{enddate} AND f.state = 'CANCELLED' )
  )
  ${filter}
GROUP BY pc.objid, pc.name, pc.orderno
ORDER BY pc.orderno  


[getLiftIdleLandExempts]
SELECT 
	e.objid AS classid,
	e.name AS classname, 
	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareasqm ELSE 0.0 END ) AS areasqm, 

	SUM( CASE WHEN r.rputype = 'land' THEN 1 ELSE 0 END ) AS countland,
	SUM( CASE WHEN r.rputype = 'bldg' THEN 1 ELSE 0 END ) AS countbldg,
	SUM( CASE WHEN r.rputype = 'mach' THEN 1 ELSE 0 END ) AS countmach,
	SUM( CASE WHEN r.rputype not in ('land', 'bldg', 'mach') THEN 1 ELSE 0 END ) AS countother,
	SUM( 1 ) AS counttotal,


	SUM( CASE WHEN r.rputype = 'land' THEN r.totalmv ELSE 0.0 END ) AS landmv,
	SUM( 0 ) AS bldgmv175less,
	SUM( 0) AS bldgmvover175,
	SUM( CASE WHEN  r.rputype = 'bldg' THEN r.totalmv ELSE 0.0 END ) AS bldgmv,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( r.totalmv ) AS totalmv,
	
	SUM( CASE WHEN r.rputype = 'land' THEN r.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN r.rputype = 'bldg' THEN r.totalav ELSE 0.0 END ) AS bldgav,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalav ELSE 0.0 END ) AS otherav, 
	SUM( r.totalav ) AS totalav

FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN landrpu lr ON f.rpuid = lr.objid 
	INNER JOIN propertyclassification pc on r.classification_objid = pc.objid
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN exemptiontype e ON r.exemptiontype_objid = e.objid 
WHERE r.taxable = 0 and lr.idleland = 1 
  AND (
		(f.dtapproved < $P{enddate} AND f.state = 'CURRENT' ) OR 
		(f.dtapproved < $P{enddate} AND f.canceldate >= $P{enddate} AND f.state = 'CANCELLED' )
  )
  ${filter}
GROUP BY e.objid, e.name, e.orderno 
ORDER BY e.orderno  




[getLiftRestrictions]
SELECT 
	frt.name AS restriction, 
	frt.idx, 

	pc.objid AS classid,
	pc.name AS classname, 
	pc.orderno,


	SUM(CASE WHEN r.rputype = 'land' and rp.claimno is null THEN r.totalareasqm ELSE 0.0 END ) AS areasqm, 

	SUM( CASE WHEN r.rputype = 'land' THEN 1 ELSE 0 END ) AS countland,
	SUM( CASE WHEN r.rputype = 'bldg' THEN 1 ELSE 0 END ) AS countbldg,
	SUM( CASE WHEN r.rputype = 'mach' THEN 1 ELSE 0 END ) AS countmach,
	SUM( CASE WHEN r.rputype not in ('land', 'bldg', 'mach') THEN 1 ELSE 0 END ) AS countother,
	SUM( 1 ) AS counttotal,


	SUM( CASE WHEN r.rputype = 'land' THEN r.totalmv ELSE 0.0 END ) AS landmv,
	SUM( CASE WHEN pc.name='RESIDENTIAL' and r.rputype = 'bldg' AND r.totalmv <= 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmv175less,
	SUM( CASE WHEN pc.name='RESIDENTIAL' and r.rputype = 'bldg' AND r.totalmv > 175000 THEN r.totalmv ELSE 0.0 END ) AS bldgmvover175,
	SUM( CASE WHEN  pc.name <> 'RESIDENTIAL' and r.rputype = 'bldg' THEN r.totalmv ELSE 0.0 END ) AS bldgmv,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalmv ELSE 0.0 END ) AS machmv,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalmv ELSE 0.0 END ) AS othermv, 
	SUM( r.totalmv ) AS totalmv,
	
	SUM( CASE WHEN r.rputype = 'land' THEN r.totalav ELSE 0.0 END ) AS landav,
	SUM( CASE WHEN r.rputype = 'bldg' THEN r.totalav ELSE 0.0 END ) AS bldgav,
	SUM( CASE WHEN r.rputype = 'mach' THEN r.totalav ELSE 0.0 END ) AS machav,
	SUM( CASE WHEN rputype NOT IN( 'land', 'bldg', 'mach') THEN r.totalav ELSE 0.0 END ) AS otherav, 
	SUM( r.totalav ) AS totalav
FROM faas_restriction fr 
	inner join faas_restriction_type frt on fr.restrictiontype_objid = frt.objid 
	inner join faas f on fr.parent_objid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
WHERE fr.state='ACTIVE'
  and (
		(f.dtapproved < $P{enddate} AND f.state = 'CURRENT' ) OR 
		(f.dtapproved < $P{enddate} AND f.canceldate >= $P{enddate} AND f.state = 'CANCELLED' )
  )
  and fr.state = 'ACTIVE'
  ${filter}
GROUP BY frt.name, frt.idx, pc.objid, pc.name, pc.orderno 
ORDER BY frt.idx, pc.orderno 