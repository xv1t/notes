# Active directory auth

Create groups in the `Users` container in your Active Directory of domain `DOMAINNAME`
1. GogsUsers
2. GogsAdmins

Create account `gogs` with password `X*******U` with minimal privileges

```yaml
Authentication Setting:
        Authentication Type: "LDAP (via BindDN)"
        Authentication Name: "DOMAINNAME"
        Security Protocol: "Unencrypted"
        Host: "10.10.2.22"
        Port: 389
        Bind DN: "CN=gogs,CN=Users,DC=DOMAINNAME,DC=LOCAL"
        Bind Password: X*******U
        User Search Base: DC=DOMAINNAME,DC=LOCAL
        User Filter: (&(samAccountName=%s)(memberOf=CN=GogsUsers,CN=Users,DC=DOMAINNAME,DC=LOCAL))
        Admin Filter: (memberOf=CN=GogsAdmins,CN=Users,DC=DOMAINNAME,DC=LOCAL)
        Username Attribute: samAccountName
        First Name Attribute: GivenName
        Surname Attribute: Surname
        Email Attribute: email
Verify group membership: false
  Group Search Base DN: DC=DOMAINNAME,DC=LOCAL
        Group Filter: CN=GogsUsers,CN=Users
        Group Attribute Containing List of Users: memberOf
        User Attribute Listed in Group:
Checkboxes:
        Fetch: true
        This auth is activated: true
        This auth is default login source: true

```
