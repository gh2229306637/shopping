from django.conf.urls import url
from lcc import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^register/$',views.register,name='register'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^login/$',views.login,name='login'),
    url(r'^detail/(\d+)/$',views.detail,name='detail'),
    url(r'^checkphone/$',views.checkphone,name='checkphone'),
    url(r'^shoppingCart/$',views.shoppingCart,name='shoppingCart'),
    url(r'^addCart/$',views.addCart,name='addCart'),
    url(r'^change/$',views.change,name='change'),
    url(r'^allselect/$',views.allselect,name='allselect'),
]





