HashMap<String, HashMap<String, Float>> rules;
ArrayList<Atom> atoms;

class Atom
{
    float x, y, vx, vy;
    String col;

    Atom(float x, float y, String col)
    {
        this.x = x;
        this.y = y;
        this.vx = 0;
        this.vy = 0;
        this.col = col;
    }
}

void createAtoms(int number, String col)
{
    for (int i = 0; i < number; i++)
        atoms.add(new Atom(random(width), random(height), col));
}

void applyRules()
{
    for (int i = 0; i < atoms.size(); i++)
    {
        float fx = 0;
        float fy = 0;
        Atom a = atoms.get(i);

        for (int j = 0; j < atoms.size(); j++)
        {
            if (j != i)
            {
                Atom b = atoms.get(j);
                float g = rules.get(a.col).get(b.col);

                if (g != 0)
                {
                    float dx = a.x - b.x;
                    float dy = a.y - b.y;

                    if (dx != 0 || dy != 0)
                    {
                        float d = dx * dx + dy * dy;

                        if (d < 6400)
                        {
                            float F = g / sqrt(d);
                            fx += F * dx;
                            fy += F * dy;
                        }
                    }
                }
            }
        }

        a.vx = (a.vx + fx)/2;
        a.vy = (a.vy + fy)/2;
        a.x += a.vx;
        a.y += a.vy;

        if (a.x <= 0 || a.x >= width)
        {
            a.vx *= -1;
            a.x = constrain(a.x, 0, width);
        }

        if (a.y <= 0 || a.y >= height)
        {
            a.vy *= -1;
            a.y = constrain(a.y, 0, height);
        }
    }
}

color getColor(String col)
{
    switch (col)
    {
    case "yellow":
        return color(238, 237, 9);
    case "green":
        return color(128,128,0);
    case "blue":
        return color(30,144,255);
    case "red":
        return color(178,34,34);
    default:
        return color(255);
    }
}

void RandomRules(HashMap<String, Float> yellowRules, HashMap<String, Float> greenRules,
    HashMap<String, Float> blueRules, HashMap<String, Float> redRules)
{
    yellowRules.put("yellow", random(-1, 1));
    yellowRules.put("green", random(-1, 1));
    yellowRules.put("blue", random(-1, 1));
    yellowRules.put("red", random(-1, 1));

    greenRules.put("yellow", random(-1, 1));
    greenRules.put("green", random(-1, 1));
    greenRules.put("blue", random(-1, 1));
    greenRules.put("red", random(-1, 1));

    blueRules.put("yellow", random(-1, 1));
    blueRules.put("green", random(-1, 1));
    blueRules.put("blue", random(-1, 1));
    blueRules.put("red", random(-1, 1));

    redRules.put("yellow", random(-1, 1));
    redRules.put("green", random(-1, 1));
    redRules.put("blue", random(-1, 1));
    redRules.put("red", random(-1, 1));
}

void setup()
{
    size(1920, 1080);

    rules = new HashMap<String, HashMap<String, Float>>();
    atoms = new ArrayList<Atom>();

    HashMap<String, Float> yellowRules = new HashMap<String, Float>();
    HashMap<String, Float> greenRules  = new HashMap<String, Float>();
    HashMap<String, Float> blueRules   = new HashMap<String, Float>();
    HashMap<String, Float> redRules    = new HashMap<String, Float>();

    // RandomRules(yellowRules, greenRules, blueRules, redRules);

    yellowRules.put("yellow", 0.8422661062679588);
    yellowRules.put("green", 0.8283611643992606);
    yellowRules.put("blue", -0.6206303204367405);
    yellowRules.put("red", -0.8050409003234531);

    greenRules.put("yellow", 0.3632328353781209);
    greenRules.put("green", 0.8782140141582540);
    greenRules.put("blue", 0.4357079645785089);
    greenRules.put("red", 0.3839429322945640);

    blueRules.put("yellow", -0.81550396086816070);
    blueRules.put("green", -0.62766791422947770);
    blueRules.put("blue", 0.49503848830455155);
    blueRules.put("red", -0.48726835984229977);

    redRules.put("yellow", -0.68624691673919400);
    redRules.put("green", -0.81312798120668540);
    redRules.put("blue", -0.42403398294928163);
    redRules.put("red", 0.87615640465673960);

    rules.put("yellow", yellowRules);
    rules.put("green", greenRules);
    rules.put("blue", blueRules);
    rules.put("red", redRules);

    createAtoms(500, "yellow");
    createAtoms(500, "red");
    createAtoms(500, "green");
    createAtoms(500, "blue");
}


void draw()
{
    applyRules();
    background(18);
    
    noStroke();
    for (int i = 0; i < atoms.size(); i++)
    {
        Atom a = atoms.get(i);
        fill(getColor(a.col));
        rect(a.x, a.y, 3, 3);
    }
}
