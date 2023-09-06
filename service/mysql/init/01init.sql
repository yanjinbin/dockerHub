-- 创建用户
CREATE USER 'test_01'@'%' IDENTIFIED BY '123456';
CREATE USER 'nacos'@'%' IDENTIFIED BY 'nacos';

-- 创建数据库
CREATE
DATABASE  `nacos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE
DATABASE  `dentist_ease_admin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE
DATABASE  `dentist_ease_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE
DATABASE  `xxl_job` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 授予权限
grant all PRIVILEGES on nacos.* to nacos@'%';
grant all PRIVILEGES on dentist_ease_admin.* to test_01@'%';
grant all PRIVILEGES on dentist_ease_app.* to test_01@'%';
grant all PRIVILEGES on xxl_job.* to test_01@'%';


flush
privileges;
