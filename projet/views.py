from django.http import HttpResponseRedirect,HttpResponse
from django.core.urlresolvers import reverse
from django.shortcuts import render ,get_object_or_404
from django.views import generic
from projet import models, serializer,authentication,services
from rest_framework import viewsets,status,views
from rest_framework.response import Response
from django.contrib.auth.models import User, Group
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
import json
from django.core.exceptions import ObjectDoesNotExist

from rest_framework import serializers,permissions
from .permissions import IsStaffOrTargetUser
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import login,logout
from django.db.models import Q,Count
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from django.shortcuts import render_to_response
from django.http import HttpResponseBadRequest, JsonResponse, HttpResponse
from django import forms
from django.template import RequestContext
import django_excel as excel
import pyexcel.ext.xls
tab_ser={
    'lieu':serializer.ClientSerializer,
    'com':serializer.CommercialSerializer,
    'agent':serializer.AgentSerializer
}
tab_mod={
    'lieu':models.Client,
    'com':models.Commercial,
    'agent':models.Agent

}
class AuthView(views.APIView):
    authentication_classes =  (SessionAuthentication, BasicAuthentication)
    serializer_class = serializer.UserSerializer
    permission_classes = (IsAuthenticated,)

 
    def post(self, request, *args, **kwargs):
        login(request, request.user)
        return Response(self.serializer_class(request.user).data)
    def delete(self,request,*args,**kwargs):
        logout(request)
        return Response({})
class UserView(viewsets.ModelViewSet):
    serializer_class = serializer.UserSerializer
    model = User
 
    def get_permissions(self):
        # allow non-authenticated user to create via POST
        return (permissions.AllowAny() if self.request.method == 'POST'
                else IsStaffOrTargetUser()),
class IndexView(generic.ListView):
    template_name='projet/index.html'
    context_object_name='my_clients'
    def get_queryset(self):
        return models.Client.objects.all()
def detailClient(request, cl_id):
    client=models.Client.objects.get(pk=cl_id)
    return render(request,'projet/detailcl.html',{'client':client})   
class ClientViewSet(viewsets.ModelViewSet):
    queryset= models.Client.objects.all()
    serializer_class=serializer.ClientSerializer
    def get_queryset(self):
        if (self.kwargs):
            i=self.kwargs['pk']
            obj=models.Client.objects.filter(pk=i)
            return obj
        else:
            typ=self.request.query_params.getlist('type')
            ty=models.Type.objects.filter(type_name__in=typ)
            result=models.Client.objects.filter(cl_type__in=ty)
            if(result.count()==0):
                return models.Client.objects.all()
            return result
class CategorieViewSet(viewsets.ModelViewSet):

    queryset=models.Categorie.objects.all() 
    serializer_class=serializer.CategorieSerializer   
class TachesViewSet(viewsets.ModelViewSet):
    queryset= models.Mission.objects.all()
    serializer_class=serializer.TacheSerializer
    def get_queryset(self):
        if(self.kwargs):
            return models.Mission.objects.filter(pk=self.kwargs['pk'])
        elif(self.request.query_params):
            if(self.request.query_params.get('com_id')!='Tous'):
                com_id=self.request.query_params.get('com_id')
                obj=models.Mission.objects.filter(com=com_id,date_do=datetime.now()).order_by('-date_do','-time_do')
                if (obj.count()==0):
                    return models.Mission.objects.filter(com=com_id)
                else:
                    return obj  
            else:
                return models.Mission.objects.all().order_by('-date_do','-time_do')        

        else:
            return models.Mission.objects.all().order_by('-date_do','-time_do')
class TypeViewSet(viewsets.ModelViewSet):
    queryset=models.Type.objects.all()
    serializer_class=serializer.TypeSerializer
class TacheView(viewsets.ModelViewSet):
    queryset= models.Mission.objects.all().filter(etat=False)
    serializer_class=serializer.TachesSerializer
    depth=1
class ZoneViewSet(viewsets.ModelViewSet):
    queryset=models.Zone.objects.all()
    serializer_class=serializer.ZoneSerializer
    def get_queryset(self):
        if (self.kwargs):
            i=self.kwargs['pk']
            obj=models.Zone.objects.filter(pk=i)
            return obj
        else:
            typ=self.request.query_params.getlist('cat')
            ty=models.Categorie.objects.filter(name__in=typ)
            result=models.Zone.objects.filter(categorie__in=ty)
            return result
class CommercialViewSet(viewsets.ModelViewSet):
    queryset=models.Commercial.objects.all()
    serializer_class=serializer.CommercialSerializer
class AgentViewSet(viewsets.ModelViewSet):
    queryset=models.Agent.objects.all()
    serializer_class=serializer.AgentSerializer        
