% notes sur les concepts de Request Tracker 

# Agenda (par jean)

ticket
queue

archi
	classes
DB
auth
conf
surcharge/redefinition via /usr/local
droits
	group
	user
mail gateway
TODO: custom fields
TODO: scrips

#  notes

* rt -> mail au depart, web par la suite
* file
  - triage, périmètre, domain of concern 
  - ticket = transaction*, fields
    transaction = attachment* ,  


Le menu configurarion permet d'accederer a la conf de tous les objets des classes 
Users, Goupes, Files , ...

Custom fields peuvent etre attachés a ce qu'on veut (ticket, file, ... )  

Users -> User
CurrentUser -> permet du sudoing applicatif 
RT::* use base RT::Record qui use base ( RT::Base et la confif RecordBaseClass )
authentication: par mail uniquement normalement
 * création du compte par unseeen addr du from  (UserName) 

Droits =  
    system group (everyone = priv + unpriv )

mailgate appellé par /etc/aliases 

