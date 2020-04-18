/// @description 
realX += (targetX - realX)/8;
realY += (targetY - realY)/4;

x = round(clamp(realX, (width/2), room_width-(width/2)));
y = round(clamp(realY, (height/2), room_height-(height/2)));

if (followTarget != noone) {
	targetX = followTarget.x;
	targetY = followTarget.y + targetYOffset;
}

// Snap the camera into it's target location once, when the room starts
if (!roomInitialized) {
	realX = targetX;
	realY = targetY + targetYOffset;
	roomInitialized = true;
}

var viewMatrix = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera, viewMatrix);