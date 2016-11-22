"""projetweb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from projet import views
from rest_framework import routers
from django.conf.urls.static import static
from django.conf import settings
app_name='projet'


router=routers.DefaultRouter(trailing_slash=False)
##router.register(r'users', views.UserViewSet)
##router.register(r'groups', views.GroupViewSet)
router.register(r'clients',views.ClientViewSet)
router.register(r'taches',views.TachesViewSet)
##router.register(r'tache',views.TacheView)
router.register(r'types', views.TypeViewSet)
router.register(r'zones', views.ZoneViewSet)
router.register(r'categories',views.CategorieViewSet)
router.register(r'commerciaux',views.CommercialViewSet)
router.register(r'agents',views.AgentViewSet)
router.register(r'typemissions',views.TypeMissionViewSet)
router.register(r'programmes',views.ProgrammeViewSet)
##router.register(r'connexion',views.UtilisateurViewSet)
#router.register(r'connex',views.UtilisateurViewSe.as_view())
router.register(r'accounts', views.UserView, 'list')
#router.register(r'clis',views.client_list,base_name='liste')
#router.register(r'cli/(?P<pk>[0-9]+)',views.client_detail, base_name='detail')
#router.register(r'stats',views.missions_stat,base_name='stats')
#router.register(r'observations',views.ObservationViewSet.as_view())
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$',views.IndexView.as_view(),name='index'),
    url(r'^api-auth/',include('rest_framework.urls')),
    url(r'^api/',include(router.urls)),
    #url(r'^testreq/',views.testreq,name='testreq'),
    url(r'^detailclient/(?P<cl_id>[0-9]+)/$',views.detailClient,name='detailclient'),
    url(r'^api/login', views.UtilisateurViewSet.as_view(),name='logins'),
    url(r'^api/auth/$',views.AuthView.as_view(),name='authenticate'),
    url(r'^api/stat', views.missions_stat),
    url(r'^api/clis/$', views.client_list),
    url(r'^api/clis//(?P<pk>[0-9]+)', views.client_detail),
    url(r'^import/', views.import_data, name="import"),
    url(r'^export/', views.export_data, name="export"),



##    url(r'^api/taches/(?P<com_id>[0-9]+)',views.TacheViewSet)


    
    #url(r'^testmap/',views.TestMap.as_view(),name='mes tests'),
   # url(r'^clients/',views.ClientViewSet)
]
urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
