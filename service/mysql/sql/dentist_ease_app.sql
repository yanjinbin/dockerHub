
USE dentist_ease_app;

DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users
(
    id            bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    name          varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
    nick_name     varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
    phone         varchar(32)  NOT NULL DEFAULT '' COMMENT '手机号',
    email         varchar(320) NOT NULL DEFAULT '' COMMENT '邮箱',
    pwd           varchar(72)  NOT NULL DEFAULT '' COMMENT '密码',
    gravatar      varchar(512) NOT NULL DEFAULT '' COMMENT '头像',
    member_level  varchar(32)  NOT NULL DEFAULT '' COMMENT '会员等级 free|standard|vip',
    role          varchar(32)  NOT NULL DEFAULT '' COMMENT '角色，admin|staff|doctor|nurse',
    expire_time   timestamp    NULL COMMENT '过期时间',
    active_status varchar(20)  NOT NULL DEFAULT 'active' COMMENT 'active|inactive',
    latest_login  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
    updated_at    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at    timestamp    NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '用户主表';

DROP TABLE IF EXISTS user_login_logs;

CREATE TABLE IF NOT EXISTS user_login_logs
(
    id           bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    user_id      bigint       NOT NULL COMMENT 'user表ID',                              -- 冗余字段 start----
    user_name    varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
    role         varchar(32)  NOT NULL DEFAULT '' COMMENT '角色，admin|staff|doctor|nurse',
    member_level varchar(32)  NOT NULL DEFAULT '' COMMENT '会员等级 free|standard|vip', -- 冗余字段 end----
    login_time   timestamp    NULL COMMENT '登录时间',
    ip           varchar(32)  NOT NULL DEFAULT '' COMMENT '登录IP',
    login_type   varchar(32)  NOT NULL DEFAULT '' COMMENT '登录类型，email|phone|wechat|alipay|qq|facebook|google|apple',
    updated_at   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at   timestamp    NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '用户登录日志表';

DROP TABLE IF EXISTS user_oauth_relations;

CREATE TABLE IF NOT EXISTS user_oauth_relations
(
    id         bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    user_id    bigint       NOT NULL COMMENT 'user表ID',
    auth_type  varchar(32)  NOT NULL          DEFAULT '' COMMENT 'oauth类型，wechat|alipay|qq|facebook|google|apple',
    open_id    varchar(512) NOT NULL          DEFAULT '' COMMENT 'oauth open_id',
    auth_time  timestamp    NULL COMMENT '认证时间',
    updated_at timestamp    NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at timestamp    NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at timestamp    NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '用户OAUTH授权表';

DROP TABLE IF EXISTS reset_password_records;

CREATE TABLE IF NOT EXISTS reset_password_records
(
    id                bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    user_id           bigint        NOT NULL COMMENT 'user表ID',
    name              varchar(255)  NOT NULL          DEFAULT '' COMMENT '用户名',
    phone             varchar(32)   NOT NULL          DEFAULT '' COMMENT '手机号',
    email             varchar(320)  NOT NULL          DEFAULT '' COMMENT '邮箱',
    reset_token       varchar(1024) NOT NULL          DEFAULT '' COMMENT '重置token',
    token_expire_time timestamp     NOT NULL COMMENT '过期时间',
    updated_at        timestamp     NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at        timestamp     NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at        timestamp     NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '重置密码记录表';

DROP TABLE IF EXISTS user_roles;

CREATE TABLE IF NOT EXISTS user_roles
(
    id         bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    user_id    bigint    NOT NULL COMMENT 'user表ID',
    role_id    bigint    NOT NULL COMMENT 'role表ID',
    updated_at timestamp NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at timestamp NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at timestamp NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '用户角色表';

DROP TABLE IF EXISTS user_permissions;

CREATE TABLE IF NOT EXISTS user_permissions
(
    id         bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    user_id    bigint       NOT NULL COMMENT 'user表ID',
    role_id    bigint       NOT NULL COMMENT 'role表ID',
    permission varchar(255) NOT NULL          DEFAULT '' COMMENT '权限',
    updated_at timestamp    NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at timestamp    NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at timestamp    NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '角色权限表';

DROP TABLE IF EXISTS plans;

CREATE TABLE IF NOT EXISTS plans
(
    id         bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    name       varchar(255) NOT NULL          DEFAULT '' COMMENT '计划名称',
    price      int          NOT NULL          DEFAULT 0 COMMENT '价格,单位元',
    duration   int          NOT NULL          DEFAULT 0 COMMENT '时长,单位天数',
    updated_at timestamp    NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at timestamp    NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at timestamp    NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '会员套餐表';

DROP TABLE IF EXISTS user_member_plan;

CREATE TABLE IF NOT EXISTS user_member_plan
(
    id         bigint PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    user_id    bigint    NOT NULL COMMENT 'user表ID',
    plan_id    bigint    NOT NULL COMMENT 'plan表ID',
    start_time timestamp NULL COMMENT '开始时间',
    end_time   timestamp NULL COMMENT '结束时间',
    updated_at timestamp NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at timestamp NOT NULL NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted_at timestamp NULL COMMENT '删除时间'
) ENGINE = InnoDB
  CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT '用户会员计划表';