import unittest
import testinfra

"""
The `host` parameter for each of these functions is something that
is injected into each test function by the testinfra pytest plugin.
"""

def test_user_exist(host):
    user = host.user("vagrant")
    assert user.exists

def test_authorized_keys(host):
    authorized_keys = host.file("/home/vagrant/.ssh/authorized_keys")
    assert authorized_keys.exists

def test_sshd_service(host):
    service = host.service("sshd")
    assert service.is_running
    assert service.is_enabled
