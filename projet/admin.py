from django.contrib import admin
from projet import models
from import_export import resources,fields
from import_export.admin import ImportExportModelAdmin

class TestAdmin(ImportExportModelAdmin):
    pass
class TestResource(resources.ModelResource):
	full_fields=fields.Field()

	class Meta:
		model = models.Exceltest
		skip_unchanged = True
		report_skipped = False
		fields= ('id', 'nom', 'prenom', 'age',)

	def dehydrate_full_fields(self,test):
		return '%s %s ' % (test.prenom,test.nom)
# Register your models here.
admin.site.register(models.Entreprise)
admin.site.register(models.Agent)
admin.site.register(models.Commercial)
admin.site.register(models.Type)
admin.site.register(models.Zone)
admin.site.register(models.Client)
admin.site.register(models.Mission)
admin.site.register(models.Profil)
admin.site.register(models.Utilisateur)
admin.site.register(models.Categorie)
admin.site.register(models.TypeMission)
admin.site.register(models.Programme)
admin.site.register(models.Exceltest,TestAdmin)




