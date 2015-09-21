---
title: Laravel Dependency Injection
---

Dependency Injection is a design where client in place of creating the
objects/dependencies which it needs gets it injected by the caller code.

The wikipedia has a good article on it, especially the aside section on
'Dependency injection for five-year-olds'.

The internet explains the advantages/disadvantages of the Dependency Injection.
The advantage are loosely coupled and easier to test code.

One advantage which I also found is a clean code. Some of the code pieces,
becomes common in all the files. For example in a laravel application using
fractal for data translation, you can see the Fractal Manager being created in
different controller functions. The creation of the Fractal Manager can easily
be delegated to the laravel framework which allows dependency injectio in the
methods. This also makes your code a line smaller and may be easier to read.


Here is the laravel controller show code using fractal manager without the
dependeny inject.

    use League\Fractal\Manager as FractalManager;
    use League\Fractal\Resource\Collection as FractalResourceCollection;
    use League\Fractal\Resource\Item as FractalResourceItem;
    use League\Fractal\Pagination\IlluminatePaginatorAdapter as FractalPaginator;

    public function index()
    {
        $model = \Oc\Doctor::all();
        $resource = new FractalResourceCollection(
            $model->getCollection(),
            $this->getTransformer()
        );
        $resource->setPaginator(new FractalPaginator($model));
        $fractal = new FractalManager();
        return $fractal->createData($resource)->toArray();
    }

With the dependency injection for fractal manager, you can code a line less.

    public function index(FractalManager $fractal)
    {
        $model = \Oc\Doctor::all();
        $resource = new FractalResourceCollection(
            $model->getCollection(),
            $this->getTransformer()
        );
        $resource->setPaginator(new FractalPaginator($model));
        return $fractal->createData($resource)->toArray();
    }

Laravel 5.1, you can also choose to inject the model like this. One more line
less:

    public function index(FractalManager $fractal, \Oc\Doctor $model)
    {
        $resource = new FractalResourceCollection(
            $model->getCollection(),
            $this->getTransformer()
        );
        $resource->setPaginator(new FractalPaginator($model));
        return $fractal->createData($resource)->toArray();
    }

Two lines less really does not make a difference to the production code, but
sometimes you get enlightened after looks few lesser lines and may start
generalizing the code.

References
- http://laravel.com/docs/5.1/controllers#dependency-injection-and-controllers
- http://laravel.com/docs/5.0/routing#route-model-binding
