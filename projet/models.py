from django.db import models

# Create your models here.

class Entreprise(models.Model):
    entr_name=models.CharField(max_length=200)
    entr_lat=models.CharField(max_length=200)
    entr_long=models.CharField(max_length=200)
    ag_email=models.EmailField(max_length=200)

    def __str__(entr):
        return entr.entr_name
    
class Type(models.Model):
    type_name=models.CharField(max_length=50)
    icone=models.ImageField(upload_to="images/icones",blank=True)

    def __str__ (typ):
        return typ.type_name

class Categorie(models.Model):
    name=models.CharField(max_length=25)
    couleur=models.CharField(max_length=25)
    
    def __str__(self):
        return self.name;
       
class Zone(models.Model):
    name=models.CharField(max_length=50)
    description=models.TextField()
    paths=models.TextField()
    categorie=models.ForeignKey(Categorie, on_delete=models.CASCADE, default=1,related_name='categorie')

    def __str__ (zone):
        return zone.name

class Commercial(models.Model):
    entreprise=models.ForeignKey(Entreprise,on_delete=models.CASCADE)
    name=models.CharField(max_length=200)
    adr=models.CharField(max_length=50)
    tel=models.CharField(max_length=50)
    email=models.EmailField(max_length=200)

    def __str__(com):
        return "%s " % (com.name)

class Agent(models.Model):
    entreprise=models.ForeignKey(Entreprise,on_delete=models.CASCADE)
    name=models.CharField(max_length=200)
    email=models.EmailField(max_length=200)
    adr=models.CharField(max_length=50)
    tel=models.CharField(max_length=50)
    login=models.CharField(max_length=50)
    pwd=models.CharField(max_length=50)

    def __str__(ag):
        return ag.name

class Client(models.Model):
    cl_type=models.ForeignKey(Type,related_name='cl_type')
    cl_name=models.CharField(max_length=100)
    cl_email=models.EmailField(max_length=200)
    cl_lat=models.CharField(max_length=200)
    cl_long=models.CharField(max_length=200)
    description=models.TextField(default="a")

    def __str__(cl):
        return cl.cl_name
class TypeMission(models.Model):
    name=models.CharField(max_length=50)
    def __str__(self):
        return self.name

class Programme(models.Model):
    agent=models.ForeignKey(Agent,on_delete=models.CASCADE)
    com=models.ManyToManyField(Commercial)
    created_on=models.DateTimeField()
    modified_on=models.DateTimeField()
    timing=models.TextField()
    lieux=models.ManyToManyField(Client)
    libelle=models.CharField(max_length=200)
    typemission=models.ManyToManyField(TypeMission)

    def __str__(prog):
        return "%s " % (prog.libelle)


class Mission(models.Model):
    libelle=models.CharField(max_length=200)
    agent=models.ForeignKey(Agent,on_delete=models.CASCADE)
    com=models.ForeignKey(Commercial,on_delete=models.CASCADE)
    created_on=models.DateTimeField()
    modified_on=models.DateTimeField()
    date_do=models.DateField()
    time_do=models.TimeField(blank=True,null=True)
    date_exe=models.DateField(blank=True,null=True)
    time_exe=models.TimeField(blank=True,null=True)
    lieu=models.ForeignKey(Client,default=1)
    etat=models.BooleanField(default=False)
    observation=models.TextField(default="a")
    TypeMission=models.ForeignKey(TypeMission,on_delete=models.SET_NULL,null=True,blank=True)
    programme=models.ForeignKey(Programme,on_delete=models.SET_NULL,null=True,blank=True)

    def __str__(task):
        return task.libelle 
class Profil(models.Model):
    profil=models.CharField(max_length=20)
    def __str__(profil):
        return profil.profil   
class Utilisateur (models.Model):
    nom=models.CharField('nom complet',max_length=50)
    tel=models.CharField( 'telephone',max_length=50)
    login=models.CharField(max_length=50)
    pwd=models.CharField('mot de passe',max_length=50)
    profil=models.ForeignKey(Profil, on_delete=models.CASCADE)

    def __str__ (user):
        return user.nom
class Exceltest(models.Model):
    nom=models.CharField('nom complet',max_length=50)
    prenom=models.CharField('prenoms ',max_length=100)
    age=models.IntegerField(default=10)
    def __unicode__(self):
        return self.prenom +" "+self.nom
    def __str__(self):
        return self.prenom +" "+ self.nom

   
    
    



