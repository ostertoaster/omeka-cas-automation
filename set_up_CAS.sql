INSERT INTO `omeka_plugins` (name,active,version) VALUES ('CentralAuth',1,'1.2');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_email','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_email_domain','whitman.edu');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_sso','optional');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_sso_type','cas');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_sso_cas_hostname','cas.whitman.edu');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_sso_cas_port','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_sso_cas_uri','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_host','ldap.example.edu');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_port','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_useStartTls','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_useSsl','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_username','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_password','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_bindRequiresDn','');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_baseDn','ou=people,dc=example,dc=edu');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_accountCanonicalForm','1');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_accountDomainName','example.edu');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_accountDomainNameShort','EXAMPLE');
INSERT INTO `omeka_options` (name,value) VALUES ('central_auth_ldap_accountFilterFormat','uid=%s');