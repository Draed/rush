from locust import HttpUser, between, task

class WebsiteUser(HttpUser):
   wait_time = between(3, 6)

   def on_start(self):
      self.client.get("/")

   @task
   def task1(self):
      self.client.get("/")

   @task
   def task2(self):
     self.client.get("/poc")