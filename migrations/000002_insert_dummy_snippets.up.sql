INSERT INTO snippets (title, content, created_at, expires_at) VALUES
('An old silent pond', 'An old silent pond...\n A frog jumps into the pond, splash! Silence again.\n\n- Matsuo Bashō', NOW(), NOW() + INTERVAL '1 year'),
('Over the wintry forest', 'Over the wintry forest...\n Winds howl in rage with no leaves to blow.\n\n- Natsume Soseki', NOW(), NOW() + INTERVAL '1 year'),
('First autumn morning', 'First autumn morning...\n The mirror I stare into\nshows my father''s face.\n\n- Murakami Kijo', NOW(), NOW() + INTERVAL '7 days');