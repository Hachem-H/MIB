//
// The Rössler Attractor, a dynamic, non linear set of differential equations
// studied by the biochemist, Otto Rössler.
// https://en.wikipedia.org/wiki/R%C3%B6ssler_attractor
//

ArrayList<PVector> vertices = new ArrayList<PVector>();
float dt = 0.05;
float angle = 0;

/* Initial Conditions */
float x = 0;
float y = 0;
float z = 0;

/* Paramaters */
float a = 0.2;
float b = 0.2;
float c = 5.7;

void setup() { size(1920, 1080, P3D); }
void draw()
{
    /* Differencial equations */
    float dx = (-y-z)      * dt;
    float dy = (x+a*y)     * dt;
    float dz = (b+z*(x-c)) * dt;
    
    /* Evolve the system */
    x += dx;
    y += dy;
    z += dz;
   
    /* Rendering */
    angle += 0.01;
    vertices.add(new PVector(x, y, z));
    
    background(0);
    translate(width/2, height/2);
    rotateX(angle);
    rotateY(angle);
    scale(10);
    stroke(255);
    strokeWeight(0.5);
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
