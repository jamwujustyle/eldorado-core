import time
from psycopg import OperationalError as PsycopgError
from django.db.utils import OperationalError
from django.core.management.base import BaseCommand


class Command(BaseCommand):

    def handle(self, *args, **kwargs):
        self.stdout.write("Waiting for database")
        db_up = False
        while db_up is False:
            try:
                self.check(databases=["default"])
                db_up = True
            except (PsycopgError, OperationalError):
                self.stdout.write("database unavailable, waiting 1 sec")
                time.sleep(1)

        self.stdout.write(self.style.SUCCESS("DATABASE AVAILABLE!"))
