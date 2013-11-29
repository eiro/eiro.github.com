j'ai commencé avec des sed, m4, TT2. 

Pour l'html, il me semble que les templates sont une tres mauvaise idée
pour diverses raisons, les principale étant:

* je ne veux jamais un espace de trop dans mon code final. mon html doit
  ressembler à 

  <div><h2>lol</h2></div> 

  et pas

  <div>
      <h2>lol</h2>
  </div>

  ce pour éviter des chars en trop et surtout pour garantir au graphiste
  qu'il n'y a pas pas d'espace mal placé pour lui pourrir son css.


* ce template est invalide: 

  <div>
      <h2>{{ user }}<h2>
  </div>

  (c'est /h2 et pas h2) mais le systeme de template ne gueule pas. avec
  XML::Tag

  div { h2 { $user } } 

  si jamais j'oublie une accolade: BOOM! perl rale!  

TT2 était donc utilisé pour générer des fichiers textes (templates de
mails ou de fichiers de configuration). Ce qui me fait passer a
http://mustache.github.com/ c'est que je peux partager mes templates
avec les developpeurs go, perl6, erlang, ruby, … c'est la notion
d'acmeisme (http://acmeism.org/)  

https://metacpan.org/module/Text::Caml, implementation alternative ? 





a+