class UtilisateurViewSet(views.APIView):
    ##    queryset=models.Utilisateur.objects.all()
 
    def get(self, *args, **kwargs):
        
        query=models.Utilisateur.objects.all()
        serializer_class=serializer.UtilisateurSerializer

        username=self.request.query_params.get('login',None)
        pwd=self.request.query_params.get('pwd',None)
        
        if username is not None and pwd is not None:
            
            query=models.Utilisateur.objects.filter(Q(login=username) & Q(pwd=pwd))
            if query:
                obj=query.get()
                ser=serializer_class(obj)
                #nom=query.get_name()
                return Response({
                    'status':'ok',
                    'message':'baxxna',
                    'user':ser.data,
                    #'user':nom
                    
                    
                    }, status=status.HTTP_201_CREATED)
        
            return Response({
                    'status':'ko',
                    'message':'baxoul'
                    }, status=status.HTTP_400_BAD_REQUEST)
        
        else:
            return Response({
                    'status':'ko',
                    'message':'request'
                    }, status=status.HTTP_400_BAD_REQUEST)
class TypeMissionViewSet(viewsets.ModelViewSet):
    queryset=models.TypeMission.objects.all()
    serializer_class=serializer.TypeMissionSerializer
class ObservationViewSet(views.APIView):
    def post(self, request):
        data = request.data
        etat=data.get('etat',None)
        text=data.get('observation',None)
        mission=data.get('idMission',None)
        observation=models.MissionObs.objects.create(etat=etat,observation=text,mission_id=mission)
        if observation is not None:
        
            observation.save()
            return Response({
                'status':'ok',
                'message':'leipp djamm'
                }, status=status.HTTP_201_CREATED)
        else:
            
            return Response({
                    'status':'ko',
                    'message':'baxoul'
                    }, status=status.HTTP_400_BAD_REQUEST)
class ProgrammeViewSet(viewsets.ModelViewSet):
    queryset=models.Programme.objects.all()
    serializer_class=serializer.ProgrammeSerializer
class UploadFileForm(forms.Form):
    file = forms.FileField()

def import_data(request):
    if request.method == "POST":
        form = UploadFileForm(request.POST,
                              request.FILES)
        # def choice_func(row):
        #     q = Question.objects.filter(slug=row[0])[0]
        #     row[0] = q
        #     return row
        if form.is_valid():
            request.FILES['file'].save_book_to_database(
                models=[models.Exceltest],
                initializers=[None],
                mapdicts=
                    ['id', 'nom', 'prenom','age'],
            )
            return HttpResponse("OK", status=200)
        else:
            return HttpResponseBadRequest()
    else:
        form = UploadFileForm()
    return render_to_response(
        'upload_form.html',
        {
            'form': form,
            'title': 'Import excel data into database example',
            'header': 'Please upload sample-data.xls:'
        },
        context_instance=RequestContext(request))
def export_data(request):
    queryset=models.Exceltest.objects.all()
    columns=['id','nom','prenom','age']
    return excel.make_response_from_query_sets(
        queryset,
        columns,
        'xls',
        file_name="import_"+str(datetime.now())+""
    )
##class Connexion(views.APIView):
##    def post(self,request):
##        data=json.loads(request.body)
##        login=data.get('login',None)
##        password=data.get('pwd',None)
        
        
##
##        email = data.get('email', None)
##        password = data.get('password', None)
##
##        account = authenticate(email=email, password=password)
##
##        if account is not None:
##            if account.is_active:
##                login(request, account)
##
##                serialized = AccountSerializer(account)
##
##                return Response(serialized.data)
##            else:
##                return Response({
##                    'status': 'Unauthorized',
##                    'message': 'This account has been disabled.'
##                }, status=status.HTTP_401_UNAUTHORIZED)
##        else:
##            return Response({
##                'status': 'Unauthorized',
##                'message': 'Username/password combination invalid.'
##            }, status=status.HTTP_401_UNAUTHORIZED)
##class UtilisateurViewSe(views.APIView):
##    queryset=models.Utilisateur.objects.all()
##    serializer_class=serializer.UtilisateurSerializer
## 
##    def get_queryset(self,request):
##        
##        queryset=models.Utilisateur.objects.all()
##        username=request.query_params.get('login',None)
##        pwd=self.request.query_params.get('pwd',None)
##        
##        if username is not None and pwd is not None:
##            
##            user=queryset.filter(login=username,pwd=pwd)
##            if user is not None:
##                return Response({
##                    'status':'ok',
##                    'message':'utilisateur connecté',
##                    'user':queryset,
##                    },status=status.HTTP_201_CREATED)
##            else:
##               return Response({
##                    'status':'ko',
##                    'message':'mauvais veuillez renseigner les bonnes données',
##                    
##                    },status=status.HTTP_400_BAD_REQUEST) 
##            
##        else:
##        
##            return Response({
##                    'status':'ko',
##                    'message':'vous devez renseigner le login et le mot de passe',
##                    },status=status.HTTP_400_BAD_REQUEST)
##        return queryset
class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

        
@api_view(['GET','POST'])
def client_list(request):
    ser_class=serializer.ClientSerializer
    if(request.method=='GET'):
       clients=models.Client.objects.all()
       ser=ser_class(clients, many=True)
       return Response(ser.data,status=status.HTTP_201_CREATED)
    elif( request.method=='POST'):
        #data=JSONParser().parse(request)
        ser=ser_class(data=request.data)
        if(ser.is_valid()):
            ser.save()
            return Response(ser.data,status=status.HTTP_201_CREATED)
        return Response(ser.errors,status=status.HTTP_400_BAD_REQUEST)
       
