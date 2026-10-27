"""Register optional, runnable Python/Flask teaching examples."""

from . import (HelloWorld, HelloWorldAgain, QuerySQLServer, WorksOnDeptEmpProj,
               sampleForm, EmpQuery, WorksOnQuery, EmpProjQuery, index)


def register_examples(app):
    for module in (index, HelloWorld, HelloWorldAgain, QuerySQLServer,
                   WorksOnDeptEmpProj, sampleForm, EmpQuery, WorksOnQuery,
                   EmpProjQuery):
        app.register_blueprint(module.bp)
