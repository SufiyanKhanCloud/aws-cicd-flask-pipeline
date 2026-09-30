from app import app


def test_health_endpoint():
    res = app.test_client().get("/health")
    assert res.status_code == 200
    assert res.get_json()["status"] == "ok"


def test_index_has_version():
    res = app.test_client().get("/")
    assert "version" in res.get_json()
