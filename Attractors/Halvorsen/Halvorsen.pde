//
// Halvorsen's symmetric attractor
//

ArrayList<PVector> vertices = new ArrayList<PVector>();
float dt = 0.01;
float angle = 0;

/* Initial Conditions */
float x = 0.1;
float y = 0;
float z = 0;

/* Paramaters */
float a = 1.89;

void setup() { size(1920, 1080, P3D); }
void draw()
{
    /* Differencial equations */
    float dx = (-a*x-4*y-4*z-pow(y,2)) * dt;
    float dy = (-a*y-4*z-4*x-pow(z,2)) * dt;
    float dz = (-a*z-4*x-4*y-pow(x,2)) * dt;
    
    /* Evolve the system */
    x += dx;
    y += dy;
    z += dz;
    
    /* Rendering */
    background(0);
    angle += 0.005;
    
    vertices.add(new PVector(x, y, z));
    
    translate(width/2, height/2);
    rotateY(angle);
    scale(30);
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
