import sendgrid
from django.conf import settings
from sendgrid.helpers.mail import *

class MailManager(object):

    def __init__(self, *args, **kwargs):

        self.mail = Mail()
        self.personalization = Personalization()
        self.personalization.add_to(Email('poke.n.hope.hk@gmail.com'))
        #self.personalization.add_to(Email('lionet0621@gmail.com'))

        self.mail.from_email = Email(kwargs.get('sender', 'admin@poke-n-hope.com'))
        self.mail.subject = kwargs.pop('subject')
        self.mail.add_content(Content("text/plain", "Coucou"))

    def add_to(self, *args):
        for r in args:
            self.personalization.add_to(Email(r))
        return

    def add_cc(self, *args):
        for c in args:
            self.personalization.add_cc(Email(c))
        return

    def add_bcc(self, *args):
        for bc in args:
            self.personalization.add_bcc(Email(bc))
        return

    def send(self, *args, **kwargs):
        self.mail.add_personalization(self.personalization)
        sg = sendgrid.SendGridAPIClient(apikey=settings.SENDGRID_API_KEY)
        data = self.mail.get()
        response = sg.client.mail.send.post(request_body=data)
        print(response.status_code)
        print(response.body)
        print(response.headers)


