class Box {
  PVector pos;
  float r;

  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }

  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for(int x = -1; x < 2; x++) {
      for(int y = -1; y < 2; y++) {
        for(int z = -1; z < 2; z++) {
	
	  int sum = abs(x) + abs(y) + abs(z);
	  float newR = r/3;
	  if(sum > 1) {
	    Box b = new Box(pos.x + x * newR, pos.y + y * newR, pos.z + z * newR, newR);
	    boxex.add(b);
	  }
	}
      }
    }
    return boxes;
  }
  
  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255);
    box(r);
    popMatrix();
  }
}



float a = 0;
Box b;

ArrayList<Box> sponge;
void setup() {
  size(400,400, P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0,0,0,200);
  sponge.add(b);
}

void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for(Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}

void draw() {
  background(51);
  stroke(255);
  noFill();
  lights();

  translate(width/2, height/2);
  rotateX(a);
  rotateY(a);
  for(Box b : sponge) {
    b.show();
  }

  a += 0.01;
}