@api_view(['GET','PUT','DELETE'])
def client_detail(request, pk):
    ser_class=serializer.ClientSerializer

    """
    Retrieve, update or delete a code snippet.
    """
    try:
        client = models.Client.objects.get(pk=pk)
    except models.Client.DoesNotExist:
        return Response(status=status.HTTP_400_BAD_REQUEST)

    if request.method == 'GET':
        serializ = ser_class(client)
        return Response(serializ.data,status=status.HTTP_201_CREATED)

    elif request.method == 'PUT':
        #data = JSONParser().parse(request)
        serializ = ser_class(client, data=request.data)
        if serializ.is_valid():
            serializ.save()
            return Response(serializ.data,status=status.HTTP_201_CREATED)
        return Response(serializ.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        client.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
@api_view(['GET'])
def missions_stat(request):
    # filtre=request.query_params.get('filtre')
    # debut=request.query_params.get('debut')
    # fin=request.query_params.get('fin')
    # idi=request.query_params.get('com')
    # 
    # missions=models.Mission.objects.filter(date_do__gt=debut,date_do__lt=fin,com=idi)
    # #.values(filtre)
    #.annotate(total=Count(filtre))
    tab=[]
    i=0
    ser_class=serializer.TacheSerializer
    # 

    tparam=[]
    i=0
    erreur="aucunes données correspondant a votre requète n'a été trouvée"
    missions=models.Mission.objects.all()
    if request.query_params.getlist('com'):
        com=request.query_params.getlist('com')
        missions=missions.filter(com__in=com)
    if request.query_params.get('etat'):
        etat=request.query_params.get('etat')
        missions=missions.filter(etat=etat)
    if request.query_params.getlist('lieu'):
        lieu=request.query_params.getlist('lieu')
        missions=missions.filter(lieu__in=lieu)
    if request.query_params.get('debut'):
        debut=request.query_params.get('debut')
        missions=missions.filter(date_do__gte=debut)
    if request.query_params.get('fin'):
        fin=request.query_params.get('fin')
        missions=missions.filter(date_do__lte=fin)
    if request.query_params.getlist('agent'):
        agent=request.query_params.getlist('agent')
        missions=missions.filter(agent__in=agent)
    if request.query_params.getlist('fildate'):
        query = missions.values('date_do').annotate(t=Count('date_do'))
    
    for m in missions:
        mi=(ser_class(m)).data
        tab.insert(i,mi)
        i=i+1
    # if query.count()!=0:
    #     tab.append(query)
    if missions.count()==0:
        return Response({'erreur':erreur},status=status.HTTP_201_CREATED)
    # for param in request.query_params:
    #     value=request.query_params.get(param)
    #     aa=models.Mission._meta.get_field(param)
    #     missions=missions.filter(param=value)
    #     tparam.insert(i,{param:value})
    #     i=i+1

    return Response(tab,status=status.HTTP_201_CREATED)   
    # if(filtre!='etat'):
    #     # ser_class=serializer.ClientSerializer
    #     # classe=models.Client
    #     tab=services.Filtre(missions,tab_ser[filtre],filtre,tab_mod[filtre])
    #     return Response(tab,status=status.HTTP_201_CREATED)
    #return Response(tab,status=status.HTTP_201_CREATED)
    # if(filtre=='lieu'):
    #     tab=[]
    #     try:
    #         missions=models.Mission.objects.all().values(filtre).annotate(total=Count(filtre))           
    #         i=0
    #         classe=models.Client
    #         ser_class=serializer.ClientSerializer
    #         for m in missions:            
    #             ii=classe.objects.get(pk=m[filtre])
    #             mi=(ser_class(ii)).data
    #             ti=m['total']
    #             t={filtre:mi,'total':ti}
    #             tab.insert(i,t)
    #             i=i+1
    #         return Response(tab,status=status.HTTP_201_CREATED)
    #     except Exception as e:
    #         return Response({'error':str(e),'tab':tab},status=status.HTTP_400_BAD_REQUEST)