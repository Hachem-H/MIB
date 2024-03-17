ArrayList<PVector> vertices = new ArrayList<PVector>();
boolean ran = false;
float factor = 0;
float dt = 0.01;
float angle = 0;

/* Define System */
float x, y, z;
float dx, dy, dz;

void Lorenz()
{
    //
    // The Lorenz Attractor, a dynamic and chaotic system first studied by
    // great mathematician and meteorologist, Edward Lorenz.
    // https://en.wikipedia.org/wiki/Lorenz_system
    //

    /* Paramaters */
    float sigma = 10;
    float rho = 28;
    float beta = 8/3;
    factor = 8;

    if (!ran)
    {
        x = 0.01;
        y = 0;
        z = 0;
        ran = true;
    }

    /* Differencial equations */
    dx = (sigma * (y - x))   * dt;
    dy = (x * (rho - z) - y) * dt;
    dz = (x*y - beta*z)      * dt;
}

void Rossler()
{
    //
    // The Rössler Attractor, a dynamic, non linear set of differential equations
    // studied by the biochemist, Otto Rössler.
    // https://en.wikipedia.org/wiki/R%C3%B6ssler_attractor
    //

    /* Paramaters */
    float a = 0.2;
    float b = 0.2;
    float c = 5.7;
    factor = 10;
    dt = 0.05;

    if (!ran)
    {
        x = 0;
        y = 0;
        z = 0;
        ran = true;
    }

    /* Differencial equations */
    dx = (-y-z)      * dt;
    dy = (x+a*y)     * dt;
    dz = (b+z*(x-c)) * dt;
}

void Halvorsen()
{
    //
    // Halvorsen's symmetric attractor
    //

    /* Paramaters */
    float a = 1.89;
    factor = 30;

    if (!ran)
    {
        x = 0.01;
        y = 0;
        z = 0;
        ran = true;
    }

    /* Differencial equations */
    dx = (-a*x-4*y-4*z-pow(y, 2)) * dt;
    dy = (-a*y-4*z-4*x-pow(z, 2)) * dt;
    dz = (-a*z-4*x-4*y-pow(x, 2)) * dt;
}

void Sprott()
{
    //
    // An attractor by Julian C. Spott
    // from his books and seminars on chaos, complex systems
    // and time-series analysis
    //

    /* Paramaters */
    float a = 0.95;
    float b = 0.7;
    float c = 0.6;
    float e = 0.25;
    float f = 0.1;
    factor = 110;

    if (!ran)
    {
        x = 0.01;
        y = 0.01;
        z = 0.01;

        dx = 0.01;
        dy = 0.01;
        dt = 0.01;
        dt = 0.1;
        ran = true;
    }

    /* Differencial equations */
    dx = ((z-b)*x - dy)                * dt;
    dy = (dx+(z-b)*y)                  * dt;
    dz = (c+a*z-(pow(z, 3)/3)-(pow(x, 2)+pow(y, 2))
        *(1+e*z)+f*z*(pow(x, 3)))        * dt;
}

void setup()
{
    size(1920, 1080, P3D);
}

void draw()
{
    Lorenz();
    //Rossler();
    //Halvorsen();
    //Sprott();

    /* Evolve the system */
    x += dx;
    y += dy;
    z += dz;

    /* Rendering */
    background(0);
    angle += 0.001;

    vertices.add(new PVector(x, y, z));

    translate(width/2, height/2);
    rotate(angle);
    scale(factor);
    stroke(255);
    strokeWeight(0.1);
    noFill();

    float intensity = 100;
    beginShape();
    for (PVector vertex : vertices)
    {
        stroke(intensity);
        vertex(vertex.x, vertex.y, vertex.z);

        intensity += 0.1;
        if (intensity > 255)
            intensity = 100;
    }
    endShape();
}
