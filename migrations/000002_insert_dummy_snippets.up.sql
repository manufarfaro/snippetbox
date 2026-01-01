INSERT INTO snippets (title, content, created_at, expires_at) VALUES
('An old silent pond', E'An old silent pond...\nA frog jumps into the pond,\nsplash! Silence again.\n\n- Matsuo Bashō', NOW(), NOW() + INTERVAL '1 year'),
('Over the wintry forest', E'Over the wintry forest...\nWinds howl in rage\nwith no leaves to blow.\n\n- Natsume Soseki', NOW(), NOW() + INTERVAL '1 year'),
('First autumn morning', E'First autumn morning...\nThe mirror I stare into\nshows my father''s face.\n\n- Murakami Kijo', NOW(), NOW() + INTERVAL '7 days');