from django.shortcuts import render

# Create your views here.

from django.views import generic

from django.urls import reverse_lazy # URLの逆引き
from django.contrib import messages # ブラウザで応答 ERROR/WARNING/SUCCESS/INFO
from django.contrib.auth.mixins import LoginRequiredMixin # ログイン状態でないとアクセスできない仕組みを持つクラス


import logging
logger = logging.getLogger(__name__)

# 初期画面
class IndexView(generic.TemplateView):
    template_name = 'index.html'