---
title: Using Fractal with Laraval
---


Fractal is your presentation and transformation layer for complex data output.
It is basically the stuff which you have been doing in your Controller (of MVC).

Here are different way of writing code. The Oc is the namespace for the
application in the example code.

# Code without fractal

Controller Class function:

    public function index()
    {
        // paginate the Doctor table and return the response
        return \Oc\Doctor::paginate(25);
    }

The above code in the Laravel Controller is sending all the databases field
back in the REST response without any transformation. This is a bad idea as any
change in the database has impact on the REST API.


# Stupid Code with Fractal. Everything at one place.

Controller Class function:

    public function index()
    {

        $fractal = new Fractal\Manager();

        $paginator = \Oc\Doctor::paginate(25);
        $doctors = $paginator->getCollection();

        // Fractal resource
        $resource =  new Fractal\Resource\Collection($doctors, function(\Oc\Doctor $doctor) {
            return [
                'id'   => $doctor->id,
                'name' => $doctor->name,
            ];
        });
        $resource->setPaginator(new Fractal\Pagination\IlluminatePaginatorAdapter($paginator));
        return $fractal->createData($resource)->toArray();
    }

Bigger Code but better. You can organize the code better by moving the
Transformer in its own class and creating the fractal Manager at a global place
rather than in the controller function.


# Code with Fractal and Tranformer class


Controller Class function:

    public function index()
    {

        $fractal = new Fractal\Manager();

        $paginator = \Oc\Doctor::paginate(25);
        $doctors = $paginator->getCollection();

        $resource = new Fractal\Resource\Collection($doctors, new \Oc\Transformers\DoctorTransformer);
        $resource->setPaginator(new Fractal\Pagination\IlluminatePaginatorAdapter($paginator));
        return $fractal->createData($resource)->toArray();
    }


Transformer Class

    <?php

    namespace Oc\Transformers;

    use League\Fractal;

    class DoctorTransformer extends Fractal\TransformerAbstract
    {
        public function transform(\Oc\Doctor $doctor)
        {
            return [
                'id'   => $doctor->id,
                'name' => $doctor->name,
            ];
        }
    }


Advantage of putting in a class is reuse. You can use the same class for
transformation in different controllers.


References

- http://fractal.thephpleague.com/
