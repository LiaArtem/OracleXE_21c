begin 
DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
acl => 'network_services.xml',
description => 'FTP ACL',
principal => 'PUBLIC',
is_grant => true,
privilege => 'connect');

DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
acl => 'network_services.xml',
principal => 'PUBLIC',
is_grant => true,
privilege => 'resolve');

DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
acl => 'network_services.xml',
host => '*');

COMMIT;
end;