//
// Four wing attractor
//

ArrayList<PVector> vertices = new ArrayList<PVector>();
float dt = 0.08;
float angle = 0;

/* Initial Conditions */
float x = 0.01;
float y = 0.01;
float z = 0.01;

/* Paramaters */
float a = 0.2;
float b = 0.01;
float c = -0.4;

void setup() { size(1920, 1080, P3D); }
void draw()
{
    /* Differencial equations */
    float dx = (a*x + y*z)   * dt;
    float dy = (b*x+c*y-x*z) * dt;
    float dz = (-z-x*y)      * dt;
    
    /* Evolve the system */
    x += dx;
    y += dy;
    z += dz;
   
    /* Rendering */
    angle += 0.01;
    vertices.add(new PVector(x, y, z));
    
    background(0);
    translate(width/2, height/2);
    rotate(angle);
    scale(110);
    stroke(255);
    strokeWeight(0.01);
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
