-- Ensure Raj user exists
INSERT INTO users (first_name, last_name, email, password, role, active, created_at) 
VALUES ('Raj', 'Patel', 'raj@yopmail.com', '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.TVuHOn2', 'Participant', 1, NOW())
ON DUPLICATE KEY UPDATE password = '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.TVuHOn2';

-- Add 10 Hackathons
INSERT INTO hackathons (title, event_type, location, payment, fees, prize_pool, min_team_size, max_team_size, registration_start_date, registration_end_date, status, user_id)
VALUES 
('AI Innovation Challenge', 'Online', 'Remote', 'Free', 0, '$5000', 2, 4, '2026-04-01', '2026-05-01', 'Active', 1),
('Web3 Builders Summit', 'Hybrid', 'San Francisco', 'Paid', 25, '$10000', 3, 5, '2026-04-10', '2026-05-15', 'Active', 1),
('Cloud Native Hack', 'Online', 'Remote', 'Free', 0, 'Cloud Credits', 1, 3, '2026-04-05', '2026-05-20', 'Active', 1),
('CyberShield 2026', 'In-Person', 'New York', 'Paid', 50, '$15000', 2, 2, '2026-04-15', '2026-06-01', 'Active', 1),
('Fintech Future', 'Online', 'Remote', 'Free', 0, '$2000', 2, 4, '2026-04-20', '2026-05-30', 'Active', 1),
('Game Dev Jam', 'Online', 'Remote', 'Free', 0, 'Publishing Deals', 1, 5, '2026-04-01', '2026-04-25', 'Active', 1),
('HealthTech Hack', 'Hybrid', 'Austin', 'Paid', 30, '$7500', 2, 4, '2026-04-12', '2026-05-10', 'Active', 1),
('EduCode 2026', 'Online', 'Remote', 'Free', 0, 'Scholarships', 1, 4, '2026-04-18', '2026-06-15', 'Active', 1),
('Green Earth Hackathon', 'In-Person', 'London', 'Paid', 20, '$5000', 3, 6, '2026-04-05', '2026-05-05', 'Active', 1),
('Mobile App Masters', 'Online', 'Remote', 'Free', 0, '$3000', 1, 3, '2026-04-22', '2026-06-30', 'Active', 1);
