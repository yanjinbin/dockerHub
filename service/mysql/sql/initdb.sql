-- 创建数据库
CREATE
DATABASE  `nacos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE
DATABASE  `dentist_ease_admin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE
DATABASE  `dentist_ease_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 授予权限
grant all PRIVILEGES on nacos.* to test_01@'%';
grant all PRIVILEGES on dentist_ease_admin.* to test_01@'%';
grant all PRIVILEGES on dentist_ease_app.* to test_01@'%';

flush
privileges;