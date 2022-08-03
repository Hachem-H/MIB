//
// The Lorenz Attractor, a dynamic and chaotic system first studied by 
// great mathematician and meteorologist, Edward Lorenz.
// https://en.wikipedia.org/wiki/Lorenz_system
//

ArrayList<PVector> vertices = new ArrayList<PVector>();
float dt = 0.01;
float angle = 0;

/* Initial Conditions */
float x = 0.01;
float y = 0;
float z = 0;

/* Paramaters */
float sigma = 10;
float rho = 28;
float beta = 8/3;

void setup() { size(1920, 1080, P3D); }
void draw()
{
    /* Differencial equations */
    float dx = (sigma * (y - x))   * dt;
    float dy = (x * (rho - z) - y) * dt;
    float dz = (x*y - beta*z)      * dt;
    
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
    scale(8);
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
