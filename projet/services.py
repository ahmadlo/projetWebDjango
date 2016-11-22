from projet import models
from rest_framework import status
from rest_framework.response import Response
def Filtre(missions,ser_class,filtre,classe):
	try:
		tab=[]
		i=0
		for m in missions:
			ii=classe.objects.get(pk=m[filtre])
			mi=(ser_class(ii)).data
			ti=m['total']
			t={filtre:mi,'total':ti}
			tab.insert(i,t)
			i=i+1
		return tab
	except Exception as e:
		return str(e) 

	