-- Data quality check
SELECT *
FROM election_survey
LIMIT 10;

SELECT
    candidate_supported,
    COUNT(*) AS votes
FROM election_survey
GROUP BY candidate_supported
ORDER BY votes DESC;

SELECT
    candidate_supported,
    COUNT(*) AS votes,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM election_survey),
        2
    ) AS vote_percentage
FROM election_survey
GROUP BY candidate_supported
ORDER BY vote_percentage DESC;

SELECT
    sex,
    COUNT(*) AS respondents
FROM election_survey
GROUP BY sex;

SELECT
    age_range,
    COUNT(*) AS respondents
FROM election_survey
GROUP BY age_range
ORDER BY respondents DESC;

SELECT
    state,
    COUNT(*) AS respondents
FROM election_survey
GROUP BY state
ORDER BY respondents DESC;

SELECT
    sex,
    candidate_supported,
    COUNT(*) AS votes
FROM election_survey
GROUP BY sex, candidate_supported
ORDER BY sex;

SELECT
    age_range,
    candidate_supported,
    COUNT(*) AS votes
FROM election_survey
GROUP BY age_range, candidate_supported
ORDER BY age_range;


SELECT
    state,
    candidate_supported,
    COUNT(*) AS votes
FROM election_survey
GROUP BY state, candidate_supported
ORDER BY state;

SELECT
    candidate_supported,
    ROUND(
        AVG(perceptions_of_electoral_integrity_index),
        2
    ) AS avg_integrity
FROM election_survey
GROUP BY candidate_supported
ORDER BY avg_integrity DESC;

SELECT
    state,
    ROUND(
        AVG(perceptions_of_electoral_integrity_index),
        2
    ) AS avg_integrity
FROM election_survey
GROUP BY state
ORDER BY avg_integrity DESC;



SELECT
    state,
    ROUND(
        AVG(perceptions_of_electoral_integrity_index),
        2
    ) AS avg_integrity
FROM election_survey
GROUP BY state
ORDER BY avg_integrity DESC
LIMIT 10;



SELECT
    state,
    ROUND(
        AVG(perceptions_of_electoral_integrity_index),
        2
    ) AS avg_integrity
FROM election_survey
GROUP BY state
ORDER BY avg_integrity ASC
LIMIT 10;

SELECT
    MIN(perceptions_of_electoral_integrity_index) AS min_score,
    MAX(perceptions_of_electoral_integrity_index) AS max_score,
    AVG(perceptions_of_electoral_integrity_index) AS avg_score,
    STDDEV(perceptions_of_electoral_integrity_index) AS std_dev
FROM election_survey;



SELECT
    voter_id,
    COUNT(*)
FROM election_survey
GROUP BY voter_id
HAVING COUNT(*) > 1;

SELECT
    candidate_supported,
    COUNT(DISTINCT voter_id) AS unique_votes
FROM election_survey
GROUP BY candidate_supported;



SELECT
    state,
    COUNT(*) AS respondents
FROM election_survey
GROUP BY state
HAVING COUNT(*) > 10
ORDER BY respondents DESC;

SELECT
    candidate_supported,
    state,
    COUNT(*) AS votes
FROM election_survey
GROUP BY candidate_supported, state
ORDER BY votes DESC;



SELECT
    state,
    candidate_supported,
    COUNT(*) AS votes,
    RANK() OVER(
        PARTITION BY state
        ORDER BY COUNT(*) DESC
    ) AS ranking
FROM election_survey
GROUP BY state, candidate_supported;

WITH state_scores AS (
    SELECT
        state,
        AVG(perceptions_of_electoral_integrity_index) AS score
    FROM election_survey
    GROUP BY state
)


SELECT *
FROM state_scores
WHERE score > 60
ORDER BY score DESC;

WITH candidate_votes AS (
    SELECT
        candidate_supported,
        COUNT(*) AS votes
    FROM election_survey
    GROUP BY candidate_supported
)
      
      
      SELECT *,
       RANK() OVER(ORDER BY votes DESC) AS vote_rank
FROM candidate_votes;



SELECT
    CASE
        WHEN perceptions_of_electoral_integrity_index >= 70 THEN 'High'
        WHEN perceptions_of_electoral_integrity_index >= 50 THEN 'Medium'
        ELSE 'Low'
    END AS trust_level,
    COUNT(*) AS respondents
FROM election_survey
GROUP BY trust_level;



SELECT
    state,
    ROUND(AVG(perceptions_of_electoral_integrity_index),2) AS score
FROM election_survey
GROUP BY state
ORDER BY score DESC;



CREATE VIEW candidate_summary AS
SELECT
    candidate_supported,
    COUNT(*) AS votes,
    ROUND(
        AVG(perceptions_of_electoral_integrity_index),
        2
    ) AS avg_integrity
FROM election_survey
GROUP BY candidate_supported;



SELECT *
FROM candidate_summary;