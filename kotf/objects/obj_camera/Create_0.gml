width = 254;
height = 224;
targetYOffset = -32;

camera = camera_create_view(0, 0, width, height);
followTarget = obj_keeper;
targetX = x;
targetY = y;
realX = x;
realY = y;

roomInitialized = false;