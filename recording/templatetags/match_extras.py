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


@register.filter(name="first_name")
@stringfilter
def get_first_name(l):
    try:
        splitted = str(l).split(" ")
        return str(splitted[0])
    except:
        return str("")

@register.filter(name="last_name")
@stringfilter
def get_last_name(l):
    try:
        splitted = l.split(" ")
        return str(splitted[-1])
    except:
        return str("")
