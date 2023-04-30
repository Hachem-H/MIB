/*
 * The following function describes how two masses should attract
 * given the distance between them. Usually this would be
 * Newton's law of universal graviation:
 *           F = G (m₁m₂)/d²
 * But the point of this simulator is to see how different
 * varieties and modifications to this law change the behavior
 * of orbiting systems.
 * In this simulation, the graviational constant G is not on
 * par with the real world (G=6.67 * 1/10¹¹) simply because
 * the value is way too small to be used in a computational
 * context.
 */

float G = 100;
float F(float mass1, float mass2, float distance)
{
    return G*(mass1*mass2)/pow(distance, 2);
}

/* ==== Simulation Engine ==== */

class Body
{
    ArrayList<PVector> trail;
    PVector position;
    PVector velocity;
    float mass;

    Body(PVector position, PVector velocity, float mass)
    {
        this.trail    = new ArrayList<PVector>();
        this.position = position;
        this.velocity = velocity;
        this.mass     = mass;
    }

    void Render(color c)
    {
        fill(c);
        noStroke();
        circle(position.x, position.y, this.mass*3/2);

        stroke(c);
        for (int i = 1; i < trail.size(); i++)
        {
            PVector prevPosition = trail.get(i-1);
            PVector currPosition = trail.get(i);

            float alpha = map(i, 1, trail.size(), 0, 255);
            stroke(c, alpha);
            line(prevPosition.x, prevPosition.y, currPosition.x, currPosition.y);
        }
    }

    void Attract(Body body)
    {
        float distance = dist(position.x, position.y, body.position.x, body.position.y);
        PVector force = position.copy().sub(body.position);
        force.setMag(F(mass, body.mass, distance));

        force.div(body.mass);
        body.velocity.add(force);
    }

    void Update()
    {
        position.add(velocity);
        trail.add(position.copy());
        if (trail.size() > 200)
            trail.remove(0);
    }
}

Body sun;
ArrayList<Body> planets;

void setup()
{
    size(1920, 1080);
    sun = new Body(new PVector(0, 0), new PVector(0, 0), 50);
    planets = new ArrayList<Body>();

    for (int i = 0; i < 5; i++)
    {
        float mass = random(5, 15);
        float radius = 2*sun.mass + i*random(50, 60);
        float angle = random(0, TWO_PI);

        PVector position = new PVector(radius*cos(angle), radius*sin(angle));
        PVector velocity = position.copy();

        if (random(1) < 0.66)
            velocity.rotate(HALF_PI);
        else
            velocity.rotate(-HALF_PI);

        velocity.normalize();
        velocity.mult(sqrt((G*sun.mass)/radius));

        planets.add(new Body(position, velocity, mass));
    }
}

void draw()
{
    background(0);
    translate(width/2, height/2);

    for (Body planet1 : planets)
    {
        for (Body planet2 : planets)
            if (planet1 != planet2)
                if (planet1.position.dist(planet2.position)<2*planet1.mass ||
                    planet1.position.dist(planet2.position)<2*planet2.mass ||
                    planet2.position.dist(planet1.position)<2*planet1.mass ||
                    planet2.position.dist(planet1.position)<2*planet2.mass )
                {
                    planet1.Attract(planet2);
                    planet2.Attract(planet1);
                }

        sun.Attract(planet1);
        planet1.Render(color(255));
        planet1.Update();
    }

    sun.Render(color(255, 255, 0));
}
