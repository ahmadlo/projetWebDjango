from django.contrib.auth.models import User, Group
from rest_framework import serializers,status
from rest_framework.response import Response

from projet.models import Client,Mission,Type,Zone,Profil,Utilisateur,Categorie,Commercial,Agent,Entreprise,TypeMission,Programme

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'password')
        write_only_fields=('password',)
        read_only_fields = ('is_staff', 'is_superuser', 'is_active', 'date_joined',)

    def restore_object(self, attrs, instance=None):
        # call set_password on user object. Without this
        # the password will be stored in plain text.
        user = super(UserSerializer, self).restore_object(attrs, instance)
        user.set_password(attrs['password'])
        return user
class CategorieSerializer(serializers.ModelSerializer):
    class Meta:
        model=Categorie
        fields=('__all__')
class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')       
class ZoneSerializer(serializers.ModelSerializer):
    categorie=CategorieSerializer(many=False)
    class Meta:
        model=Zone
        fields=('id', 'name', 'description', 'paths', 'categorie')
    def create(self,validated_data):
        cat=validated_data.pop('categorie')
        categorie=Categorie.objects.get(name=cat['name'])
        name=validated_data.get('name')
        paths=validated_data.get('paths')
        description=validated_data.get('description')
        zone=Zone.objects.create(name=name, description=description, paths=paths, categorie=categorie)
        return zone
    def update(self,instance,validated_data):
        cat=validated_data.pop('categorie')
        categorie=Categorie.objects.get(name=cat['name'])
        instance.name=validated_data.get('name',instance.name)
        instance.description=validated_data.get('description',instance.description)
        instance.paths=validated_data.get('paths',instance.paths)
        instance.categorie=categorie
        instance.save()
        return instance
class TypeSerializer(serializers.ModelSerializer):
    class Meta:
        model=Type
        fields='__all__'


class ClientSerializer(serializers.ModelSerializer):
    #cl_type=TypeSerializer()
    #cl_zone=ZoneSerializer(many=False,read_only=True)
    class Meta:
        model= Client
        fields=('id','cl_name', 'cl_email', 'cl_lat', 'cl_long', 'cl_type','description')
        
        #read_only_fields=('cl_email',)
       
        
    # def update(self,instance,validated_data):
    #     instance.cl_name=validated_data.get('cl_name',instance.cl_name)
    #     instance.description=validated_data.get('description',instance.description)
    #     instance.cl_lat=validated_data.get('cl_lat',instance.cl_lat)
    #     instance.cl_long=validated_data.get('cl_long',instance.cl_long)
    #     #instance.cl_email=validated_data.get('cl_email',instance.cl_email)
    #     typ=validated_data.pop('cl_type')
        
    #     instance.cl_type=Type.objects.get(type_name=typ['type_name'])
    #     instance.save()
    #     return instance
    # def create(self,validated_data):

    #     typ=validated_data.pop('cl_type')
    #     ty=Type.objects.get(type_name=typ['type_name'])
    #     name=validated_data.get('cl_name')
    #     description=validated_data.get('description')
    #     lat=validated_data.get('cl_lat')
    #     lng=validated_data.get('cl_long')
    #     mail=validated_data.get('cl_email')
    #     #zone=Zone.objects.get(pk=1)
    #     client= Client.objects.create(cl_name=name,cl_lat=lat,cl_long=lng,cl_type=ty,description=description,cl_email=mail)
    #     #if (client):
    #     return client
class CommercialSerializer(serializers.ModelSerializer):
    class Meta:
        model=Commercial
        fields='__all__'

class TachesSerializer(serializers.ModelSerializer):
    lieu=ClientSerializer(many=False,read_only=True)
    class Meta:
        model=Mission
        fields=('id', 'libelle', 'lieu','created_on','modified_on','date_do','etat','observation')
        read_only_fields=('id', 'libelle', 'lieu','created_on','modified_on','date_do')
        depth=1
        def update(self, data):
            #id=data.get('id',tache.id)
            tache=Mission.object.get(pk=data.get('id'))
            tache.etat=data.get('etat',tache.etat)
            tache.observation=data.get('observation', tache.observation)
            tache.save()
            return Response({
                    'status':'ok',
                    'message':'baxxna'
                    
                   
                    
                    }, status=status.HTTP_201_CREATED)            
class TacheSerializer(serializers.ModelSerializer):
    lieu=ClientSerializer(many=False,read_only=True)
    com=CommercialSerializer(many=False)
    class Meta:
        model=Mission
        fields=('__all__')
        read_only_fields=('id', 'libelle', 'lieu','created_on','modified_on','date_do')
        depth=1
    def update(self,tache, data):
            #id=data.get('id',tache.id)
            #tache=Mission.object.get(pk=data.get('id'))
            tache.etat=data.get('etat',tache.etat)
            co=data.pop('com')
            comm=Commercial.objects.get(name=co['name'])
            tache.com=comm
            tache.observation=data.get('observation', tache.observation)
            tache.save()
            return tache           
class ProfilSerializer(serializers.ModelSerializer):
    class Meta:
        model=Profil
        fields='__all__'
class UtilisateurSerializer(serializers.ModelSerializer):
   # profil=ProfilSerializer(many=False)
    class Meta:
        model=Utilisateur
        fields='__all__'
        read_only_fields=('nom','tel')
        depth=1
class AgentSerializer(serializers.ModelSerializer):
    class Meta:
        model=Agent
        fields='__all__'
class TypeMissionSerializer(serializers.ModelSerializer):
    class Meta:
        model=TypeMission
        fields='__all__'

class ProgrammeSerializer(serializers.ModelSerializer):
    
    class Meta:
        model=Programme
        fields='__all__'
        #depth=1
    # lieux=ClientSerializer(many=True)
    # agent=AgentSerializer(many=False,read_only=True)
    # com=CommercialSerializer(many=True)
    # typemission=TypeMissionSerializer(many=True)
    # # def create(self,validated_data):
    #     co=Commercial.objects.filter(name__in=validated_data.get('com'))
    #     agent=Agent.objects.get(name=validated_data['agent'])
    #     timing=validated_data['timing']
    #     lieu=Client.objects.filter(cl_name__in=validated_data.get('lieux'))
    #     created_on=validated_data.get('created_on')
    #     modified_on=created_on
    #     libelle=validated_data.get('libelle')
    #     typemission=TypeMission.objects.filter(name__in=validated_data.get('typemission'))
    #     programme=Programme.objects.create(agent=agent,com=co,  timing=timing, lieux=lieu, created_on=created_on, modified_on=modified_on, libelle=libelle,typemission=typemission)
    #     return programme



