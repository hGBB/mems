create sequence hibernate_sequence start with 1 increment by 1
create table alert_rule (id bigint generated by default as identity, method integer, name varchar(255) not null, sleep integer, timespan integer, configured_by_id bigint not null, primary key (id))
create table audit (id bigint not null, action_performed varchar(255), performed_by_name varchar(255), target_name varchar(255), timestamp timestamp, primary key (id))
create table group_membership (user_id bigint not null, group_id bigint not null, primary key (user_id, group_id))
create table kpi (id bigint not null, name varchar(255) not null, unit varchar(255), primary key (id))
create table node (id bigint generated by default as identity, estimated boolean, name varchar(255) not null, send_interval integer not null, uuid varchar(255) not null, primary key (id))
create table node_assignment (node_id bigint not null, group_id bigint not null, primary key (node_id, group_id))
create table notification (id bigint not null, text varchar(255) not null, timestamp timestamp not null, recipient_id bigint not null, triggered_by_id bigint, primary key (id))
create table record (id bigint generated by default as identity, timestamp timestamp not null, value double not null, sent_by_id bigint, type_id bigint not null, primary key (id))
create table rule_designation (lower_or_equals boolean not null, threshold double not null, rule_id bigint not null, kpi_id bigint not null, node_id bigint not null, primary key (kpi_id, node_id, rule_id))
create table user (id bigint generated by default as identity, admin boolean not null, email varchar(255) not null, login varchar(255) not null, name varchar(255) not null, password varchar(255) not null, privileged boolean not null, primary key (id))
create table user_group (id bigint generated by default as identity, name varchar(255) not null, primary key (id))
alter table alert_rule add constraint UK_noymmtxnvwsj0olwqj3apqc6c unique (name)
alter table node add constraint UK_fwigxdmj6bsrpcmhcgpmlsirh unique (name)
alter table user add constraint UK_ew1hvam8uwaknuaellwhqchhb unique (login)
alter table user_group add constraint UK_kas9w8ead0ska5n3csefp2bpp unique (name)
alter table alert_rule add constraint FKfs67quddemr2jqtgmo5e12i17 foreign key (configured_by_id) references user
alter table group_membership add constraint FK4dgmru2xf92dsl6ht0qxnkqu3 foreign key (group_id) references user
alter table group_membership add constraint FKdfwnyollp5tfwtd6dywi2vfmd foreign key (user_id) references user_group
alter table node_assignment add constraint FKr6ifpdonlj81k41mjulssy2u9 foreign key (group_id) references node
alter table node_assignment add constraint FK9pspp0vkqjgo95l4ctglrijg1 foreign key (node_id) references user_group
alter table notification add constraint FKqnduwq6ix2pxx1add03905i1i foreign key (recipient_id) references user
alter table notification add constraint FKq9p10gsvts5dqmu7tps30eukl foreign key (triggered_by_id) references alert_rule
alter table record add constraint FK206vxin3gsttebwh8fbkitx6b foreign key (sent_by_id) references node
alter table record add constraint FKrry2xor8bgcfiy0knvef2djeb foreign key (type_id) references kpi
alter table rule_designation add constraint FK5hpw2t712yhe5pixh0lixt574 foreign key (rule_id) references alert_rule
alter table rule_designation add constraint FKgkx28w2ir5fd9p9auwx8b3qvu foreign key (kpi_id) references kpi
alter table rule_designation add constraint FKk2xaqh6cu5rfo80lt3sv23ak foreign key (node_id) references node
create sequence hibernate_sequence start with 1 increment by 1
create table alert_rule (id bigint generated by default as identity, method integer, name varchar(255) not null, sleep integer, timespan integer, configured_by_id bigint not null, primary key (id))
create table audit (id bigint not null, action_performed varchar(255), performed_by_name varchar(255), target_name varchar(255), timestamp timestamp, primary key (id))
create table group_membership (user_id bigint not null, group_id bigint not null, primary key (user_id, group_id))
create table kpi (id bigint not null, name varchar(255) not null, unit varchar(255), primary key (id))
create table node (id bigint generated by default as identity, estimated boolean, name varchar(255) not null, send_interval integer not null, uuid varchar(255) not null, primary key (id))
create table node_assignment (node_id bigint not null, group_id bigint not null, primary key (node_id, group_id))
create table notification (id bigint not null, text varchar(255) not null, timestamp timestamp not null, recipient_id bigint not null, triggered_by_id bigint, primary key (id))
create table record (id bigint generated by default as identity, timestamp timestamp not null, value double not null, sent_by_id bigint, type_id bigint not null, primary key (id))
create table rule_designation (lower_or_equals boolean not null, threshold double not null, rule_id bigint not null, kpi_id bigint not null, node_id bigint not null, primary key (kpi_id, node_id, rule_id))
create table user (id bigint generated by default as identity, admin boolean not null, email varchar(255) not null, login varchar(255) not null, name varchar(255) not null, password varchar(255) not null, privileged boolean not null, primary key (id))
create table user_group (id bigint generated by default as identity, name varchar(255) not null, primary key (id))
alter table alert_rule add constraint UK_noymmtxnvwsj0olwqj3apqc6c unique (name)
alter table node add constraint UK_fwigxdmj6bsrpcmhcgpmlsirh unique (name)
alter table user add constraint UK_ew1hvam8uwaknuaellwhqchhb unique (login)
alter table user_group add constraint UK_kas9w8ead0ska5n3csefp2bpp unique (name)
alter table alert_rule add constraint FKfs67quddemr2jqtgmo5e12i17 foreign key (configured_by_id) references user
alter table group_membership add constraint FK4dgmru2xf92dsl6ht0qxnkqu3 foreign key (group_id) references user
alter table group_membership add constraint FKdfwnyollp5tfwtd6dywi2vfmd foreign key (user_id) references user_group
alter table node_assignment add constraint FKr6ifpdonlj81k41mjulssy2u9 foreign key (group_id) references node
alter table node_assignment add constraint FK9pspp0vkqjgo95l4ctglrijg1 foreign key (node_id) references user_group
alter table notification add constraint FKqnduwq6ix2pxx1add03905i1i foreign key (recipient_id) references user
alter table notification add constraint FKq9p10gsvts5dqmu7tps30eukl foreign key (triggered_by_id) references alert_rule
alter table record add constraint FK206vxin3gsttebwh8fbkitx6b foreign key (sent_by_id) references node
alter table record add constraint FKrry2xor8bgcfiy0knvef2djeb foreign key (type_id) references kpi
alter table rule_designation add constraint FK5hpw2t712yhe5pixh0lixt574 foreign key (rule_id) references alert_rule
alter table rule_designation add constraint FKgkx28w2ir5fd9p9auwx8b3qvu foreign key (kpi_id) references kpi
alter table rule_designation add constraint FKk2xaqh6cu5rfo80lt3sv23ak foreign key (node_id) references node
create sequence hibernate_sequence start with 1 increment by 1
create table alert_rule (id bigint generated by default as identity, method integer, name varchar(255) not null, sleep integer, timespan integer, configured_by_id bigint not null, primary key (id))
create table audit (id bigint not null, action_performed varchar(255), performed_by_name varchar(255), target_name varchar(255), timestamp timestamp, primary key (id))
create table group_membership (user_id bigint not null, group_id bigint not null, primary key (user_id, group_id))
create table kpi (id bigint not null, name varchar(255) not null, unit varchar(255), primary key (id))
create table node (id bigint generated by default as identity, estimated boolean, name varchar(255) not null, send_interval integer not null, uuid varchar(255) not null, primary key (id))
create table node_assignment (node_id bigint not null, group_id bigint not null, primary key (node_id, group_id))
create table notification (id bigint not null, text varchar(255) not null, timestamp timestamp not null, recipient_id bigint not null, triggered_by_id bigint, primary key (id))
create table record (id bigint generated by default as identity, timestamp timestamp not null, value double not null, sent_by_id bigint, type_id bigint not null, primary key (id))
create table rule_designation (lower_or_equals boolean not null, threshold double not null, rule_id bigint not null, kpi_id bigint not null, node_id bigint not null, primary key (kpi_id, node_id, rule_id))
create table user (id bigint generated by default as identity, admin boolean not null, email varchar(255) not null, login varchar(255) not null, name varchar(255) not null, password varchar(255) not null, privileged boolean not null, primary key (id))
create table user_group (id bigint generated by default as identity, name varchar(255) not null, primary key (id))
alter table alert_rule add constraint UK_noymmtxnvwsj0olwqj3apqc6c unique (name)
alter table node add constraint UK_fwigxdmj6bsrpcmhcgpmlsirh unique (name)
alter table user add constraint UK_ew1hvam8uwaknuaellwhqchhb unique (login)
alter table user_group add constraint UK_kas9w8ead0ska5n3csefp2bpp unique (name)
alter table alert_rule add constraint FKfs67quddemr2jqtgmo5e12i17 foreign key (configured_by_id) references user
alter table group_membership add constraint FK4dgmru2xf92dsl6ht0qxnkqu3 foreign key (group_id) references user
alter table group_membership add constraint FKdfwnyollp5tfwtd6dywi2vfmd foreign key (user_id) references user_group
alter table node_assignment add constraint FKr6ifpdonlj81k41mjulssy2u9 foreign key (group_id) references node
alter table node_assignment add constraint FK9pspp0vkqjgo95l4ctglrijg1 foreign key (node_id) references user_group
alter table notification add constraint FKqnduwq6ix2pxx1add03905i1i foreign key (recipient_id) references user
alter table notification add constraint FKq9p10gsvts5dqmu7tps30eukl foreign key (triggered_by_id) references alert_rule
alter table record add constraint FK206vxin3gsttebwh8fbkitx6b foreign key (sent_by_id) references node
alter table record add constraint FKrry2xor8bgcfiy0knvef2djeb foreign key (type_id) references kpi
alter table rule_designation add constraint FK5hpw2t712yhe5pixh0lixt574 foreign key (rule_id) references alert_rule
alter table rule_designation add constraint FKgkx28w2ir5fd9p9auwx8b3qvu foreign key (kpi_id) references kpi
alter table rule_designation add constraint FKk2xaqh6cu5rfo80lt3sv23ak foreign key (node_id) references node
create sequence hibernate_sequence start with 1 increment by 1
create table alert_rule (id bigint generated by default as identity, method integer, name varchar(255) not null, sleep integer, timespan integer, configured_by_id bigint not null, primary key (id))
create table audit (id bigint not null, action_performed varchar(255), performed_by_name varchar(255), target_name varchar(255), timestamp timestamp, primary key (id))
create table group_membership (user_id bigint not null, group_id bigint not null, primary key (user_id, group_id))
create table kpi (id bigint not null, name varchar(255) not null, unit varchar(255), primary key (id))
create table node (id bigint generated by default as identity, estimated boolean, name varchar(255) not null, send_interval integer not null, uuid varchar(255) not null, primary key (id))
create table node_assignment (node_id bigint not null, group_id bigint not null, primary key (node_id, group_id))
create table notification (id bigint not null, text varchar(255) not null, timestamp timestamp not null, recipient_id bigint not null, triggered_by_id bigint, primary key (id))
create table record (id bigint generated by default as identity, timestamp timestamp not null, value double not null, sent_by_id bigint, type_id bigint not null, primary key (id))
create table rule_designation (lower_or_equals boolean not null, threshold double not null, rule_id bigint not null, kpi_id bigint not null, node_id bigint not null, primary key (kpi_id, node_id, rule_id))
create table user (id bigint generated by default as identity, admin boolean not null, email varchar(255) not null, login varchar(255) not null, name varchar(255) not null, password varchar(255) not null, privileged boolean not null, primary key (id))
create table user_group (id bigint generated by default as identity, name varchar(255) not null, primary key (id))
alter table alert_rule add constraint UK_noymmtxnvwsj0olwqj3apqc6c unique (name)
alter table node add constraint UK_fwigxdmj6bsrpcmhcgpmlsirh unique (name)
alter table user add constraint UK_ew1hvam8uwaknuaellwhqchhb unique (login)
alter table user_group add constraint UK_kas9w8ead0ska5n3csefp2bpp unique (name)
alter table alert_rule add constraint FKfs67quddemr2jqtgmo5e12i17 foreign key (configured_by_id) references user
alter table group_membership add constraint FK4dgmru2xf92dsl6ht0qxnkqu3 foreign key (group_id) references user
alter table group_membership add constraint FKdfwnyollp5tfwtd6dywi2vfmd foreign key (user_id) references user_group
alter table node_assignment add constraint FKr6ifpdonlj81k41mjulssy2u9 foreign key (group_id) references node
alter table node_assignment add constraint FK9pspp0vkqjgo95l4ctglrijg1 foreign key (node_id) references user_group
alter table notification add constraint FKqnduwq6ix2pxx1add03905i1i foreign key (recipient_id) references user
alter table notification add constraint FKq9p10gsvts5dqmu7tps30eukl foreign key (triggered_by_id) references alert_rule
alter table record add constraint FK206vxin3gsttebwh8fbkitx6b foreign key (sent_by_id) references node
alter table record add constraint FKrry2xor8bgcfiy0knvef2djeb foreign key (type_id) references kpi
alter table rule_designation add constraint FK5hpw2t712yhe5pixh0lixt574 foreign key (rule_id) references alert_rule
alter table rule_designation add constraint FKgkx28w2ir5fd9p9auwx8b3qvu foreign key (kpi_id) references kpi
alter table rule_designation add constraint FKk2xaqh6cu5rfo80lt3sv23ak foreign key (node_id) references node
