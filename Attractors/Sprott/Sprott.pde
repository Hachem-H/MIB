//
// An attractor by Julian C. Spott
// from his books and seminars on chaos, complex systems
// and time-series analysis
//

ArrayList<PVector> vertices = new ArrayList<PVector>();
float dt = 0.1;
float angle = 0;

/* Initial Conditions */
float x = 0.01;
float y = 0.01;
float z = 0.01;

float dx = 0.01;
float dy = 0.01;
float dz = 0.01;

/* Paramaters */
float a = 0.95;
float b = 0.7;
float c = 0.6;
float d = 3.5;
float e = 0.25;
float f = 0.1;

void setup() { size(1920, 1080, P3D); }
void draw()
{
    /* Differencial equations */
    dx = ((z-b)*x - dy)                * dt;
    dy = (dx+(z-b)*y)                  * dt;
    dz = (c+a*z-(pow(z,3)/3)-(pow(x,2)+pow(y,2))
         *(1+e*z)+f*z*(pow(x,3)))      * dt;
    
    /* Evolve the system */
    x += dx;
    y += dy;
    z += dz;
   
    /* Rendering */
    angle += 0.01;
    vertices.add(new PVector(x, y, z));
    
    background(0);
    translate(width/2, height/2);
    //rotate(angle);
    rotateY(angle);
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
