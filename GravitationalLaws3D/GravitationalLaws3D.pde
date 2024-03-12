float G = 100;
float F(float mass1, float mass2, float distance)
{
    return G*(mass1*mass2)/pow(distance, 2);
}

/* ==== Simulation Engine ==== */
import peasy.*;
PeasyCam cam;

enum BodyType
{
    SUN,
    PLANET,
}

class Body
{
    ArrayList<PVector> trail;
    PVector position;
    PVector velocity;
    float mass;
    BodyType type;

    Body(PVector position, PVector velocity, float mass, BodyType type)
    {
        this.trail    = new ArrayList<PVector>();
        this.position = position;
        this.velocity = velocity;
        this.mass     = mass;
        this.type     = type;
    }

    void Render()
    {
        noStroke();
        push();
        translate(position.x, position.y, position.z);
        sphere(this.mass/2);
        pop();

        stroke(255);
        for (int i = 1; i < trail.size(); i++)
        {
            PVector prevPosition = trail.get(i-1);
            PVector currPosition = trail.get(i);

            float alpha = map(i, 1, trail.size(), 0, 255);
            stroke(255, alpha);
            line(prevPosition.x, prevPosition.y, prevPosition.z, currPosition.x, currPosition.y, currPosition.z);
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
    size(1920, 1080, P3D);

    cam = new PeasyCam(this, 1000);
    sun = new Body(new PVector(0, 0, 0), new PVector(0, 0, 0), 50, BodyType.SUN);
    planets = new ArrayList<Body>();

    for (int i = 0; i < 5; i++)
    {
        float mass = random(5, 15);
        float radius = 4*sun.mass + i*random(50, 80);
        float angle = random(0, TWO_PI);

        PVector position = new PVector(radius*cos(angle), radius*sin(angle), 0);
        PVector velocity = position.copy();

        if (random(1) < 0.66)
            velocity.rotate(HALF_PI);
        else
            velocity.rotate(-HALF_PI);

        velocity.normalize();
        velocity.mult(sqrt((G*sun.mass)/radius));

        planets.add(new Body(position, velocity, mass, BodyType.PLANET));
    }
}

void draw()
{
    background(0);
    rotateX(frameCount*0.001);
    rotateY(-frameCount*0.001);
    rotateZ(frameCount*0.001);
     
    pointLight(255, 255, 255, 0, 0, 0);
    ambientLight(255, 255, 255);
    fill(255, 255, 255);
    sun.Render();
    
    noLights();
    pointLight(255, 255, 255, 0, 0, 0);

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
        
        planet1.Render();
        planet1.Update();
    }
}
