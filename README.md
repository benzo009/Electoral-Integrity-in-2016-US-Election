# Electoral-Integrity-in-2016-US-Election
The Perceptions of Electoral Integrity (PEI) survey asks experts to evaluate elections according to 49 indicators, grouped into eleven categories reflecting the whole electoral cycle.
The PEI dataset is designed to provide a comprehensive, systematic and reliable way to monitor the quality of elections worldwide.
This project analyzes voting patterns,
candidate performance, voter turnout,
and state-level election results.


# US Election Survey Analysis

## Project Overview

Analyzed voter preferences, demographic trends, and electoral integrity perceptions.



## Sample Query

SELECT
    candidate_supported,
    COUNT(*) AS votes
FROM election_survey
GROUP BY candidate_supported;

##  Findings

- Trump received the highest support among respondents.
- Electoral integrity perceptions varied significantly by state.
- Voting preferences differed across age groups and gender.
