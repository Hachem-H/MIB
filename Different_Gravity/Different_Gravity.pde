/* 
 * The following function describes how two masses should attract
 * given the distance between them. Usually this would be 
 * Newton's law of universal graviation:
 *           F = G (m₁m₂)/d²
 * But the point of this simulator is to see how different
 * varieties and modifications to this law change the behavior
 * of orbiting systems.
 * In this simulation, the graviational constant G is not on
 * par with the real world (G=6.67 * 10⁻¹¹) simply because
 * the value is way too small to be used in a computational
 * context. 
 */

float G = 120;
float LawOfMotion(float m1, float m2, float d)
{
    return G * (m1*m2) / (d*d);
}

/* ==== Simulation Engine ==== */

class Body
{
    PVector acceleration = new PVector(0, 0);
    PVector position;
    PVector velocity;
    float mass;
    
    Body(PVector position, PVector velocity, float mass)
    {
        this.position     = position;
        this.velocity     = velocity;
        this.mass         = mass;
    }
    
    void Render()
    {
        noStroke();
        circle(position.x, position.y, this.mass*2);
    }
    
    void ApplyForce(PVector force)
    {
      PVector f = force.copy();
      f.div(mass);
      velocity.add(f);
    }
    
    void Attract(Body body)
    {
        float r = dist(position.x, position.y,
                              body.position.x, body.position.y);
        PVector f = position.copy().sub(body.position);
        f.setMag(LawOfMotion(mass, body.mass, r));
        body.ApplyForce(f);
    }
    
    void Update()
    {
        velocity.add(acceleration);
        position.add(velocity);
        acceleration.mult(0);
    }
}


Body sun;
ArrayList<Body> planets = new ArrayList();

void setup()
{
    size(1920, 1080);
    sun = new Body(new PVector(0, 0), new PVector(0, 0), 50);
    
    for (int i = 0; i < 4; i++)
    {
        float mass = random(5, 15);
        float radius = random(sun.mass*2, min(width/2, height/2));
        float angle = random(0, TWO_PI);
        
        PVector position = new PVector(radius*cos(angle), 
                                       radius*sin(angle));
        PVector velocity = position.copy();
        
        if (random(1) < 0.5) velocity.rotate(HALF_PI);
        else                 velocity.rotate(-HALF_PI);

        velocity.normalize();
        velocity.mult(sqrt((G*sun.mass)/radius));
        
        planets.add(new Body(position, velocity, mass));
  }
}

void draw()
{
    background(0);
    translate(width/2, height/2);
    
    for (Body planet : planets)
    {
        sun.Attract(planet);
        fill(255);
        planet.Render();
        planet.Update();
    }
  
    fill(255, 255, 0);
    sun.Render();
}
