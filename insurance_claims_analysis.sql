--=======================================================================
-- INSURANCE CLAIMS ANALYSIS
/* Business Question: What does the insurance claims dataset look like
overall, including the number of claims and the range and average of
claim amounts? */
-- Data Overview
--=======================================================================
SELECT COUNT(*) AS total_claims,
	ROUND(SUM(total_claim_amount), 2) AS total_claim_dollars,
	ROUND(AVG(total_claim_amount), 2) AS average_claim_amount,
	ROUND(MIN(total_claim_amount), 2) AS lowest_claim_amount,
	ROUND(MAX(total_claim_amount), 2) AS highest_claim_amount
FROM public.claims;

--======================================================================
-- Claim Volume by Incident Type
/* Business Question: Which type of incidents account for the most 
nsurance claims? */
--======================================================================
SELECT incident_type, COUNT(*) AS claim_count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM public.claims), 2
	) AS claim_percentage
FROM public.claims
GROUP BY incident_type
ORDER BY claim_percentage DESC;

--======================================================================
-- Claim Severity Summary
/* Business Question: How are claims distributed across different 
levels of incident severity, and how does claim severity relate to 
average claim cost? */
--======================================================================
SELECT incident_severity, COUNT(*) AS claim_count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM public.claims), 2)
	AS claim_percentage,
	ROUND(AVG(total_claim_amount), 2) AS average_claim_amount
FROM public.claims
GROUP BY incident_severity
ORDER BY average_claim_amount DESC;

--======================================================================
-- Fraud Summary
/* Business Question: How do reported-fraud claims compare with 
non-fraud claims in terms of claim volume and average claim cost? */
--======================================================================
SELECT fraud_reported, COUNT(*) AS claim_count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM public.claims), 2)
	AS claim_percentage,
	ROUND(AVG(total_claim_amount), 2) AS average_claim_amount
FROM public.claims
GROUP BY fraud_reported
ORDER BY average_claim_amount DESC;

--======================================================================
-- Claim Cost by Incident Type
/* Business Question: Which types of incidents have the highest average
and highest individual claim costs? */
--======================================================================
SELECT incident_type, COUNT(*) AS claim_count,
	ROUND(AVG(total_claim_amount), 2) AS average_claim_amount,
	ROUND(MAX(total_claim_amount), 2) AS highest_claim_amount
FROM public.claims
GROUP BY incident_type
ORDER BY average_claim_amount DESC;

--======================================================================
-- ClaimCost by Policy Deductible
/* Business Question: How does average claim cost vary across different
policy deductible amounts? */
--======================================================================
SELECT policy_deductable, COUNT(*) AS claim_count,
	ROUND(AVG(total_claim_amount), 2) AS average_claim_amount
FROM public.claims
GROUP BY policy_deductable
ORDER BY average_claim_amount DESC;

--======================================================================
-- Claim Cost by Vehicle Make
/* Business Question: Which vehicle makes have the highest average 
claim costs? */
--======================================================================
SELECT auto_make, COUNT(*) AS claim_count,
	ROUND(AVG(total_claim_amount), 2) AS average_claim_amount,
	ROUND(MAX(total_claim_amount), 2) AS highest_claim_amount
FROM public.claims
GROUP BY auto_make
HAVING COUNT(*) >= 20
ORDER BY average_claim_amount DESC;

--======================================================================
-- Fraud Rate by Incident Type and Occupation
/* Business Question: Which combinations of incident type and insured
occupation have the highest reported-fraud rates? */
--======================================================================
SELECT incident_type, insured_occupation, COUNT(*) AS claim_count,
	SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END) AS fraud_claims,
	ROUND(100.0 * SUM(CASE WHEN fraud_reported = 'Y' THEN 1 ELSE 0 END)
		/ COUNT(*), 2) AS fraud_rate
FROM public.claims
GROUP BY incident_type, insured_occupation
HAVING COUNT(*) >= 10
ORDER BY fraud_rate DESC;

--=====================================================================
-- KEY FINDINGS
--=====================================================================
-- 1. Multi-vehicle collisions were the most common incident type, 
		-- accounting for 41.9% of all claims.
-- 2. Single-vehicle collisions had the highest average claim amount
		-- by incident type at $64,445.46.
-- 3. Major-damage claims had the highest average claim amount by
		-- severity at $64,067.17.
-- 4. Reported-fraud claims represented 24.7% of all claims and had
		-- a higher average claim amount ($60,302.11) than claims
		-- not reported as fraud ($50,288.61).
-- 5. Exec-managerial had the highest reported-fraud among occupations
		-- with at least 20 claims, at 36.84%. 
-- 6. Single-vehicle collisions among tech-support occupations had the
		-- highest incident-type/occupation fraud rate at 48.39% 
		-- (15 of 31 claims).
-- 7. New York had the highest average claim amount by incident state
		-- at $56,388.44.
-- 8. Ford had the highest average claim amount among vehicle makes
		-- with at least 20 claims, at $56,570.14.
