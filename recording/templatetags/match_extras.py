from django import template
from django.template.defaultfilters import stringfilter

register = template.Library();

@register.filter
@stringfilter
def get_class_name(obj):
    print type(obj)
    print str(obj.__class__.__name__)
    return str(obj.__class__.__name__)


@register.filter
def get_item(l, i):
    try:
        return l[i]
    except:
        return None

