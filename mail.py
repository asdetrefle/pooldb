import sendgrid
from django.conf import settings
from sendgrid.helpers.mail import *

class MailManager(object):

    def __init__(self, *args, **kwargs):

        self.mail = Mail()
        self.personalization = Personalization()
        self.personalization.add_to(Email('poke.n.hope.hk@gmail.com'))
        #self.personalization.add_to(Email('lionet0621@gmail.com'))

        self.mail.from_email = Email(kwargs.get('sender', 'noreply@poke-n-hope.com'))
        self.mail.subject = kwargs.pop('subject')
        self.mail.add_content(Content("text/plain", kwargs.get('content',"")))

    def add_to(self, *args):
        uargs = set(args)
        for r in uargs:
            if r==u'' or r is None:
                continue
            else:
                self.personalization.add_to(Email(r))
        return

    def add_cc(self, *args):
        uargs = set(args)
        for c in uargs:
            if c==u'' or c is None:
                continue
            else:
                self.personalization.add_cc(Email(c))
        return

    def add_bcc(self, *args):
        uargs = set(args)
        for bc in uargs:
            if bc==u'' or bc is None:
                continue
            else:
                self.personalization.add_bcc(Email(bc))
        return

    def send(self, *args, **kwargs):
        self.mail.add_personalization(self.personalization)
        print("yo")
        sg = sendgrid.SendGridAPIClient(apikey=settings.SENDGRID_API_KEY)
        data = self.mail.get()
        print("titi")
        response = sg.client.mail.send.post(request_body=data)
        print(response.status_code)
        print(response.body)
        print(response.headers)


