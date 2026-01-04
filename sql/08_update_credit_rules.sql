UPDATE credit_rule
SET term_id = '2025-2026-fall', update_time = NOW()
WHERE term_id IN ('a_2024-2025-1', '2024_fall');

UPDATE credit_rule
SET term_id = '2025-2026-spring', update_time = NOW()
WHERE term_id IN ('a_2024-2025-2', '2024_spring', '2025_spring');
