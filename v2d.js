


function v2d(x,y)
{
  this.x = x;
  this.y = y;

  this.set = function(x, y)
  {
  this.x = x;
  this.y = y;
  }
  this.copy = function() {
    return new v2d(this.x,this.y);
  }

  this.lengthSquared = function()
  {
    return this.x * this.x + this.y * this.y;
  }

  this.length = function()
  {
    return Math.sqrt(this.lengthSquared());
  }
  this.scale = function(s)
  {
    return new v2d(this.x * s,this.y * s);
  }
  this.scaleEq = function(s)
  {
    this.x *= s;
    this.y *= s;
  }
  
  this.minus = function(v)
  {
    return new v2d(this.x-v.x, this.y-v.y);
  }
  
  this.minusEq = function(v)
  {
    this.x -= v.x;
    this.y -= v.y;
  }
  this.plus = function(v)
  {
    return new v2d(this.x += v.x,this.y += v.y);
  }
  this.plusEq = function(v)
  {
    this.x += v.x;
    this.y += v.y;
  }  

  this.dot = function(v)
  {
    return(this.x * v.x + this.y * v.y);
  }

  this.normalizeEq = function()
  {
    this.scaleEq(1/this.length());
  }
}


