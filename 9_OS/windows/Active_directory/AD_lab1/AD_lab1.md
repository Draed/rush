# AD Lab 1 

## Description 

## Usage (content)

- LDAP : The Lightweight Directory Access Protocol, is a directory service protocol that runs directly over the TCP/IP stack

- Active Directory simple definition : AD is like a database organize as a hierarchy/directory (this hierarchy is often the same as the organisation/company) and is called the AD scheme. It manage peoples, ressources (servers, laptop, client computer, printers) define as objects. AD is a Microsoft's proprietary service but is based on LDAP protocol for client and database/directory communications (Port : 389 and SSL secure port : 636).

- AD Domain : A domain is a logical object group that will share the same directory. Objects (Users, ressources) will belong to a domain. The first domain created in a company is called the root domain and is also the first element of the forest. Below this first root doman could exist sub-domain (i.e : geographical division of a company), also seen as branches. Domain can also be connected to create "forest" when multiple domain (each composed of sub-domain, we could see them as Tree with branches) are joined together, a global catalog is created.

- Domain controller (server) : The DC is the server which contain all elements/objects of a specific domain (the domain in which it is installed).

- Global Catalog : A domain controller designated as a global catalog server stores the objects from all domains in the forest. For each object that is not in the domain for which the global catalog server is authoritative as a domain controller, a limited set of attributes is stored in a partial replica of the domain

- PAS (partial attribute set) : The attributes that are replicated to the global catalog are identified in the schema as the partial attribute set (PAS) and are defined by default by Microsoft

- FSMO (Flexible Single Master Operation) : Five operation master roles that ensure consistency and potential conflicting entries :

    - the schema master (SM) : Master that manage the unicity of the Directory schema among the entire forest. This role must be unique in the forest and installed with the role "DNM" and "PDC".
    - domain naming master (DNM) : role that managed domain name among the forest (CRUD domain and assure DN unicity). This role must be unique in the forest and installed with the role "SM" and "PDC".
    - relative identifier master (RID) : role that manage all object's SID (Security ID) and assure unicity of these. Must be unique within the domain.
    - primary domain controller (PDC) emulator : That role manage the security pamameters (GPO propagation, user account locking and password changes). It also manage NTP server for an entire domain. Must be unique within the domain.
    - infrastructure master : role that manage replication within the forest, more precisly the propagation of the objects among the forest. Must be unique within the domain.


- The domain architecture : is hirarchical and is organized by :
    - Organizational Unit (OU): Objects (users, ressources) Group based on geographical, functionnal (IT, dev, RH, ), and service element.

- GPO (Groupe Policy Object) : GPO are rules (Policy settings) that can be applied to OU, site, domain, or local (one machine). Theses rules are not limited and regroup lot of task as network config, user security, software management, 

- ADMX (administrative files) : ADMX are GPO template and can be find at :
    - For OS settings: Computer Configuration/Administrative Templates
    - for Application settings: User Configuration/Administrative Templates

- AD Group : There is two types of groups in a Active Directory :
    - Distribution : used by message application (like exchange) for mail diffusion list.
    - Security : is used for users and ressources security management (rights) for ressources permission, share access. This group is divided in 3 types :
        - Local domain : group is used on the created domain only
        - Extended : group is used on the domain and forest (approved domain only)
        - universal : group is used on the whole forest

## Sources : 

- AD overview : https://neptunet.fr/intro-ad-p1/
- What is LDAP (windows offical doc) : https://learn.microsoft.com/en-us/previous-versions/windows/desktop/ldap/what-is-ldap
- GPO (windows offical doc) : https://learn.microsoft.com/en-us/previous-versions/windows/desktop/policy/group-policy-objects
- ADMX Policy (windows offical doc) : https://learn.microsoft.com/en-us/windows/client-management/understanding-admx-backed-policies
- Video about GPO and ADMX files : https://www.youtube.com/watch?v=hIaYKVXINXY
- Application deployment by GPO video tutorial : https://www.youtube.com/watch?v=gASjpQVr2VY
- AGDLP organization for AD groups : https://neptunet.fr/agdlp/
- Kerberos authentication explained : https://www.youtube.com/watch?v=5N242XcKAsM