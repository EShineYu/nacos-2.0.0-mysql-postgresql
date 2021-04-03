    CREATE TABLE config_info (
      id serial  NOT NULL,
      data_id varchar(255) NOT NULL ,
      group_id varchar(255) DEFAULT NULL,
      content text NOT NULL ,
      md5 varchar(32) DEFAULT NULL ,
      gmt_create timestamp NOT NULL ,
      gmt_modified timestamp NOT NULL ,
      src_user text ,
      src_ip varchar(20) DEFAULT NULL ,
      app_name varchar(128) DEFAULT NULL,
      tenant_id varchar(128) DEFAULT '' ,
      c_desc varchar(256) DEFAULT NULL,
      c_use varchar(64) DEFAULT NULL,
      effect varchar(64) DEFAULT NULL,
      type varchar(64) DEFAULT NULL,
      c_schema text,
      PRIMARY KEY (id),
      constraint uk_configinfo_datagrouptenant unique(data_id,group_id,tenant_id)
    ) ;
		
		comment on table config_info is 'config_info';
        comment on column config_info.id is 'id';
	    comment on column config_info.content is 'content';
        comment on column config_info.md5 is 'md5';
    	comment on column config_info.gmt_create is '创建时间';
	    comment on column config_info.gmt_modified is '修改时间';
		comment on column config_info.src_user is 'source user';
		comment on column config_info.src_ip is 'source ip';
		comment on column config_info.tenant_id is '租户字段';
    
    CREATE TABLE config_info_aggr (
      id serial NOT NULL,
      data_id varchar(255) NOT NULL ,
      group_id varchar(255) NOT NULL ,
      datum_id varchar(255) NOT NULL ,
      content text NOT NULL ,
      gmt_modified timestamp NOT NULL ,
      app_name varchar(128) DEFAULT NULL,
      tenant_id varchar(128) DEFAULT '' ,
      PRIMARY KEY (id),
      constraint uk_configinfoaggr_datagrouptenantdatum unique(data_id,group_id,tenant_id,datum_id)
    ) ;
		
		comment on table config_info_aggr is '增加租户字段';
        comment on column config_info_aggr.id is 'id';
        comment on column config_info_aggr.data_id is 'data_id';
  	    comment on column config_info_aggr.group_id is 'group_id';
  	    comment on column config_info_aggr.datum_id is 'datum_id';
	    comment on column config_info_aggr.content is '内容';
		comment on column config_info_aggr.gmt_modified is '修改时间';
		comment on column config_info_aggr.tenant_id is '租户字段';

   
    CREATE TABLE config_info_beta (
      id serial NOT NULL,
      data_id varchar(255) NOT NULL ,
      group_id varchar(128) NOT NULL ,
      app_name varchar(128) DEFAULT NULL ,
      content text NOT NULL ,
      beta_ips varchar(1024) DEFAULT NULL ,
      md5 varchar(32) DEFAULT NULL ,
      gmt_create timestamp NOT NULL ,
      gmt_modified timestamp NOT NULL ,
      src_user text ,
      src_ip varchar(20) DEFAULT NULL ,
      tenant_id varchar(128) DEFAULT '',
      PRIMARY KEY (id),
      constraint uk_configinfobeta_datagrouptenant unique(data_id,group_id,tenant_id)
    );

		comment on table config_info_beta is 'config_info_beta';
        comment on column config_info_beta.id is 'id';
	    comment on column config_info_beta.data_id is 'data_id';
  	    comment on column config_info_beta.group_id is 'group_id';
  	    comment on column config_info_beta.app_name is 'app_name';
	    comment on column config_info_beta.content is 'content';
		comment on column config_info_beta.beta_ips is 'betaIps';
		comment on column config_info_beta.md5 is 'md5';
		comment on column config_info_beta.gmt_create is '创建时间';
  	    comment on column config_info_beta.gmt_modified is '修改时间';
  	    comment on column config_info_beta.src_user is 'source user';
	    comment on column config_info_beta.src_ip is 'source ip';
		comment on column config_info_beta.tenant_id is '租户字段';
    
    CREATE TABLE config_info_tag (
      id serial NOT NULL,
      data_id varchar(255) NOT NULL ,
      group_id varchar(128) NOT NULL ,
      tenant_id varchar(128) DEFAULT '' ,
      tag_id varchar(128) NOT NULL ,
      app_name varchar(128) DEFAULT NULL,
      content text NOT NULL ,
      md5 varchar(32) DEFAULT NULL ,
      gmt_create timestamp NOT NULL ,
      gmt_modified timestamp NOT NULL  ,
      src_user text ,
      src_ip varchar(20) DEFAULT NULL ,
      PRIMARY KEY (id),
      constraint uk_configinfotag_datagrouptenanttag unique(data_id,group_id,tenant_id,tag_id)
    ) ;

		comment on table config_info_tag is 'config_info_tag';
        comment on column config_info_tag.id is 'id';
	    comment on column config_info_tag.data_id is 'data_id';
  	    comment on column config_info_tag.group_id is 'group_id';
  	    comment on column config_info_tag.tenant_id is 'tenant_id';
	    comment on column config_info_tag.tag_id is 'tag_id';
		comment on column config_info_tag.app_name is 'app_name';
		comment on column config_info_tag.content is 'content';
		comment on column config_info_tag.md5 is 'md5';
		comment on column config_info_tag.gmt_create is '创建时间';
  	    comment on column config_info_tag.gmt_modified is '修改时间';
  	    comment on column config_info_tag.src_user is 'source user';
	    comment on column config_info_tag.src_ip is 'source ip';
		comment on column config_info_tag.tenant_id is '租户字段';
    
    CREATE TABLE config_tags_relation (
      id bigint NOT NULL ,
      tag_name varchar(128) NOT NULL ,
      tag_type varchar(64) DEFAULT NULL ,
      data_id varchar(255) NOT NULL ,
      group_id varchar(128) NOT NULL ,
      tenant_id varchar(128) DEFAULT '' ,
      nid serial NOT NULL,
      PRIMARY KEY (nid),
      constraint uk_configtagrelation_configidtag unique(id,tag_name,tag_type)
    ) ;
		
		comment on table config_tags_relation is 'config_tag_relation';
        comment on column config_tags_relation.id is 'id';
	    comment on column config_tags_relation.tag_name is 'tag_name';
  	    comment on column config_tags_relation.tag_type is 'tag_type';
  	    comment on column config_tags_relation.data_id is 'data_id';
	    comment on column config_tags_relation.group_id is 'group_id';
		comment on column config_tags_relation.tenant_id is 'tenant_id';

    
    CREATE TABLE group_capacity (
      id serial NOT NULL ,
      group_id varchar(128) NOT NULL DEFAULT '',
      quota int  NOT NULL DEFAULT '0' CHECK (quota >= 0) ,
      usage int  NOT NULL DEFAULT '0' CHECK (usage >= 0),
      max_size int  NOT NULL DEFAULT '0' CHECK (max_size >= 0),
      max_aggr_count int  NOT NULL DEFAULT '0' CHECK (max_aggr_count >= 0),
      max_aggr_size int  NOT NULL DEFAULT '0' CHECK (max_aggr_size >= 0),
      max_history_count int  NOT NULL DEFAULT '0' CHECK (max_history_count >= 0),
      gmt_create timestamp NOT NULL  ,
      gmt_modified timestamp NOT NULL  ,
      PRIMARY KEY (id),
      constraint uk_group_id unique(group_id)
    ) ;
		
		comment on table group_capacity is '集群、各Group容量信息表';
        comment on column group_capacity.id is '主键ID';
	    comment on column group_capacity.group_id is 'Group ID，空字符表示整个集群';
  	    comment on column group_capacity.quota is '配额，0表示使用默认值';
  	    comment on column group_capacity.usage is '使用量';
	    comment on column group_capacity.max_size is '单个配置大小上限，单位为字节，0表示使用默认值';
		comment on column group_capacity.max_aggr_count is '聚合子配置最大个数，，0表示使用默认值';
		comment on column group_capacity.max_aggr_size is '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
		comment on column group_capacity.max_history_count is '最大变更历史数量';
		comment on column group_capacity.gmt_create is '创建时间';
  	    comment on column group_capacity.gmt_modified is '修改时间';

    CREATE TABLE his_config_info (
      id bigint  NOT NULL CHECK (id >= 0),
      nid serial  NOT NULL CHECK (nid >= 0),
      data_id varchar(255) NOT NULL ,
      group_id varchar(128) NOT NULL,
      app_name varchar(128) DEFAULT NULL ,
      content text NOT NULL,
      md5 varchar(32) DEFAULT NULL,
      gmt_create timestamp NOT NULL ,
      gmt_modified timestamp NOT NULL ,
      src_user text,
      src_ip varchar(20) DEFAULT NULL,
      op_type char(10) DEFAULT NULL,
      tenant_id varchar(128) DEFAULT '' ,
      PRIMARY KEY (nid)
    );
		
		comment on table his_config_info is '多租户改造';
        comment on column his_config_info.app_name is 'app_name';
  	    comment on column his_config_info.tenant_id is '租户字段';


    CREATE TABLE tenant_capacity (
      id serial NOT NULL CHECK (id >= 0),
      tenant_id varchar(128) NOT NULL DEFAULT '',
      quota int  NOT NULL DEFAULT '0' CHECK (quota >= 0),
      usage int  NOT NULL DEFAULT '0' CHECK (usage >= 0),
      max_size int  NOT NULL DEFAULT '0' CHECK (max_size >= 0),
      max_aggr_count int  NOT NULL DEFAULT '0' CHECK (max_aggr_count >= 0),
      max_aggr_size int  NOT NULL DEFAULT '0' CHECK (max_aggr_size >= 0),
      max_history_count int  NOT NULL DEFAULT '0' CHECK (max_history_count >= 0),
      gmt_create timestamp NOT NULL ,
      gmt_modified timestamp NOT NULL  ,
      PRIMARY KEY (id),
      constraint uk_tenant_id unique(tenant_id)
    );
		
		comment on table tenant_capacity is '租户容量信息表';
        comment on column tenant_capacity.id is '主键ID';
	    comment on column tenant_capacity.tenant_id is 'Tenant ID';
  	    comment on column tenant_capacity.quota is '配额，0表示使用默认值';
  	    comment on column tenant_capacity.usage is '使用量';
	    comment on column tenant_capacity.max_size is '单个配置大小上限，单位为字节，0表示使用默认值';
		comment on column tenant_capacity.max_aggr_count is '聚合子配置最大个数';
		comment on column tenant_capacity.max_aggr_size is '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
		comment on column tenant_capacity.max_history_count is '最大变更历史数量';
		comment on column tenant_capacity.gmt_create is '创建时间';
  	    comment on column tenant_capacity.gmt_modified is '修改时间';


    CREATE TABLE tenant_info (
      id serial NOT NULL ,
      kp varchar(128) NOT NULL,
      tenant_id varchar(128) default '' ,
      tenant_name varchar(128) default '' ,
      tenant_desc varchar(256) DEFAULT NULL ,
      create_source varchar(32) DEFAULT NULL ,
      gmt_create bigint NOT NULL,
      gmt_modified bigint NOT NULL ,
      PRIMARY KEY (id),
      constraint uk_tenant_info_kptenantid unique(kp,tenant_id)
    );
		
		comment on table tenant_info is 'tenant_info';
        comment on column tenant_info.id is 'id';
	    comment on column tenant_info.kp is 'kp';
  	    comment on column tenant_info.tenant_id is 'tenant_id';
  	    comment on column tenant_info.tenant_name is 'tenant_name';
	    comment on column tenant_info.tenant_desc is 'tenant_desc';
		comment on column tenant_info.create_source is 'create_source';
		comment on column tenant_info.gmt_create is '创建时间';
  	    comment on column tenant_info.gmt_modified is '修改时间';

    CREATE TABLE users (
      username varchar(50) NOT NULL PRIMARY KEY,
      password varchar(500) NOT NULL,
      enabled boolean NOT NULL
    );

    CREATE TABLE roles (
      username varchar(50) NOT NULL,
      role varchar(50) NOT NULL
    );
	
	CREATE TABLE permissions (
		role varchar(50) NOT NULL,
		resource varchar(255) NOT NULL,
		action varchar(8) NOT NULL,
		constraint uk_role_permission unique(role,resource,action)
	);

    INSERT INTO users (username, password, enabled) VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', TRUE);

    INSERT INTO roles (username, role) VALUES ('nacos', 'ROLE_ADMIN');
